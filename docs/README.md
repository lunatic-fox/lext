# Documentation

+ [**string**](#string)
  + [**string:split**](#stringsplit)
  + [**string:slice**](#stringslice)
  + [**string:replace**](#stringreplace)
  + [**string:tolowercase**](#stringtolowercase)
  + [**string:touppercase**](#stringtouppercase)
  + [**string:reverse**](#stringreverse)
  + [**string:contains**](#stringcontains)
  + [**string:trim**](#stringtrim)
  + [**string:trimstart**](#stringtrimstart)
  + [**string:trimend**](#stringtrimend)
+ [**array**](#array)
  + [**Concatenating an array**](#concatenating-an-array)
  + [**array.slice**](#arrayslice)
  + [**array.join**](#arrayjoin)
  + [**array.filter**](#arrayfilter)
  + [**array.map**](#arraymap)
  + [**array.reduce**](#arrayreduce)
  + [**array.reverse**](#arrayreverse)

<hr>
<br/><br/>

### string
#### New powerful string methods to your Lua code!
```ts
string
  :split(separator: string?, limit: number?): array
  :slice(i: number?, j: number?): string
  :replace(search_value: string, replace_value: string): string
  :tolowercase(): string
  :touppercase(): string
  :reverse(): string
  :contains(substr: string): boolean
  :trim(): string
  :trimstart(): string
  :trimend(): string
```

<br/><br/>

### string:split

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:split(separator: string?, limit: number?): array
```

Splits a string into substrings using the specified separator and return them as an [array](#array).

- `str` - A string to be splitted.
- `separator` - A string that identifies the character or characters to use in separating the string. If omitted, a single-element table containing the entire string is returned.
- `limit` - A value used to limit the number of elements returned in the table.

#### *Split text.*
```lua
require 'lext'
local text = 'Hello world!'
text = text:split' '            -- { 'Hello', 'world!' }

print(text.join', ') -- Hello, world!
```

#### *Split text and limit the returned items.*
```lua
require 'lext'
local text = 'Hello world! Nothing'
text = text:split(' ', 2)       -- { 'Hello', 'world!' }

print(text.join', ') -- Hello, world!
```

#### *Split by text.*
```lua
require 'lext'
local text = 'Thecut-hereperfectcut-heremoonlight!'
text = text:split('cut-here')  -- { 'The', 'perfect', 'moonlight!' }

print(text.join' ') -- The perfect moonlight!
```

#### *Magic symbols aren't a problem!*
```lua
require 'lext'
local text = '?*%+*%The%perfect*%[(MOONLIGHT)].*%+^'
text = text:split('*%')       --[[
  { '?', '+', 'The%perfect', '[(MOONLIGHT)].', '+^' }
]]

print(text.join', ') --[[
  ?, +, The%perfect, [(MOONLIGHT)]., +^
]]
```

#### *Even numbers or booleans aren't a problem!*
```lua
require 'lext'
local text = 'The20perfecttrue20moonlight!'
text = text:split(20)           -- { 'The', 'perfecttrue', 'moonlight!' }

print(text.join', ') -- The, perfecttrue, moonlight!


text = table.concat(text, ' ')
text = text:split(true)         -- { 'The', 'perfect', 'moonlight!' }

print(text.join'')   -- The perfect moonlight!
```


<br/><br/>


### string:slice

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:slice(i: number?, j: number?): string
```

Returns a section of a string.

- `i` - The index to the beginning of the specified portion of string.
- `j` - The index to the end of the specified portion of string. If not specified, the substring continues until the end of the string.

#### Make perfect slices!
```lua
require 'lext'
local emoji = '😎🤩💀😺'

-- :sub() - Returns some unknown characters.
print(emoji:sub(2))       -- ���🤩💀😺
print(emoji:sub(2, 2))    -- �

-- :slice() - Cuts you a break returning what you expect.
print(emoji:slice(2))     -- 🤩💀😺
print(emoji:slice(2, 2))  -- 🤩
```

<br/><br/>


### string:replace

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:replace(search_value: string, replace_value: string): string
```

Replaces a substring in the string using a search string.

- `search_value` - A search string.
- `replace_value` - A string containing the substring to replace for each successful match of `search_value`.

#### Just replace!
```lua
require 'lext'
local text = '[Age: 50?]true'
text = text
  :replace(50, 31)    -- [Age: 31?]true
  :replace(true, '')  -- [Age: 31?]
  :replace('?', '')   -- [Age: 31]
  :replace('[', '')   -- Age: 31]
  :replace(']', '')   -- Age: 31
print(text)
```

<br/><br/>


### string:tolowercase

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:tolowercase(): string
```

Returns a copy of string with all letters in lowercase.

#### Polyglot whisper.
```lua
require 'lext'
local apples = 'APPLE MAÇÃ MANZANA EPEL ΜΉΛΟ ЯБЛОКО'

print(apples:lower())
-- apple maÇÃ manzana epel ΜΉΛΟ ЯБЛОКО

print(apples:tolowercase())
-- apple maçã manzana epel μήλο яблоко
```

<br/><br/>


### string:touppercase

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:touppercase(): string
```

Returns a copy of string with all letters in uppercase.

#### Polyglot shout.
```lua
require 'lext'
local apples = 'apple maçã manzana epel μήλο яблоко'

print(apples:upper())
-- APPLE MAçã MANZANA EPEL μήλο яблоко

print(apples:touppercase())
-- APPLE MAÇÃ MANZANA EPEL ΜΉΛΟ ЯБЛОКО
```

<br/><br/>


### string:reverse

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:reverse(): string
```

A powerful update to support UTF8 characters.

#### Message reversed successfully.
```lua
local text = '.ãhnam alep oãhc oa erovrá ad aíac ãçam A'

print(text:reverse()) --[[
  A ma�ã� ca��a da ��rvore ao ch��o pela manh��.
]]

require 'lext'
text = '.ãhnam alep oãhc oa erovrá ad aíac ãçam A'

print(text:reverse()) --[[
  A maçã caía da árvore ao chão pela manhã.
]]
```

<br/><br/>

### string:contains

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:contains(substr: string): boolean
```

Checks if the given string contains a certain substring. If `substr` string exists within the main string returns `true`, otherwise returns `false`.

- `substr` - A substring to search for.

[Original issue by](https://github.com/lunatic-fox/lua-extensions/issues/1) [@Panquesito7](https://github.com/Panquesito7)

#### Checking some emojis.
```lua
require 'lext'
local emoji = '😁😑😑😑👏😑😁'

print(emoji:contains'👏') -- true
print(emoji:contains'😅') -- false
```

<br/><br/>


### string:trim

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:trim(): string
```

Removes the leading and trailing white space line terminator characters from a string.

#### No trailing spaces.
```lua
require 'lext'
local text = '    word     '

print('<' .. text:trim() .. '>') -- <word>
```

<br/><br/>


### string:trimstart

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:trimstart(): string
```

Removes the leading white space characters from a string.

#### Snip spaces at the beginning.
```lua
require 'lext'
local text = '    word     '

print('<' .. text:trimstart() .. '>') -- <word     >
```

<br/><br/>


### string:trimend

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
string:trimend(): string
```

Removes the trailing white space line terminator characters from a string.

#### Snip spaces at the end.
```lua
require 'lext'
local text = '    word     '

print('<' .. text:trimend() .. '>') -- <    word>
```

<br/><br/>



<br/>
<hr/>
<br/>

### array
#### Simple tables and powerful methods with `array()`.
```ts
array(list: table)
  .join(separator: string?): string
  .slice(i: number?, j: number?): table
  .filter(callback_fn(e: string?, i: number?, a: table?): any): table
  .map(callback_fn(e: string?, i: number?, a: table?): any): table
  .reduce(operator: string): number
  .reverse(): table
  .flat(depth: number?): table
```

<div align="center">
  <b>⚠ Tables with `nil` items are not allowed! ⚠</b>
</div>

<br/><br/>

### Concatenating an array

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

#### `array` function is concatenable with another one using `..`, see the example below.
```lua
require 'lext'
local a = array{1, 2, 3} .. array{'a', 'b', 'c'}

print(a.join', ') -- 1, 2, 3, a, b, c
```

<br/><br/>


### array.join

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
array(list: table).join(separator: string?): string
```

Joins the items of the previous array into a string.
- `separator` - A string used to separate one array element from the next in the resulting string. If omitted, the array elements are separated with a comma.

#### Keep it together.
```lua
require 'lext'
local a = array{'text', 4, 5.6, false, true}.join'/' 

print(a) -- text/4/5.6/false/true
```

#### Implicit comma.
```lua
require 'lext'
local a = array{'text', 4, 5.6, false, true}.join()

print(a) -- text,4,5.6,false,true
```

<br/><br/>

### array.slice

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
array(list: table).slice(i: number?, j: number?): table
```

Returns a section of the array.
- `i` - The index to the beginning of the specified portion of the array.
- `j` - The index to the end of the specified portion of the array. If not specified, the element continues until the end of the array.

#### A perfect slice.
```lua
require 'lext'
local a = array{'text', 4, 5.6, false, true}
  .slice(2, 3)    -- { 4, 5.6 }

print(a.join', ') -- 4, 5.6
```

#### And some perfect slices.
```lua
require 'lext'
local a = array{'text', 4, 5.6, false, true}
  .slice(2) -- { 4, 5.6, false, true }
  .slice(2) -- { 5.6, false, true }
  .slice(2) -- { false, true }
  .slice(2) -- { true }

print(a.join', ') -- true
```

<br/><br/>


### array.map

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
array(list: table)
  .map(callback_fn(e: string?, i: number?, a: table?): any): table
```

Calls the callback function on each array item, returning a array with the results.
- `e` - Matches the item in array.
- `i` - Matches the item index number.
- `a` - Matches the array itself.

#### Everything plus 10.
```lua
require 'lext'
local a = array{1, 2, 3, 4, 5}
  .map(function (e)
    return e + 10
  end)

print(a.join', ') -- 11, 12, 13, 14, 15
```

#### All players are online.
```lua
require 'lext'
local a = array{
  {
    player = {
      id = 1,
      status = 'off'
    }
  },
  {
    player = {
      id = 2,
      status = 'on'
    }
  }
}.map(function (e)
  e.player.status = 'on'
  local res = array{
    'Player ',
    e.player.id,
    ' is ',
    e.player.status,
    'line'
  }.join''
  return res
end)

print(a.join'\n') --[[
  Player 1 is online
  Player 2 is online
]]
```

<br/><br/>


### array.filter

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
array(list: table)
  .filter(callback_fn(e: string?, i: number?, a: table?): any): table
```

Calls the callback function on each array item, returning a array with the items that meet the specified condition.
- `e` - Matches the item in array.
- `i` - Matches the item index number.
- `a` - Matches the array itself.

#### 16 or more.
```lua
require 'lext'
local a = array{18, 16, 15, 14, 21, 13, 23}
  .filter(function (e)
    return e >= 16
  end)

print(a.join', ') -- 18, 16, 21, 23
```

#### Select your starter.
```lua
require 'lext'
local a = array{
  {
    name = 'charmander',
    e_type = {'fire'}
  },
  {
    name = 'bulbasaur',
    e_type = {'grass', 'poison'}
  },
  {
    name = 'squirtle',
    e_type = {'water'}
  }
}.map(function (e)
  local e_type = array(e.e_type)
    .filter(function (f) return f == 'fire' end)
  return #e_type > 0 and e.name or nil
end)

print(a.join', ') -- charmander
```

<br/><br/>



### array.reduce

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
array(list: table)
  .reduce(operator: '+' | '-' | '*' | '/' | '^' | '%' | '//'): number
```

Returns the accumulated result of all the elements in the array.
- `operator` - The operation symbol to be executed:
  - `+` - addition
  - `-` - subtraction
  - `*` - multiplication
  - `/` - division
  - `//` - rounded division
  - `%` - modulo
  - `^` - exponentiation

#### 5 factorial.
```lua
require 'lext'
local a = array{1, 2, 3, 4, 5}.reduce'*'

print(a) -- 120
```

#### Average grades.
```lua
require 'lext'
local grades = array{7.7, 8, 8.5, 7.1, 9, 9.2}
local avg = grades.reduce'+' / #grades

print(avg) -- 8.25
```

#### Booleans are interpreted as numbers.
```lua
require 'lext'
local b_arr = array{true, false, true} -- { 1, 0, 1 }
  .reduce'+'

print(b_arr) -- 2
```

<br/><br/>

### array.reverse

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
array(list: table).reverse(): table
```

Reverses the elements order of the array.

#### Backward position.
```lua
require 'lext'
local pos = array{
  'first', 'second', 'third',
  'fourth', 'fifth', 'sixth'
}

print(pos.join' > ') --[[
  first > second > third > fourth > fifth > sixth
]]

pos.reverse()

print(pos.join' < ') --[[
  sixth < fifth < fourth < third < second < first
]]
```

<br/><br/>

### array.flat

<div align="right">

[${\scriptsize{\textsf{\textit{\color{aqua}Back to the top}}}}$](#documentation)
</div>

```ts
array(list: table).flat(depth: number?): table: table
```

Returns a new array with all sub-array elements concatenated into it recursively up to the specified depth.

#### Spread surface tables.
```lua
require 'lext'

local surface = array{
  1, 2, 3, { 4, 5, 6 }, 7, 8, 9
}

print(surface.join', ') --[[
  1, 2, 3, table: 0000026b6b4a0a20, 7, 8, 9
]]

surface = surface.flat()

print(surface.join', ') --[[
  1, 2, 3, 4, 5, 6, 7, 8, 9
]]
```

#### Going deeper.
```lua
require 'lext'

local deep = array{
  1, 2, 3, {
    'a', 'b', 'c', {
      'x', 'y', 'z', {
        4, true, false
      }
    }
  }, 0
}

print(deep.join', ') --[[
  1, 2, 3, table: 0000013ec51ad910, 0
]]

print(deep.flat().join', ') --[[
  1, 2, 3, a, b, c, table: 0000013ec51ad950, 0
]]

print(deep.flat(2).join', ') --[[
  1, 2, 3, a, b, c, x, y, z, table: 0000013ec51ad9d0, 0
]]

print(deep.flat(3).join', ') --[[
  1, 2, 3, a, b, c, x, y, z, 4, true, false, 0
]]
```

<div align="center">

**Made with ❤️**

**Lunatic Fox - Josélio Júnior - 2023**
</div>
