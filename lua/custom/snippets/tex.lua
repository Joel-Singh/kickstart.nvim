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

local function create_snippet(trig, char, nodes)
  nodes = nodes or {}
  return s({ trig = trig, snippetType = 'autosnippet' }, fmta(char, nodes))
end

return {
  create_snippet('emptyset', [[\emptyset]]),
  create_snippet('geq', [[\geq]]),
  create_snippet('leq', [[\leq]]),
  create_snippet('cdot', [[\cdot]]),
  create_snippet('subset', [[\subseteq]]),
  create_snippet('superset', [[\supseteq]]),
  create_snippet('excsubset', [[\subset]]),
  create_snippet('excsuperset', [[\supset]]),
  create_snippet('-union', [[\cup]]),
  create_snippet('ellipses', [[\ldots]]),
  create_snippet('nchoosek', [[\binom{<>}{<>}]], { i(1), i(2) }),
  create_snippet('mm', [[$<>$]], { i(1) }),
  create_snippet('dmm', "\\[<>\\]", { i(1) }),
  create_snippet('-set', [[\{<>\}]], { i(1) }),
  create_snippet('overline', [[\overline{<>}]], { i(1) }),
  create_snippet('powerset', [[\mathcal{P}(<>)]], { i(1) }),
  create_snippet('bar', [[|<>|]], { i(1) }),
  create_snippet('x->', [[\xrightarrow{<>}]], { i(1) }),
  create_snippet('->x', [[\overrightarrow{<>}]], { i(1) }),
  create_snippet('sqrt', [[\sqrt{<>}]], { i(1) }),
  create_snippet('zerovec', [[\mathbf{0}]]),
  create_snippet('cvv', [[\langle <> \rangle]], { i(1) }),
  create_snippet('ihat', [[\mathbf{\hat{i}}]]),
  create_snippet('jhat', [[\mathbf{\hat{j}}]]),
  create_snippet('khat', [[\mathbf{\hat{k}}]]),
  create_snippet('nll', [[\newline]]),
  create_snippet('npp', [[\newpage]]),
  create_snippet('tcred', [[\textcolor{red}{<>}]], { i(1) }),
  create_snippet('img', [[![<>](<>){width=<> height=<>}]], { i(1, 'alt-text'), i(2, 'link'), i(3), i(4) }),
  s(
    { trig = 'summation' },
    fmta(
      [[\sum_{<>}^{<>}<>]],
      { i(1, 'from'), i(2, 'to'), i(3, 'summand')}
    )
  ),
  s(
    { trig = 'productation' },
    fmta(
      [[\prod_{<>}^{<>}<>]],
      { i(1, 'from'), i(2, 'to'), i(3, 'productand')}
    )
  ),
  create_snippet('-subsection', [[\subsection{<>}]], { i(1) }),
  s({ trig = 'italic' }, fmta([[\textit{<>}]], { i(1) })),
  s({ trig = 'bold' }, fmta([[\textbf{<>}]], { i(1) })),
  s({ trig = 'mono' }, fmta([[\texttt{<>}]], { i(1) })),
  s(
    { trig = 'itemize' },
    fmta(
      [[
\begin{itemize}
  \item <>
  \item <>
  \item <>
\end{itemize}
]],
      { i(1), i(2), i(3) }
    )
  ),
  s(
    { trig = 'text' },
    fmta(
      [[\text{<>}]],
      { i(1) }
    )
  ),
  s(
    { trig = 'enumerate' },
    fmta(
      [[
\begin{enumerate}
  \item <>
  \item <>
  \item <>
\end{enumerate}
]],
      { i(1), i(2), i(3) }
    )
  ),
  s(
    { trig = '-align', snippetType = 'autosnippet' },
    fmta(
      [[
\textcolor{blue}{
  \begin{align*}
  <>
  \end{align*}
}
]],
      { i(1) }
    )
  ),
  s(
    { trig = 'begin' },
    fmta(
      [[
\begin{<>}
<>
\end{<>}
]],
      { i(1), i(2), rep(1) }
    )
  ),
  s(
    { trig = 'fraction' },
    fmta(
      [[\frac{<>}{<>}]],
      { i(1), i(2) }
    )
  ),
  s({ trig = 'suchthat', snippetType = 'autosnippet', wordTrig = false }, fmta([[.\ ]], {})),
  s({ trig = 'jk', snippetType = 'autosnippet', wordTrig = false }, fmta([[\]], {})),
  s({ trig = 'kj', snippetType = 'autosnippet', wordTrig = false }, fmta([[\]], {})),
  s({ trig = 'jl', snippetType = 'autosnippet', wordTrig = false }, fmta([[&]], {})),
  s({ trig = 'lj', snippetType = 'autosnippet', wordTrig = false }, fmta([[&]], {})),
  s({ trig = '__', snippetType = 'autosnippet', wordTrig = false }, fmta([[\_]], {})),
  s({ trig = 'naturalnumbers' }, fmta([[\mathbb{N}]], {})),
  s({ trig = 'integers' }, fmta([[\mathbb{Z}]], {})),
  s({ trig = 'realnumbers' }, fmta([[\mathbb{R}]], {})),
  s({ trig = 'rationalnumbers'}, fmta([[\mathbb{Q}]], {})),
  s({ trig = 'vv', snippetType = 'autosnippet', wordTrig = false }, fmta([[\mathbf{<>}]], {i(1)})),

  s(
    { trig = 'displaymath' },
    fmta(
      '\\[\n<>\n\\]',
      { i(1), }
    )
  ),
  s(
    { trig = 'colorblue' },
    fmta(
      [[
  \color{blue}
  <>
  \color{black}
  ]],
      { i(1), }
    )
  ),
  s(
    { trig = 'deltahat' },
    fmta(
      [[\hat{\delta}]],
      {  }
    )
  ),
  s(
    { trig = 'Language' },
    fmta(
      [[\mathcal{L}]],
      {  }
    )
  ),
}
