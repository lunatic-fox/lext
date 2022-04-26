--- @author: Josélio Júnior <joseliojrx25@gmail.com>
--- @copyright: Josélio Júnior 2022
--- @license: MIT

local push = table.insert
local remove = table.remove
local pack = table.pack
local unpack = table.unpack

function table.reduce(list, operator)
  if type(list) == 'table' and #list <= 0 then
    return nil
  elseif type(list) ~= 'table' then
    return nil
  elseif operator == nil then
    return nil
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
  for i = 1, #t, 1 do
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
  for i = 1, #t, 1 do
    if type(t[i]) == 'nil' then return t end
  end
  for i = #t, 1, -1 do
    push(t, t[i])
    remove(t, i)
  end
  return t
end
