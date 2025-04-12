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

return M
