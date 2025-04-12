local frameme = require "frame-it.frameme"
local borders = require "frame-it.borders"

-- ┌──────────────┐
-- │ FrameMeSharp │
-- └──────────────┘
function FrameMeSharp()
	frameme.FrameMe(borders.sharp, vim.bo.filetype)
end

-- ╭────────────────╮
-- │ FrameMeRounded │
-- ╰────────────────╯
function FrameMeRounded()
	frameme.FrameMe(borders.rounded, vim.bo.filetype)
end

-- ┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐
-- ┆ FrameMeDotted ┆
-- └╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘
function FrameMeDotted()
	frameme.FrameMe(borders.dotted, vim.bo.filetype)
end

-- ╭╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╮
-- ┆ FrameMeDottedRounded ┆
-- ╰╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╯
function FrameMeDottedRounded()
	frameme.FrameMe(borders.dotted_rounded, vim.bo.filetype)
end

-- ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
-- ┇ FrameMeDottedFat ┇
-- ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛
function FrameMeDottedFat()
	frameme.FrameMe(borders.dotted_fat, vim.bo.filetype)
end

-- ┏━━━━━━━━━━━━┓
-- ┃ FrameMeFat ┃
-- ┗━━━━━━━━━━━━┛
function FrameMeFat()
	frameme.FrameMe(borders.fat, vim.bo.filetype)
end

-- ╔═══════════════╗
-- ║ FrameMeDouble ║
-- ╚═══════════════╝
function FrameMeDouble()
	frameme.FrameMe(borders.double, vim.bo.filetype)
end

M = {
	FrameMe = function(style, lang) frameme.FrameMe(style, lang) end,
	FrameMeSharp = FrameMeSharp,
	FrameMeRounded = FrameMeRounded,
	FrameMeDotted = FrameMeDotted,
	FrameMeDottedRounded = FrameMeDottedRounded,
	FrameMeDottedFat = FrameMeDottedFat,
	FrameMeFat = FrameMeFat,
	FrameMeDouble = FrameMeDouble,
}

return M
