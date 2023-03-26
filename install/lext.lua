---@diagnostic disable: lowercase-global
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

require 'lua-extensions.string'
require 'lua-extensions.array'

arg = array{unpack(arg or {})}

local function clear_line() io.write'\27[1A\27[2K' end
local opt = {'utf8'}
local cmd = {}

function cmd.unpack_value(str)
  return str:gsub('.+=(.+)', '%1')
end

for _, v in ipairs(opt) do
  if array(arg).filter(function(e) return e == v end)[1] then
    cmd[v] = true
  end

  local pair_value = array(arg).filter(function (e) return e:match(v .. '=.+') end)[1]
  if pair_value then
    cmd[v] = cmd.unpack_value(pair_value)
  end
end

if cmd.utf8 then
  os.execute'chcp 65001'
  clear_line()
end
