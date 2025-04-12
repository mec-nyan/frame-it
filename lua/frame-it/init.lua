local frameme = require "frame-it.frameme"
local borders = require "frame-it.borders"

-- Line-wise (normal mode) functions:

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

-- Block-wise (visual mode) functions:

-- ┌────────────────────┐
-- │ FrameMeSharpVisual │
-- └────────────────────┘
function FrameMeSharpVisual()
	frameme.FrameMeVisual(borders.sharp, vim.bo.filetype)
end

-- ╭──────────────────────╮
-- │ FrameMeRoundedVisual │
-- ╰──────────────────────╯
function FrameMeRoundedVisual()
	frameme.FrameMeVisual(borders.rounded, vim.bo.filetype)
end

-- ┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐
-- ┆ FrameMeDottedVisual ┆
-- └╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘
function FrameMeDottedVisual()
	frameme.FrameMeVisual(borders.dotted, vim.bo.filetype)
end

-- ╭╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╮
-- ┆ FrameMeDottedRoundedVisual ┆
-- ╰╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╯
function FrameMeDottedRoundedVisual()
	frameme.FrameMeVisual(borders.dotted_rounded, vim.bo.filetype)
end

-- ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
-- ┇ FrameMeDottedFatVisual ┇
-- ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛
function FrameMeDottedFatVisual()
	frameme.FrameMeVisual(borders.dotted_fat, vim.bo.filetype)
end

-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ FrameMeFatVisual ┃
-- ┗━━━━━━━━━━━━━━━━━━┛
function FrameMeFatVisual()
	frameme.FrameMeVisual(borders.fat, vim.bo.filetype)
end

-- ╔═════════════════════╗
-- ║ FrameMeDoubleVisual ║
-- ╚═════════════════════╝
function FrameMeDoubleVisual()
	frameme.FrameMeVisual(borders.double, vim.bo.filetype)
end

M = {
	__FrameMe = function(style, lang) frameme.FrameMe(style, lang) end,
	FrameMeSharp = FrameMeSharp,
	FrameMeRounded = FrameMeRounded,
	FrameMeDotted = FrameMeDotted,
	FrameMeDottedRounded = FrameMeDottedRounded,
	FrameMeDottedFat = FrameMeDottedFat,
	FrameMeFat = FrameMeFat,
	FrameMeDouble = FrameMeDouble,

	FrameMeSharpVisual = FrameMeSharpVisual,
	FrameMeRoundedVisual = FrameMeRoundedVisual,
	FrameMeDottedVisual = FrameMeDottedVisual,
	FrameMeDottedRoundedVisual = FrameMeDottedRoundedVisual,
	FrameMeDottedFatVisual = FrameMeDottedFatVisual,
	FrameMeFatVisual = FrameMeFatVisual,
	FrameMeDoubleVisual = FrameMeDoubleVisual,
}

return M
