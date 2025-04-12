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

require "frame-it"
