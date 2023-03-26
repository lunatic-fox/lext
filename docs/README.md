# Documentation

+ [**string**](#string)
  + [**string:split**](#stringsplit)
  + [**string:split.join**](#stringsplitjoin)
  + [**string:split.map**](#stringsplitmap)
  + [**string:slice**](#stringslice)
  + [**string:replace**](#stringreplace)
  + [**string:tolowercase**](#stringtolowercase)
  + [**string:touppercase**](#stringtouppercase)
  + [**string:reverse**](#stringreverse)
+ [**array**](#array)
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
  :split(separator: string?, limit: number?): table
    .join(separator: string?): string
    .map(callback_fn(e: string?, i: number?, a: table?): string): table
  :slice(i: number?, j: number?): string
  :replace(search_value: string, replace_value: string): string
  :tolowercase(): string
  :touppercase(): string
  :reverse(): string
```

<br/><br/>

### string:split
```ts
string:split(separator: string?, limit: number?): table
```

Splits a string into substrings using the specified separator and return them as a table.

- `str` - A string to be splitted.
- `separator` - A string that identifies the character or characters to use in separating the string. If omitted, a single-element table containing the entire string is returned.
- `limit` - A value used to limit the number of elements returned in the table.

#### *Split text.*
```lua
require 'lext'
local text = 'Hello world!'
text = text:split' '            -- { 'Hello', 'world!' }

print(table.concat(text, ', ')) -- Hello, world!
```

#### *Split text and limit the returned items.*
```lua
require 'lext'
local text = 'Hello world! Nothing'
text = text:split(' ', 2)       -- { 'Hello', 'world!' }

print(table.concat(text, ', ')) -- Hello, world!
```

#### *Split by text.*
```lua
require 'lext'
local text = 'Thecut-hereperfectcut-heremoonlight!'
text = text:split('cut-here')  -- { 'The', 'perfect', 'moonlight!' }

print(table.concat(text, ' ')) -- The perfect moonlight!
```

#### *Magic symbols aren't a problem!*
```lua
require 'lext'
local text = '?*%+*%The%perfect*%[(MOONLIGHT)].*%+^'
text = text:split('*%')       --[[
  { '?', '+', 'The%perfect', '[(MOONLIGHT)].', '+^' }
]]

print(table.concat(text, ', ')) --[[
  ?, +, The%perfect, [(MOONLIGHT)]., +^
]]
```

#### *Even numbers or booleans aren't a problem!*
```lua
require 'lext'
local text = 'The20perfecttrue20moonlight!'
text = text:split(20)           -- { 'The', 'perfecttrue', 'moonlight!' }

print(table.concat(text, ', ')) -- The, perfecttrue, moonlight!


text = table.concat(text, ' ')
text = text:split(true)         -- { 'The', 'perfect', 'moonlight!' }

print(table.concat(text, ''))   -- The perfect moonlight!
```


<br/><br/>


### string:split.join
```ts
string:split(separator: string?, limit: number?): table
  .join(separator: string?): string
```

Joins the previous generated table into a string.

- `separator` - A string that identifies the character or characters to use to join the string. If omitted, a table of elements will be separated by comma.


#### *Straightforward join instead of `table.concat()`.*
```lua
require 'lext'
local text = 'Hello world!'
text = text:split' ' -- { 'Hello', 'world!' }

print(text.join', ') -- Hello, world!
```


<br/><br/>



### string:split.map
```ts
string:split(separator: string?, limit: number?): table
  .map(callback_fn(e: string?, i: number?, a: table?): string): table
```

Calls the callback function on each string table item, returning a table with the results.

- `e` - Matches the string item.
- `i` - Matches the item index number.
- `a` - Matches the string table itself.

#### *If you want to edit your splitted string, here's the method.*
```lua
require 'lext'
local text = 'abcdef'

text = text:split''
  .map(function (e, i, a)
    local back_i = (#a + 1) - i
    return 'element: ' .. e ..
      ', index: ' .. i ..
      ', array[' .. back_i .. ']: ' .. a[back_i]
  end)

print(text.join'\n') --[[
  element: a, index: 1, array[6]: f
  element: b, index: 2, array[5]: e
  element: c, index: 3, array[4]: d
  element: d, index: 4, array[3]: c
  element: e, index: 5, array[2]: b
  element: f, index: 6, array[1]: a
]]
```

#### And if you want to split the string even more...
```lua
require 'lext'
local apples = 'apple maçã manzana epel μήλο яблоко りんご 蘋果'
apples = apples:split' ' --[[ 
  'apple', 'maçã', manzana, 'epel',
  'μήλο', 'яблоко', 'りんご', '蘋果'
]]

apples = apples.map(function (e)
  local chars = e:split''.join', '
  return chars
end)

print(apples.join'\n') --[[ 
  a, p, p, l, e
  m, a, ç, ã
  m, a, n, z, a, n, a
  e, p, e, l
  μ, ή, λ, ο
  я, б, л, о, к, о
  り, ん, ご
  蘋, 果
]]
```

<br/><br/>


### string:slice
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
```

<div align="center">
  <b>⚠ Tables with `nil` items are not allowed! ⚠</b>
</div>

<br/><br/>

### array.join
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

<div align="center">

**Made with ❤️**

**Lunatic Fox - Josélio Júnior - 2023**
</div>