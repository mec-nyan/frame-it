local M = {}

-- get_comment_style selects the appropiate comment initialiser for the current language.
function M.get_comment_style(ft)
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

return M
