--- @author: Josélio Júnior <joseliojrx25@gmail.com>
--- @copyright: Josélio Júnior 2022
--- @license: MIT

array = {
  ---@param list table
  ---@param condition function
  every = function(list, condition)
    if type(list) ~= 'table' then return print 'error' end
    local r = 0
    for i = 1, #list do
      if condition(list[i]) then r = r + 1 end
    end
    if r == #list then return true else return false end
  end
}
