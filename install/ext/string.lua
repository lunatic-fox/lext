--- @author: Josélio Júnior <joseliojrx25@gmail.com>
--- @copyright: Josélio Júnior 2022
--- @license: MIT

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
    return spread
  end
  local sPtt = noMagic(sp)
  local res = {}
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
  if limit == 0 then return res end
  return pack(unpack(res, 1, limit))
end
