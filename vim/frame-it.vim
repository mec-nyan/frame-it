" frame-it.vim
"
" Draw a nice frame around your comments so you can use them
" to separate or highlight sections of code.
"
" It works with:
" - Lua ("--")
" - C, C++, Rust, Go, (Java?) ("//")
" - Python, Bash, Sh ("#")
"
" But it's easy to add more!
"
" It uses Unicode (UTF-8) so it will render well everywhere.
" Unless for some reason your terminal, editor, IDE or whatever you're using to display
" your code doesn't support Unicode but come on... it's 2025 and I won't fall back to ASCII...
"
" Examples:
"
" -- A regular comment. Nothing to see here.
"
" -- ╭────────────────────────╮
" -- │ Now this looks better! │
" -- ╰────────────────────────╯
"
" // ┏━━━━━━━━━━━━━━━━━━┓
" // ┃ What about this? ┃
" // ┗━━━━━━━━━━━━━━━━━━┛
"
" # ╔══════════════════════════════════════════╗
" # ║ Maybe this is what you're looking for... ║
" # ╚══════════════════════════════════════════╝
"
" TODO: Multi line comment (using vim selection).
"
" TODO: Add something fun like:
"
"   ▗▄▖               ▗▄▖               ▗▄▖               ▗▄▖
"  ▟███▙             ▟███▙             ▟███▙             ▟███▙
" ▐▛ ▜▛ ▘           ▐▛ ▜▛ ▘           ▐▛ ▜▛ ▘           ▐▛ ▜▛ ▘
" █▙▝▟▙▝▟           █▙▝▟▙▝▟           █▙▝▟▙▝▟           █▙▝▟▙▝▟
" ███████           ███████           ███████           ███████
" ▛▝█ █▘▜           ▛▝█ █▘▜           ▛▝█ █▘▜           ▛▝█ █▘▜
"
" Or icons like  ,  , or 💖, etc
"
" Enjoy!


let s:sharp = 'sharp'
let s:rounded = 'rounded'
let s:dotted = 'dotted'
let s:dotted_rounded = 'dotted_rounded'
let s:dotted_fat = 'dotted_fat'
let s:fat = 'fat'
let s:double = 'double'

function! GetFrame(style)
	let l:hline_thin = "─"
	let l:hline_dotted = "╌"
	let l:hline_fat = "━"
	let l:hline_dotted_fat = "╍"
	let l:hline_double = "═"

	let l:vline_thin = "│"
	let l:vline_dotted = "┆"
	let l:vline_fat = "┃"
	let l:vline_dotted_fat = "┇"
	let l:vline_double = "║"

	let l:topleft_sharp = "┌"
	let l:topleft_rounded = "╭"
	let l:topleft_fat = "┏"
	let l:topleft_double = "╔"

	let l:topright_sharp = "┐"
	let l:topright_rounded = "╮"
	let l:topright_fat = "┓"
	let l:topright_double = "╗"

	let l:botleft_sharp = "└"
	let l:botleft_rounded = "╰"
	let l:botleft_fat = "┗"
	let l:botleft_double = "╚"

	let l:botright_sharp = "┘"
	let l:botright_rounded = "╯"
	let l:botright_fat = "┛"
	let l:botright_double = "╝"

	if a:style == s:sharp
		return [ hline_thin, vline_thin, topleft_sharp, topright_sharp, botleft_sharp, botright_sharp ]
	elseif a:style == s:rounded
		return [ hline_thin, vline_thin, topleft_rounded, topright_rounded, botleft_rounded, botright_rounded ]
	elseif a:style == s:dotted
		return [ hline_dotted, vline_dotted, topleft_sharp, topright_sharp, botleft_sharp, botright_sharp ]
	elseif a:style == s:dotted_rounded
		return [ hline_dotted, vline_dotted, topleft_rounded, topright_rounded, botleft_rounded, botright_rounded ]
	elseif a:style == s:fat
		return [ hline_fat, vline_fat, topleft_fat, topright_fat, botleft_fat, botright_fat ]
	elseif a:style == s:dotted_fat
		return [ hline_dotted_fat, vline_dotted_fat, topleft_fat, topright_fat, botleft_fat, botright_fat ]
	elseif a:style == s:double
		return [ hline_double, vline_double, topleft_double, topright_double, botleft_double, botright_double ]
	endif

endfunction

" ╭────────────────────────────────╮
" │ FrameMe is the generic framer. │
" ╰────────────────────────────────╯
function! FrameMe(style, ft)
	let [ l:hline, l:vline, l:topleft, l:topright, l:botleft, l:botright ] = GetFrame(a:style)

	let l:line = getline(".")

	let l:comment_init = ""

	if a:ft == "lua"
		let comment_init = "--"
	elseif a:ft == "c" || a:ft == "cpp" || a:ft == "rust" || a:ft == "go"
		let comment_init = "//"
	elseif a:ft == "bash" || a:ft == "sh" || a:ft == "python"
		let comment_init = "#"
	elseif a:ft == "vim"
		let comment_init = '"' 
	else
		echo "Lang not supported"
		return
	endif

	if line !~ "^" .. l:comment_init
		echo "it is NOT a comment"
		return
	endif

	let l:text = ""
	let l:text = substitute(l:line, '^' .. comment_init .. '\s*', '', '')
	let l:width = len(l:text) + 2

	let comment_init = comment_init .. " "
	let l:top = comment_init .. topleft .. repeat(hline, l:width) .. topright
	let l:mid = comment_init .. vline .. " " .. l:text .. " " .. vline
	let l:bot = comment_init .. botleft .. repeat(hline, l:width) .. botright

	call setline(".", l:top)
	call append(".", l:bot)
	call append(".", l:mid)

endfunction
