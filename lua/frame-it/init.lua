local frameme = require "frame-it.frameme"
local borders = require "frame-it.borders"

local M = {}

-- Line-wise (normal mode) functions:

-- ┌──────────────┐
-- │ FrameMeSharp │
-- └──────────────┘
M.FrameMeSharp = function (opts)
	frameme.FrameMe(borders.sharp, vim.bo.filetype, opts)
end

-- ╭────────────────╮
-- │ FrameMeRounded │
-- ╰────────────────╯
M.FrameMeRounded = function (opts)
	frameme.FrameMe(borders.rounded, vim.bo.filetype, opts)
end

-- ┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐
-- ┆ FrameMeDotted ┆
-- └╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘
M.FrameMeDotted =function  (opts)
	frameme.FrameMe(borders.dotted, vim.bo.filetype, opts)
end

-- ╭╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╮
-- ┆ FrameMeDottedRounded ┆
-- ╰╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╯
M.FrameMeDottedRounded =function  (opts)
	frameme.FrameMe(borders.dotted_rounded, vim.bo.filetype, opts)
end

-- ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
-- ┇ FrameMeDottedFat ┇
-- ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛
M.FrameMeDottedFat =function  (opts)
	frameme.FrameMe(borders.dotted_fat, vim.bo.filetype, opts)
end

-- ┏━━━━━━━━━━━━┓
-- ┃ FrameMeFat ┃
-- ┗━━━━━━━━━━━━┛
M.FrameMeFat =function  (opts)
	frameme.FrameMe(borders.fat, vim.bo.filetype, opts)
end

-- ╔═══════════════╗
-- ║ FrameMeDouble ║
-- ╚═══════════════╝
M.FrameMeDouble =function  (opts)
	frameme.FrameMe(borders.double, vim.bo.filetype, opts)
end

M.__FrameMeVisual = function (style, lang, opts) frameme.FrameMeVisual(style, lang, opts) end

M.__FrameMe = function(style, lang, opts) frameme.FrameMe(style, lang, opts) end

return M
