-- Borders provide the character set to draw the frame around your comment.

local M = {}


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

M.sharp = sharp
M.rounded = rounded
M.dotted = dotted
M.dotted_rounded = dotted_rounded
M.dotted_fat = dotted_fat
M.fat = fat
M.double = double

-- ╭───────────╮
-- │ get_frame │
-- ╰───────────╯
--
-- get_frame returns the character for the frame of the desired style.
function M.get_frame(style)
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

return M
