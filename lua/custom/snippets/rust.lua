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
  s({ trig = 'asset_server', snippetType = 'autosnippet' }, fmt([[asset_server: ResMut<AssetServer>]], {})),
  s({ trig = '#cmds', snippetType = 'autosnippet' }, fmt([[commands: Commands]], {})),
  s(
    'component',
    fmt(
      [[
      #[derive(Component)]
      struct {name};
      ]],
      { name = i(1) }
    )
  ),
  s(
    { trig = 'resource', snippetType = 'autosnippet' },
    fmt(
      [[
      #[derive(Resource)]
      struct {name};
      ]],
      { name = i(1) }
    )
  ),
  s(
    'new-plugin',
    fmt(
      [[
use bevy::prelude::*;

pub fn {plugin_name}(app: &mut App) {{
    app.add_systems(OnEnter({state_enter}), setup)
        .add_systems(OnExit({state_exit}), ());
}}

fn setup(mut commands: Commands) {{
{setup}
}}

      ]],
      { plugin_name = i(1, 'plugin_name'), state_enter = i(2, 'State'), state_exit = rep(2), setup = i(3) }
    )
  ),
  s(
    'root-node',
    fmt(
      [[
width: Val::Vw(100.0),
height: Val::Vh(100.0),
flex_direction: FlexDirection::Column,
justify_content: JustifyContent::Center,
align_items: AlignItems::Center,
      ]],
      {}
    )
  ),
  s(
    { trig = '_struct', snippetType = 'autosnippet' },
    fmt(
      [[
{struct_name} {{
  {exit}
  ..default()
}},
      ]],
      { struct_name = i(1, 'struct_name'), exit = i(2, 'properties') }
    )
  ),
  s(
    { trig = 'newstruct', snippetType = 'autosnippet' },
    fmta(
      [[
#[derive(<>)]
struct <>(<>)
      ]],
      { i(1), i(2, 'Name'), i(3) }
    )
  ),
}
