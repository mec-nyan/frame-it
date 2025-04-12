--[[

Draw a nice frame around your comments so you can use them
to separate or highlight sections of code.

It works with:
	- Lua ("--")
	- C, C++, Rust, Go, (Java?) ("//")
	- Python, Bash, Sh ("#")

But it's easy to add more!

It uses Unicode (UTF-8) so it will render well everywhere.
Unless for some reason your terminal, editor, IDE or whatever you're using to display
your code doesn't support Unicode but come on... it's 2025 and I won't fall back to ASCII...

Examples:

-- A regular comment. Nothing to see here.

-- ╭────────────────────────╮
-- │ Now this looks better! │
-- ╰────────────────────────╯

// ┏━━━━━━━━━━━━━━━━━━┓
// ┃ What about this? ┃
// ┗━━━━━━━━━━━━━━━━━━┛

# ╔══════════════════════════════════════════╗
# ║ Maybe this is what you're looking for... ║
# ╚══════════════════════════════════════════╝

TODO: Multi line comment (using vim selection).

TODO: Add something fun like:

  ▗▄▖               ▗▄▖               ▗▄▖               ▗▄▖
 ▟███▙             ▟███▙             ▟███▙             ▟███▙
▐▛ ▜▛ ▘           ▐▛ ▜▛ ▘           ▐▛ ▜▛ ▘           ▐▛ ▜▛ ▘
█▙▝▟▙▝▟           █▙▝▟▙▝▟           █▙▝▟▙▝▟           █▙▝▟▙▝▟
███████           ███████           ███████           ███████
▛▝█ █▘▜           ▛▝█ █▘▜           ▛▝█ █▘▜           ▛▝█ █▘▜

Or icons like  ,  , or 💖, etc

Enjoy!

--]]

local bit = require("bit")

local hline_thin = "─"
local hline_dotted = "╌"
local hline_fat = "━"
local hline_dotted_fat = "╍"
local hline_double = "═"

local vline_thin = "│"
local vline_dotted = "┆"
local vline_fat = "┃"
local vline_dotted_fat = "┇"
local vline_double = "║"

local topleft_sharp = "┌"
local topleft_rounded = "╭"
local topleft_fat = "┏"
local topleft_double = "╔"

local topright_sharp = "┐"
local topright_rounded = "╮"
local topright_fat = "┓"
local topright_double = "╗"

local botleft_sharp = "└"
local botleft_rounded = "╰"
local botleft_fat = "┗"
local botleft_double = "╚"

local botright_sharp = "┘"
local botright_rounded = "╯"
local botright_fat = "┛"
local botright_double = "╝"

local sharp = 'sharp'
local rounded = 'rounded'
local dotted = 'dotted'
local dotted_rounded = 'dotted_rounded'
local dotted_fat = 'dotted_fat'
local fat = 'fat'
local double = 'double'

-- ╭───────────╮
-- │ get_frame │
-- ╰───────────╯
--
-- get_frame returns the character for the frame of the desired style.
local function get_frame(style)
	if style == sharp then
		return hline_thin, vline_thin, topleft_sharp, topright_sharp, botleft_sharp, botright_sharp
	elseif style == rounded then
		return hline_thin, vline_thin, topleft_rounded, topright_rounded, botleft_rounded, botright_rounded
	elseif style == dotted then
		return hline_dotted, vline_dotted, topleft_sharp, topright_sharp, botleft_sharp, botright_sharp
	elseif style == dotted_rounded then
		return hline_dotted, vline_dotted, topleft_rounded, topright_rounded, botleft_rounded, botright_rounded
	elseif style == fat then
		return hline_fat, vline_fat, topleft_fat, topright_fat, botleft_fat, botright_fat
	elseif style == dotted_fat then
		return hline_dotted_fat, vline_dotted_fat, topleft_fat, topright_fat, botleft_fat, botright_fat
	elseif style == double then
		return hline_double, vline_double, topleft_double, topright_double, botleft_double, botright_double
	end
end

local function get_comment_style(ft)
	local comment_marker
	local comment_match

	if ft == "lua" then
		comment_marker = "--"
		comment_match = "^%s*%-%-"
	elseif ft == "c" or ft == "cpp" or ft == "rust" or ft == "go" then
		comment_marker = "//"
		comment_match = "^%s*//"
	elseif ft == "bash" or ft == "sh" or ft == "python" then
		comment_marker = "#"
		comment_match = "^%s*#"
	elseif ft == "vim" then
		comment_marker = '"'
		comment_match = '^%s*"'
	end

	return comment_marker, comment_match
end

-- ┌──────────────────────────────┐
-- │ This now can handle this  ! │
-- └──────────────────────────────┘
-- But we still need a way to handle emoji (one char, two cols...)
function utf8len(line)
	local len = 0
	local i = 1
	local bytes = #line
	while i <= bytes do
		local c = line:byte(i)
		if c < 0x80 then
			i = i + 1
		elseif c < 0xE0 then
			i = i + 2
		elseif c < 0xF0 then
			i = i + 3
		elseif c < 0xF8 then
			i = i + 4
		else
			-- Invalid UTF-8 sequence
			return nil, "Invalid UTF-8 character at byte index " .. i
		end
		len = len + 1
	end
	return len
end

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
-- ╭─────────╮
-- │ FrameMe │
-- ╰─────────╯
--
-- FrameMe add a frame around your comment according to selected style and detected language.
-- It's meant mainly for internal use.
function FrameMe(style, ft)
	local hline, vline, topleft, topright, botleft, botright = get_frame(style)

	local line = vim.api.nvim_get_current_line()

	local comment_marker, comment_match = get_comment_style(ft)
	if comment_marker == nil then
		print("Filetype not supported", ft)
		return
	end

	if line:match(comment_match) then
		local prefix = line:match(comment_match)
		local text = line:gsub(comment_match, "")
		local width = utf8len(text) + 1 -- Extra space at the end.

		line = prefix .. " " .. vline .. text .. " " .. vline

		local top = prefix .. " " .. topleft .. string.rep(hline, width) .. topright
		local bot = prefix .. " " .. botleft .. string.rep(hline, width) .. botright

		vim.api.nvim_buf_set_lines(
			0,
			vim.api.nvim_win_get_cursor(0)[1] - 1,
			vim.api.nvim_win_get_cursor(0)[1],
			false,
			{ top, line, bot }
		)
	else
		print("Not a comment line" .. ft)
	end
end

-- ┌──────────────┐
-- │ FrameMeSharp │
-- └──────────────┘
function FrameMeSharp()
	FrameMe(sharp, vim.bo.filetype)
end

-- ╭────────────────╮
-- │ FrameMeRounded │
-- ╰────────────────╯
function FrameMeRounded()
	FrameMe(rounded, vim.bo.filetype)
end

-- ┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐
-- ┆ FrameMeDotted ┆
-- └╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘
function FrameMeDotted()
	FrameMe(dotted, vim.bo.filetype)
end

-- ╭╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╮
-- ┆ FrameMeDottedRounded ┆
-- ╰╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╯
function FrameMeDottedRounded()
	FrameMe(dotted_rounded, vim.bo.filetype)
end

-- ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
-- ┇ FrameMeDottedFat ┇
-- ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛
function FrameMeDottedFat()
	FrameMe(dotted_fat, vim.bo.filetype)
end

-- ┏━━━━━━━━━━━━┓
-- ┃ FrameMeFat ┃
-- ┗━━━━━━━━━━━━┛
function FrameMeFat()
	FrameMe(fat, vim.bo.filetype)
end

-- ╔═══════════════╗
-- ║ FrameMeDouble ║
-- ╚═══════════════╝
function FrameMeDouble()
	FrameMe(double, vim.bo.filetype)
end

M = {
	FrameMe = FrameMe,
	FrameMeSharp = FrameMeSharp,
	FrameMeRounded = FrameMeRounded,
	FrameMeDotted = FrameMeDotted,
	FrameMeDottedRounded = FrameMeDottedRounded,
	FrameMeDottedFat = FrameMeDottedFat,
	FrameMeFat = FrameMeFat,
	FrameMeDouble = FrameMeDouble,
}

return M
