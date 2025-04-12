local M = {}

local bit = require "bit"
local ffi = require "ffi"

-- utf8_to_codepoint converts a UTF-8 character (bytes) to its corresponding Unicode code point.
local function utf8_to_codepoint(s)
	local b1 = string.byte(s, 1)

	if b1 < 0x80 then
		return b1
	elseif b1 < 0xE0 then
		local b2 = string.byte(s, 2)
		return bit.bor(
			bit.lshift(bit.band(b1, 0x1F), 6),
			bit.band(b2, 0x3F)
		)
	elseif b1 < 0xF0 then
		local b2, b3 = string.byte(s, 2, 3)
		return bit.bor(
			bit.lshift(bit.band(b1, 0x0F), 12),
			bit.lshift(bit.band(b2, 0x3F), 6),
			bit.band(b3, 0x3F)
		)
	else
		local b2, b3, b4 = string.byte(s, 2, 4)
		return bit.bor(
			bit.lshift(bit.band(b1, 0x07), 18),
			bit.lshift(bit.band(b2, 0x3F), 12),
			bit.lshift(bit.band(b3, 0x3F), 6),
			bit.band(b4, 0x3F)
		)
	end
end

-- utf8_iter iterates over a sequence of codepoint instead of a sequence of bytes.
local function utf8_iter(str)
	local i = 1
	local len = #str
	return function()
		if i > len then return nil end

		local c = string.byte(str, i)
		local n = (c < 0x80) and 1
			or (c < 0xE0) and 2
			or (c < 0xF0) and 3
			or 4

		local substr = str:sub(i, i + n - 1)
		i = i + n
		return substr, utf8_to_codepoint(substr)
	end
end

-- good old wcwidth gets the printable width of a codepoint (wchar_t).
local function wcwidth(codepoint)
	os.setlocale("en_US.UTF-8", "all")
	ffi.cdef "int wcwidth(wchar_t wc);"
	return ffi.C.wcwidth(codepoint)
end

-- Finally, get_columns get_columns the number of columns that the current string occupies.
-- Uff!
function M.get_columns(str)
	local count = 0
	for _, codepoint in utf8_iter(str) do
		count = count + wcwidth(codepoint)
	end
	return count
end

return M
