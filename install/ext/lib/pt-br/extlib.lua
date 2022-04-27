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

---Divide uma string em substrings usando o separador especificado e a retorna como uma tabela.
---@param str string Uma string a ser dividida.
---@param separator? string Uma string que identifique caractere ou caracteres a serem usados na separação da string. Se omitido, uma tabela contendo um único elemento com toda a string é retornado.
---@param limit? number Um valor usado para limitar o número de elementos retornados na tabela.
---@return table
---@nodiscard
---[Documentação online em inglês](https://github.com/joseliojunior/lua-extensions/tree/main/doc#string-split)
function string.split(str, separator, limit) end

---Retorna o resultado acumulado de todos os elementos da tabela `list`.
---@param list table Uma tabela de números e/ou elementos semelhantes a números.
---    Examples
---    { '8', '.4', 6.3, true, false } => { 8, 0.4, 6.3, 1, 0 }
---     { '8', '.4', 6.3, nil, false } => nil
---              { 9, '.4', 'str', 5 } => nan
---@param operator "'+'"|"'-'"|"'*'"|"'/'"|"'//'"|"'%'"|"'^'" O símbolo operacional a ser executado.
---@return number
---@nodiscard
---[Documentação online em inglês](https://github.com/joseliojunior/lua-extensions/tree/main/doc#table-reduce)
function table.reduce(list, operator) end

---Inverte a ordem dos elementos da tabela `list`. Este método altera `list` e retorna uma referência para a mesma tabela `list`.
---@param list table Uma tabela de elementos.
---    Examples
---    { '8', '.4', 6.3, true, false } => { false, true, 6.3, '.4', '8' }
---     { '8', '.4', 6.3, nil, false } => { '8', '.4', 6.3, nil, false }
---@return table
---[Documentação online em inglês](https://github.com/joseliojunior/lua-extensions/tree/main/doc#table-reverse)
function table.reverse(list) end
