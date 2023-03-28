---@diagnostic disable: lowercase-global, deprecated
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

local push = table.insert
local remove = table.remove
local join = table.concat
local unpack = table.unpack or unpack
local function typeerror(msg)
  return '\n\n>\tTypeError: ' .. msg .. '\n'
end

function array(list)
  local r, nil_check = {unpack(list)}, {}

  for i = 1, #r do push(nil_check, r[i]) end
  if #r ~= #nil_check then
    return error(
      typeerror'Array items can not be "nil" type.'
    )
  end


  function r.reverse()
    for i = #r, 1, -1 do
      push(r, r[i])
      remove(r, i)
    end
    return r
  end


  function r.slice(i, j)
    i = (i == nil or i == 0) and 1 or i
    j = (j == nil or j == 0) and #r or j
    if i < 0 then
      i = #r + i + 1
    elseif i < 0 and j < 0 then
      i = #r + i + 1
      j = #r + j + 1
    end
    local t = {unpack(r, i, j)}
    for k, v in pairs(r) do
      if type(k) == 'string' then t[k] = v end
    end
    return array(t)
  end


  function r.join(sep)
    local t = {unpack(r)}
    for i = 1, #t do t[i] = tostring(t[i]) end
    return join(t, tostring(sep or ','))
  end


  function r.reduce(opt)
    if #r == 0 then
      return nil
    elseif #r == 1 then
      return r[1]
    elseif opt == nil then
      return error('\n\n>\t"operator" parameter must be "+", "-", "*", "/", "//", "%" or "^".\n')
    elseif  opt ~= '+'
        and opt ~= '-'
        and opt ~= '*'
        and opt ~= '/'
        and opt ~= '//'
        and opt ~= '%'
        and opt ~= '^' then
      return nil
    end

    for i = 1, #r do
      if not tonumber(r[i]) and type(r[i]) ~= 'boolean' then
        return 0 / 0
      end
    end

    local function b(x)
      return x == true and 1 or x == false and 0 or x
    end

    local c = r[1]
    local k = {unpack(r, 2)}

    if opt == '+' then
      for _, e in ipairs(k) do c = b(c) + b(e) end
    elseif opt == '-' then
      for _, e in ipairs(k) do c = b(c) - b(e) end
    elseif opt == '*' then
      for _, e in ipairs(k) do c = b(c) * b(e) end
    elseif opt == '/' then
      for _, e in ipairs(k) do c = b(c) / b(e) end
    elseif opt == '//' then
      for _, e in ipairs(k) do c = math.floor(b(c) / b(e)) end
    elseif opt == '^' then
      for _, e in ipairs(k) do c = b(c) ^ b(e) end
    elseif opt == '%' then
      for _, e in ipairs(k) do
        if b(e) == 0 then
          return 0 / 0
        else
          c = b(c) % b(e)
        end
      end
    end
    return c
  end


  local pvres = {unpack(r)}
  function r.map(fn)
    local t = {unpack(r)} 
    for i = 1, #t do
      t[i] = fn(t[i], i, pvres)
    end
    return array(t)
  end


  function r.filter(fn)
    local t = {}
    for k, v in pairs(r) do
      if type(k) == 'number' then
        if fn(r[k], k, pvres) then
          push(t, v)
        end
      else
        t[k] = v
      end
    end
    return array(t)
  end

  setmetatable(r, {
    __concat = function (a1, a2)
      local t = {}
      for _, v in ipairs(a1) do push(t, v) end
      for _, v in ipairs(a2) do push(t, v) end
      return array(t)
    end
  })

  return r
end
