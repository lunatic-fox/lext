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

local push = table.insert
local remove = table.remove
local pack = table.pack
local unpack = table.unpack

local typeError = function(msg) return '\n\n>\tTypeError: ' .. msg .. '\n' end

function table.reduce(list, operator)
  if type(list) == 'table' and #list <= 0 then
    return error('\n\n>\t"list" parameter can not be empty!\n')
  elseif type(list) ~= 'table' then
    return error(typeError('"list" parameter must be a table!'))
  elseif operator == nil then
    return error('\n\n>\t"operator" parameter must be "+", "-", "*", "/", "//", "%" or "^".\n')
  elseif  operator ~= '+'
      and operator ~= '-'
      and operator ~= '*'
      and operator ~= '/'
      and operator ~= '//'
      and operator ~= '%'
      and operator ~= '^' then
    return nil
  end
  local t = list
  for i = 1, #t do
    if type(t[i]) == 'nil' then return nil end
    if not tonumber(t[i]) and type(t[i]) ~= 'boolean' then
      return 0 / 0
    end
  end
  local function b(x)
    return x == true and 1 or x == false and 0 or x
  end
  local r = t[1]
  local k = pack(unpack(t, 2))
  if operator == '+' then
    for _, e in ipairs(k) do r = b(r) + b(e) end
  elseif operator == '-' then
    for _, e in ipairs(k) do r = b(r) - b(e) end
  elseif operator == '*' then
    for _, e in ipairs(k) do r = b(r) * b(e) end
  elseif operator == '/' then
    for _, e in ipairs(k) do r = b(r) / b(e) end
  elseif operator == '//' then
    for _, e in ipairs(k) do r = b(r) // b(e) end
  elseif operator == '^' then
    for _, e in ipairs(k) do r = b(r) ^ b(e) end
  elseif operator == '%' then
    for _, e in ipairs(k) do
      if b(e) == 0 then
        return 0 / 0
      else
        r = b(r) % b(e)
      end
    end
  end
  return r
end

function table.reverse(list)
  if type(list) ~= 'table' then return {} end
  local t = list
  for i = 1, #t do
    if type(t[i]) == 'nil' then return t end
  end
  for i = #t, 1, -1 do
    push(t, t[i])
    remove(t, i)
  end
  return t
end
