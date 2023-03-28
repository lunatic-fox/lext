---@diagnostic disable: duplicate-set-field, missing-return, lowercase-global, unused-local, duplicate-doc-alias
---@author: Lunatic Fox - Josélio Júnior <joseliojrx25@gmail.com>
---@copyright: Lunatic Fox - Josélio Júnior 2023
---@license: MIT

-- MIT License

-- Copyright (c) 2023 Josélio Júnior

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local join = table.concat

---Splits a string into substrings using the specified separator and return them as an `array`.
---@param str string A string to be splitted.
---@param separator? string A string that identifies the character or characters to use in separating the string. If omitted, a single-element table containing the entire string is returned.
---@param limit? number A value used to limit the number of elements returned in the table.
---@nodiscard
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#stringsplit)
function string.split(str, separator, limit) return array{} end


---Returns a section of a string.
---@param str string
---@param i? number The index to the beginning of the specified portion of string.
---@param j? number The index to the end of the specified portion of string. If not specified, the substring continues until the end of the string.
---@return string
---@nodiscard
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#stringslice)
function string.slice(str, i, j) end


---Returns a copy of string with all letters in lowercase. \
---@param str string
---@return string
---@nodiscard
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#stringtolowercase)
function string.tolowercase(str) end


---Returns a copy of string with all letters in uppercase. \
---@param str string
---@return string
---@nodiscard
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#stringtouppercase)
function string.touppercase(str) end


---Replaces a substring in the string using a search string.
---@param str string
---@param search_value? string A search string.
---@param replace_value? string A string containing the substring to replace for each successful match of `search_value`.
---@return string
---@nodiscard
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#stringreplace)
function string.replace(str, search_value, replace_value) end


---Removes the leading white space characters from a string.
---@param str string
---@return string
---@nodiscard
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#stringtrimstart)
function string.trimstart(str) end


---Removes the trailing white space line terminator characters from a string.
---@param str string
---@return string
---@nodiscard
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#stringtrimend)
function string.trimend(str) end


---Removes the leading and trailing white space line terminator characters from a string.
---@param str string
---@return string
---@nodiscard
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#stringtrim)
function string.trim(str) end


---Checks if the given string contains a certain substring.
---If `substr` string exists within the main string returns `true`, otherwise returns `false`.
---@param str string
---@param substr string A substring to search for.
---@return boolean
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#stringcontains)\
---[Original issue by](https://github.com/lunatic-fox/lua-extensions/issues/1) [@Panquesito7](https://github.com/Panquesito7)
function string.contains(str, substr) end


---Creates a new array.\
---**Array items can not be `nil`!** \
---@param list table
---@nodiscard
---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#array)
function array(list)
  local r = {table.unpack(list)}


  ---Reverses the elements order of the array. \
  ---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#arrayreverse)
  function r.reverse() return r end


  ---Returns a section of the array.
  ---@param i? number The index to the beginning of the specified portion of array.
  ---@param j? number The end to the beginning of the specified portion of array. If this value is not specified, the element continues to the end of array.
  ---@nodiscard
  ---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#arrayslice)
  function r.slice(i, j) return r end


  ---Joins the items of the previous array into a string.
  ---@param separator? string A string used to separate one array element from the next in the resulting string. If omitted, the array elements are separated with a comma.
  ---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#arrayjoin)
  function r.join(separator) return '' end


  ---Returns the accumulated result of all the elements in the array.
  ---@param operator "'+'"|"'-'"|"'*'"|"'/'"|"'//'"|"'%'"|"'^'" The operation symbol to be executed.
  ---@return number
  ---@nodiscard
  ---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#arrayreduce)
  function r.reduce(operator) end


  ---Matches the item in array.
  ---@alias mapfnelement any
  ---Matches the item index number.
  ---@alias mapfnindex number
  ---Matches the array itself.
  ---@alias mapfnpvtab table
  ---Calls the callback function on each array item, returning a array with the results. \
  ---@param callback_fn fun(e?: mapfnelement, i?: mapfnindex, a?: mapfnpvtab): any
  ---@nodiscard
  ---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#arraymap)
  r.map = function(callback_fn) return r end


  ---Matches the item in array.
  ---@alias filterfnelement any
  ---Matches the item index number.
  ---@alias filterfnindex number
  ---Matches the array itself.
  ---@alias filterfnpvtab table
  ---Calls the callback function on each array item, returning a array with the items that meet the specified condition. \
  ---@param callback_fn fun(e?: mapfnelement, i?: mapfnindex, a?: mapfnpvtab): boolean
  ---@nodiscard
  ---[Online documentation](https://github.com/lunatic-fox/lua-extensions/tree/main/docs/README.md#arrayfilter)
  r.filter = function(callback_fn) return r end


  return r
end
