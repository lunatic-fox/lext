--- @author: Josélio Júnior <joseliojrx25@gmail.com>
--- @copyright: Josélio Júnior 2022
--- @license: MIT

---Split a string into substrings using the specified separator and return them as a table.
---@param str string A string to be splitted.
---@param separator? string A string that identifies character or characters to use in separating the string. If omitted, a single-element table containing the entire string is returned.
---@param limit? number A value used to limit the number of elements returned in the table.
---@return table
---@nodiscard
---[Online documentation](https://github.com/joseliojunior/lua-extensions/tree/main/doc#string-split)
function string.split(str, separator, limit) end

---Return the accumulated result of all elements in the table `list`.
---@param list table A table of numbers and/or number-like elements.
---    Examples
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
---    Examples
---    { '8', '.4', 6.3, true, false } => { false, true, 6.3, '.4', '8' }
---     { '8', '.4', 6.3, nil, false } => { '8', '.4', 6.3, nil, false }
---@return table
---@nodiscard
---[Online documentation](https://github.com/joseliojunior/lua-extensions/tree/main/doc#table-reverse)
function table.reverse(list) end