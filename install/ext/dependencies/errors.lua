--- @author: Josélio Júnior <joseliojrx25@gmail.com>
--- @copyright: Josélio Júnior 2022
--- @license: MIT

err = {
  EMPTY_OR_NOT_TABLE = '"list" parameter can not be empty and must be a table!',
  NOT_TABLE = '"list" parameter must be a table!',
  NOT_STRING = '"str" parameter must be a string!',
  WRONG_OPERATOR = '"operator" parameter must be "+", "-", "*", "/", "//", "%" or "^".'
}

for k, v in pairs(err) do err[k] = '\n\n>\tTypeError: ' .. v .. '\n' end
