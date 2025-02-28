local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

return {
  s(
    { trig = 'file' },
    fmta(
      [[
#include <<iostream>>
using namespace std;

int main() {
	<>
	return 0;
}
  ]],
      { i(0) }
    )
  ),
  s(
    { trig = 'include', snippetType = 'autosnippet' },
    fmt(
      [[
#include <{}>
  ]],
      { i(0) }
    )
  ),
  s(
    { trig = '()', snippetType = 'autosnippet' },
    fmt(
      [[
({}){}
  ]],
      { i(1), i(2) }
    )
  ),
  s(
    { trig = '()', snippetType = 'autosnippet' },
    fmta(
      [[
{<>}<>
  ]],
      { i(1), i(2) }
    )
  ),
  s(
    { trig = 'comment-block-beginning' },
    fmta(
      [[
//================================================= 
// Joel Singh
// <>
// <> 
// <>
// 
//================================================= 
  ]],
      { i(1, 'Month Year'), i(2, 'filename.ext'), i(3, 'Description') }
    )
  ),
  s(
    { trig = 'comment-block-function' },
    fmta(
      [[
//================================================= 
// <>
// <>
// Parameters:
//  <> 
// Return Value:
//  <>
//================================================= 
  ]],
      { i(1, 'functionName'), i(2, 'Description'), i(3, 'parameters'), i(4, 'Return Value') }
    )
  ),
}
