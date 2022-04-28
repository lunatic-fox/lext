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
local concat = table.concat
local pack = table.pack
local unpack = table.unpack

local function noMagic(s)
  local sym <const> = { '(', ')', '.', '%', '+', '-', '*', '?', '[', '^', '$' }
  local t = {}
  for e in s:gmatch(utf8.charpattern) do
    for _, f in pairs(sym) do e = e == f and '%' .. e or e end
    push(t, e)
  end
  return concat(t)
end

local function chain(tstr)
  local def = {
    join = function(sep)
      sep = sep and tostring(sep) or ','
      return table.concat(tstr, sep)
    end
  }
  for i = 1, #tstr do
    table.insert(def, tstr[i])
  end
  return def
end

function string.split(str, separator, limit)
  if type(str) ~= 'string' then return {} end
  if type(separator) == 'nil' then return { str } end
  limit = limit and type(limit) == 'number' and limit or 0
  local sp = tostring(separator)
  if sp == '' then
    local spread = {}
    for e in str:gmatch(utf8.charpattern) do
      push(spread, e)
    end
    if limit > 0 then return pack(unpack(spread, 1, limit)) end
    return chain(spread)
  end
  local sPtt = noMagic(sp)
  local res = {}
  str = ' ' .. str
  for e in str:gmatch('.-' .. sPtt) do
    local k = {}
    for f in e:gmatch(utf8.charpattern) do
      push(k, f)
    end
    k = concat(k):gsub(sPtt, '')
    push(res, k)
    str = str:gsub(noMagic(e), '')
  end
  push(res, str)
  res[1] = res[1]:sub(2)
  if limit == 0 then return chain(res) end
  return chain(pack(unpack(res, 1, limit)))
end
