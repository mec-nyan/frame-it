# Frame it!


A simple **Vim/Neovim** plugin to highlight comments by "framing" them with different styles.

I use it mainly to separate logic sections in a single file of code and for headings.

## ToC

- [Examples](#examples)
- [Installation](#installation)
- [Basic usage](#basic-usage)
- [API](#api)

## Examples

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
# Warning! There will be dragons!

def some_func(n: int) -> bool:
    '''some_func takes an int and returns a bool (duh!)'''

    pass
```

After:

```python
# ╔═════════════════════════════════╗
# ║ Warning! There will be dragons! ║
# ╚═════════════════════════════════╝

def some_func(n: int) -> bool:
    '''some_func takes an int and returns a bool (duh!)'''

    pass
```

## Installation

### Using Lazy 

Example in `.config/nvim/lua/plugins/frameit.lua`

```lua
return {
	-- ╭────────────────────────────╮
	-- │ This is how you use it! 💖 │
	-- ╰────────────────────────────╯
	"mec-nyan/frame-it",
	config = function ()
		require"frame-it"
	end
}
```

### Using Vim/Neovim native packages

#### Vim

```sh
git clone https://github.com/mec-nyan/frame-it.git .vim/pack/frameit/start/frameit
```

That way you can keep it updated!

Or if you want, you can just put it in `.vim/plugin/frame-it.vim` or even just source the file.

#### Neovim

```sh
git clone https://github.com/mec-nyan/frame-it.git .config/nvim/pack/frameit/start/frameit
```

And then from **Neovim**:

```lua
:lua require "frame-it"
```

If you just want to try it out, you can just source the file (either one!)

```vim
:source frame-it.lua
```

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
_i.e. if using the **Lua** version:_

```vim
:lua FrameMeRounded()<CR>
```

_Result:_
```cpp
// ╭──────────────────────────────────╮
// │ Something important begins here. │
// ╰──────────────────────────────────╯
```


## API

The following functions are provided:

_Draw a frame with:_

- FrameMeSharp() _sharp corners_
- FrameMeRounded() _rounded corners_
- FrameMeDotted() _dotted outline_
- FrameMeDottedRounded() _dotted outline and rounded corners_
- FrameMeDottedFat() _dotted, thick outline_
- FrameMeFat() _thick outline_
- FrameMeDouble() _double outline_
- FrameMe(string, string) _generic_

The function _FrameMe(string, string)_ is the base of the others and serves also for testing.

Its first argument is a (constant) string that selects the style:
- "sharp"
- "rounded"
- "dotted"
- etc

The second argument is the file type:
- c, c++, go, rust
- lua
- python, bash, sh
- etc
