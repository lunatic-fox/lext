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

local UTF8_CHARPATTERN = '[\\0-\127\194-\244][\128-\191]*'
local push = table.insert
local concat = table.concat
local pack = function(...) return { ... } end
local unpack = _VERSION ~= 'Lua 5.1' and table.unpack or unpack

local typeError = function(msg) return '\n\n>\tTypeError: ' .. msg .. '\n' end

local function noMagic(s)
  local SYM = { '(', ')', '.', '%', '+', '-', '*', '?', '[', '^', '$' }
  local t = {}
  for e in s:gmatch(UTF8_CHARPATTERN) do
    for _, f in pairs(SYM) do e = e == f and '%' .. e or e end
    push(t, e)
  end
  return concat(t)
end

function string.split(str, separator, limit)
  if type(str) ~= 'string' then return {} end
  if type(separator) == 'nil' then return { str } end
  limit = limit and type(limit) == 'number' and limit or 0
  local sp = tostring(separator)
  if sp == '' then
    local spread = {}
    for e in str:gmatch(UTF8_CHARPATTERN) do
      push(spread, e)
    end
    if limit > 0 then return pack(unpack(spread, 1, limit)) end
    return spread
  end
  local sPtt = noMagic(sp)
  local res = {}
  for e in str:gmatch('.-' .. sPtt) do
    local k = {}
    for f in e:gmatch(UTF8_CHARPATTERN) do
      push(k, f)
    end
    k = concat(k):gsub(sPtt, '')
    push(res, k)
    str = str:gsub(noMagic(e), '')
  end
  push(res, str)
  if limit == 0 then return res end
  return pack(unpack(res, 1, limit))
end

function string.replace(str, searchValue, replaceValue)
  if str == nil or type(str) ~= 'string' then
    return error(typeError('"str" parameter must be a string!'))
  end
  if searchValue == nil or replaceValue == nil then return str end
  searchValue = tostring(searchValue)
  replaceValue = tostring(replaceValue)
  str = str:split(searchValue)
  str = concat(str, replaceValue)
  return str
end

function string.slice(str, i, j)
  if type(str) ~= 'string' then
    return error(typeError('"str" parameter must be a string!'))
  end
  if i == 0 or i == nil then return str end
  str = str:split('')
  if i < 0 then
    i = #str + i + 1
    j = #str
  end
  str = concat(str, '', i, j)
  return str
end
