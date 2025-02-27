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
    { trig = 'test_auto_expand', snippetType = 'autosnippet' },
    fmt(
      [[
      fn {function_name}(
        interaction: Single<&Interaction, (With<{btn_component}>, Changed<Interaction>)>,
        {params}
      ) {{
        if let Interaction::Pressed = *interaction {{
          {exit}
        }}
      }}
      ]],
      { function_name = i(1), btn_component = i(2), params = i(3), exit = i(4) }
    )
  ),
}
