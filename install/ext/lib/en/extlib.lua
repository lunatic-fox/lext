--- @author: Josélio Júnior <joseliojrx25@gmail.com>
--- @copyright: Josélio Júnior 2022
--- @license: MIT

-- MIT License

-- Copyright (c) 2022 Josélio Júnior

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

---Split a string into substrings using the specified separator and return them as a table.
---@param str string A string to be splitted.
---@param separator? string A string that identifies character or characters to use in separating the string. If omitted, a single-element table containing the entire string is returned.
---@param limit? number A value used to limit the number of elements returned in the table.
---@return table
---@nodiscard
---[Online documentation](https://github.com/joseliojunior/lua-extensions/tree/main/doc#string-split)
function string.split(str, separator, limit) end

---Replaces text in a string, using a search string.
---@param str string
---@param searchValue? string A string to search for.
---@param replaceValue? string A string containing the text to replace for every successful match of `searchValue`.
---@return string
---@nodiscard
---[Online documentation](https://github.com/joseliojunior/lua-extensions/tree/main/doc#string-replace)
function string.replace(str, searchValue, replaceValue) end

---Returns a section of a string.
---@param str string
---@param i? number The index to the beginning of the specified portion of string.
---@param j? number The end to the beginning of the specified portion of string. If this value is not specified, the substring continues to the end of string.
---@return string
---##    Examples
---    ('fiancé!'):slice(3, 5) -> 'anc'
---    ('fiancé!'):slice(3, 6) -> 'ancé'
---    ('fiancé!'):slice(6, 6) -> 'é'
---    ('fiancé!'):slice(5)    -> 'cé!'
---@nodiscard
---[Online documentation](https://github.com/joseliojunior/lua-extensions/tree/main/doc#string-slice)
function string.slice(str, i, j) end

---Return the accumulated result of all elements in the table `list`.
---@param list table A table of numbers and/or number-like elements.
---##    Examples
---    { '8', '.4', 6.3, true, false } => { 8, 0.4, 6.3, 1, 0 }
---     { '8', '.4', 6.3, nil, false } => nil
---              { 9, '.4', 'str', 5 } => nan
---@param operator "'+'"|"'-'"|"'*'"|"'/'"|"'//'"|"'%'"|"'^'" The operation symbol to be executed.
---@return number
---@nodiscard
---[Online documentation](https://github.com/joseliojunior/lua-extensions/tree/main/doc#table-reduce)
function table.reduce(list, operator) end

---Reverse the elements order of `list` table. This method mutates `list` and returns a reference to the same `list` table.
---@param list table A table of elements.
---##    Examples
---    { '8', '.4', 6.3, true, false } => { false, true, 6.3, '.4', '8' }
---     { '8', '.4', 6.3, nil, false } => { '8', '.4', 6.3, nil, false }
---@return table
---[Online documentation](https://github.com/joseliojunior/lua-extensions/tree/main/doc#table-reverse)
function table.reverse(list) end