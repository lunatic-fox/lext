[//]: # (author: Lunatic Fox - Josélio Júnior <joseliojrx25@gmail.com>)
[//]: # (copyright: Lunatic Fox - Josélio Júnior 2023)
[//]: # (license: MIT)

<div align="right">
  <a href="https://github.com/lunatic-fox/lunatic-fox/tree/main/crypto-donations">
    <img src="https://shields.io/badge/Crypto-Donations-098213?logo=bitcoin">
  </a>
  <a href="https://github.com/sponsors/lunatic-fox">
    <img title="Donation page" src="https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86">
  </a>
</div>

# Lua extensions &nbsp;![](https://gh-tags.vercel.app/api?lang=lua)


## Install

### Step 1
&emsp;Download the [**`install.tar`**](https://github.com/lunatic-fox/lua-extensions/raw/develop/install/install.tar) file (Lua extensions directory), extract to your `LUA_PATH` (path where Lua is installed).

&emsp;Or you can also open a terminal in the same path where you downloaded `install.tar` and run the command line below to unzip to your `LUA_PATH`.

```
tar -xf install.tar -C "<LUA_PATH>"
```

#### install.tar
> **SHA256:** *253ce657ec1a1678b33c25311f531f8b7671e0f9ffee2ce3abe0e946bf1b7cf2*\
> **MD5:**  *0b86ef8b9b430135d52971403143a622*
>
> #### Content
> - `lext.lua`
> - `lua-extensions/dependencies/erros.lua`
> - `lua-extensions/dependencies/short-methods.lua`
> - `lua-extensions/docs/extlib.lua`
> - `lua-extensions/array.lua`
> - `lua-extensions/string.lua`
> - `lua-extensions/LICENSE.lua`


### Step 2
&emsp;On VSCode you will need [**Lua Language Server**](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) extension installed.

### Step 3
&emsp;Still on VSCode open `Preferences: Open User Settings (JSON)` with the command:
- On Windows: `Ctrl + Shift + P` or `F1`
- On MacOS: `⇧⌘P` or `F1`

&emsp;Inside the main object of `settings.json` add the code below changing `<LUA_PATH>` to the path where Lua is installed on your machine.

```json
"Lua.workspace.library": [
  "<LUA_PATH>/lua-extensions/docs"
]
```

&emsp;All set! You're ready to go! 🚀

## Usage

&emsp;Require Lua extensions module in whatever lua file you want with the code below.

```lua
require 'lext'
```

&emsp;Let's see an example with `array.reduce()`.
```lua
require 'lext'
local t = array{1, 2, 3, 4, 5}.reduce'+'

print(t) -- 15
```

## [Documentation](./docs/README.md)
### UTF8 terminal
&emsp;If your terminal isn't displaying utf8 characters correctly, use the `utf8` option after the filename, just once. This argument triggers the `chcp 65001` command in the console.

```lua
-- heart.lua
print 'Coração' -- Cora├º├úo
```

```
> lua heart.lua utf8
```

<br/>

&emsp;Now let's take a look at some brief explanations about the powerful Lua extensions. You can also click on the method to see some examples in [documentation](./docs/README.md).

### [string](./docs/README.md#string)
- [`:split()`](./docs/README.md#stringsplit)\
*Splits a string into a string table.*

- [`:slice()`](./docs/README.md#stringslice)\
*Splices the string with UTF8 support.*

- [`:replace()`](./docs/README.md#stringreplace)\
*Replaces a string substring with no magic symbols.*

- [`:tolowercase()`](./docs/README.md#stringtolowercase)\
*Lowercase all with UTF8 support.*

- [`:touppercase()`](./docs/README.md#stringtouppercase)\
*Lowercase all with UTF8 support.*

- [`:reverse()`](./docs/README.md#stringreverse)\
*Reverses the string with UTF8 support.*

### [array](./docs/README.md#array)
- [`.join()`](./docs/README.md#arrayjoin)\
*Joins the table into a string.*

- [`.slice()`](./docs/README.md#arrayslice)\
*Slices the table.*

- [`.filter()`](./docs/README.md#arrayfilter)\
*Returns a table with items that meet a specified condition passed by a callback function.*

- [`.map()`](./docs/README.md#arraymap)\
*Modifies each item of the table by a callback function.*

- [`.reduce()`](./docs/README.md#arrayreduce)\
*Returns the accumulated result of all the elements in the array.*

- [`.reverse()`](./docs/README.md#arrayreverse)\
*Reverses the order of the elements in the array.*


<div align="center">

**Made with ❤️**

**Lunatic Fox - Josélio Júnior - 2023**
</div>
