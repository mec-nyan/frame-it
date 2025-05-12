# Frame it!


A simple **Vim/Neovim** plugin to highlight comments by "framing" them with different styles.

> NOTE: The **Vim** version is lagging a little bit behind!

I use it mainly to separate logic sections in a single file of code and for headings.

## ToC

- [Installation](#installation)
- [Basic usage](#basic-usage)
- [Examples](#examples)
- [API](#api)

## Installation

### Using Lazy 

Example in `.config/nvim/lua/plugins/frameit.lua`

```lua
return {
	-- ╭────────────────────────────╮
	-- │ This is how you use it! 💖 │
	-- ╰────────────────────────────╯
	"mec-nyan/frame-it",
}
```

### Using Vim/Neovim native packages

#### Neovim

```sh
git clone https://github.com/mec-nyan/frame-it.git .config/nvim/pack/frameit/start/frameit
```

#### Vim

```sh
git clone https://github.com/mec-nyan/frame-it.git .vim/pack/frameit/start/frameit
```

That way you can keep it updated!

Or if you want, you can just put it in `.vim/plugin/frame-it.vim` or even just source the file.

### Both

Open the corresponding file (the Lua version won't work with Vim) and just:

```vim
:source %
```


## Basic usage:

> This plugin doesn't provide any keymaps, so it won't interfere with yours.

It's recommended that you provide your key bindings in your configuration.
The examples below show how to simply call these functions.


_Write a comment:_
```cpp
// Something important begins here.
```

_With the cursor on that line, call one of the framing functions._

```vim
:FrameMeRounded<CR>
```

_Result:_
```cpp
// ╭──────────────────────────────────╮
// │ Something important begins here. │
// ╰──────────────────────────────────╯
```

## Examples

### TODO:

Replace these examples with images, since the font in Github are not the best.


Before:

```lua
-- This function does something.
function do_something()
    ...
end
```

After:

```lua
-- ╭───────────────────────────────╮
-- │ This function does something. │
-- ╰───────────────────────────────╯
function do_something()
    ...
end
```

_It works in visual mode too!_

Before:

```lua
-- do_something is a function
-- that does something.
-- that's it!
function do_something()
    ...
end
```

_Select the lines you want to "frame"_

After:

```lua
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ do_something is a function ┃
-- ┃ that does something.       ┃
-- ┃ that's it!                 ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
function do_something()
    ...
end
```

Before:

```go
// The following stuff is related.

// FrameIt does a thing...
func (f *Frame) FrameIt() string {
    // ...
}
```

After:

```go
// ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
// ┃ The following stuff is related. ┃
// ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

// FrameIt does a thing...
func (f *Frame) FrameIt() string {
    // ...
}
```

Before:

```python
# Warning! There will be dragons 🐉!

def some_func(n: int) -> bool:
    '''some_func takes an int and returns a bool (duh!)'''

    pass
```

After:

```python
# ╔════════════════════════════════════╗
# ║ Warning! There will be dragons 🐉! ║
# ╚════════════════════════════════════╝

def some_func(n: int) -> bool:
    '''some_func takes an int and returns a bool (duh!)'''

    pass
```


## API

The following commands are provided. They work in both NORMAL *and* VISUAL modes.


### _Draw a frame with:_

- FrameMeSharp (_sharp corners_)
- FrameMeRounded (_rounded corners_)
- FrameMeDotted (_dotted outline_)
- FrameMeDottedRounded (_dotted outline and rounded corners_)
- FrameMeDottedFat (_dotted, thick outline_)
- FrameMeFat (_thick outline_)
- FrameMeDouble (_double outline_)

## Lua API

You can access the lua functions directly if you want (i.e. to create a custom command or mapping).

```lua
local frame_it = require "frame-it"

frame_it.__FrameMe("fat", "cpp")
```

The module exports the following functions:

- FrameMeSharp (_sharp corners_)
- FrameMeRounded (_rounded corners_)
- FrameMeDotted (_dotted outline_)
- FrameMeDottedRounded (_dotted outline and rounded corners_)
- FrameMeDottedFat (_dotted, thick outline_)
- FrameMeFat (_thick outline_)
- FrameMeDouble (_double outline_)
- \_\_FrameMe (_generic_)
- \_\_FrameMeVisual (_generic_)

They all accept an optional argument: "opts: (table)". Thay way we can call them in both NORMAL and VISUAL modes.

The functions that start with "__" are mainly provided for testing purposes (hence their name).

The function `FrameMe(style: string, lang: string[, opts: table])` is the base of the others and serves also for testing.

Its first argument is a (constant) string that selects the style:
- sharp
- rounded
- dotted
- dotted_rounded
- dotted_fat
- fat
- double

The second argument (also a string) is the file type:
- c, c++, go, rust
- lua
- python, bash, sh
- etc

The third argument is an optional table. Neovim will fill this parameter when invoking the function via command.

## TODO / Fixes

- [Fixed] In visual mode, support for wide chars is broken (because of `string.format(...)`)
- Keep the **Vim** version updated.
- [Fixed] Range error in visual mode.
- [Fixed] Use the same names/commands in normal and visual modes.
