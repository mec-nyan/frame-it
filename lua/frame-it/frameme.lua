local M = {}

local comment = require "frame-it.comment"
local border = require "frame-it.borders"
local columns = require "frame-it.columns"

-- ╭─────────╮
-- │ FrameMe │
-- ╰─────────╯
--
-- FrameMe add a frame around your comment according to selected style and detected language.
-- It's meant mainly for internal use.
function M.FrameMe(style, ft)
	local hline, vline, topleft, topright, botleft, botright = border.get_frame(style)

	local line = vim.api.nvim_get_current_line()

	local comment_marker, comment_match = comment.get_comment_style(ft)
	if comment_marker == nil then
		print("Filetype not supported", ft)
		return
	end

	if line:match(comment_match) then
		local prefix = line:match(comment_match)
		local text = line:gsub(comment_match, "")
		local width = columns.get_columns(text) + 1 -- Extra space at the end.

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

function FrameMeVisual()
	-- local style = "rounded"
	local ft = "lua"

	local comment_marker, comment_match = comment.get_comment_style(ft)
	if comment_marker == nil then
		print("Filetype not supported", ft)
		return
	end

	-- local hline, vline, topleft, topright, botleft, botright = border.get_frame(style)

	local start_pos = vim.fn.getpos("'<")[2]
	local end_pos = vim.fn.getpos("'>")[2]

	local lines = vim.api.nvim_buf_get_lines(0, start_pos - 1, end_pos, false)

	local prefixes = {}
	local text_lines = {}
	-- Check that every line is a comment.
	for i, line in ipairs(lines) do
		if not line:match(comment_match) then
			print "Not a comment."
			return
		end
		local prefix = line:match(comment_match)
		local text = line:gsub(comment_match, "")
		prefixes[i] = prefix
		text_lines[i] = text
	end

	-- Get the maximum width.
	local width = 0
	for _, line in ipairs(text_lines) do
		local cols = columns.get_columns(line)
		if cols > width then
			width = cols
		end
	end

	-- Add a space at the end.
	width = width + 1

	-- Right pad the strings
	for i, line in ipairs(text_lines) do
		text_lines[i] = string.format(string.format("%%-%ds", width), line)
	end

	-- Frame'em
	for i, line in ipairs(text_lines) do
		lines[i] = prefixes[i] .. "@" .. line .. "@"
	end

	vim.api.nvim_buf_set_lines(0, start_pos - 1, end_pos, false, lines)
end

return M
