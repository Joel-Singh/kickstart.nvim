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
  create_snippet('inset', [[\in]]),
  create_snippet('subset', [[\subseteq]]),
  create_snippet('superset', [[\supseteq]]),
  create_snippet('excsubset', [[\subset]]),
  create_snippet('excsuperset', [[\supset]]),
  create_snippet('union', [[\cup]]),
  create_snippet('intersection', [[\cap]]),
  create_snippet('naturalnumbers', [[\mathbb{N}]]),
  create_snippet('integers', [[\mathbb{Z}]]),
  create_snippet('realnumbers', [[\mathbb{R}]]),
  create_snippet('rationalnumbers', [[\mathbb{Q}]]),
  create_snippet('pi', [[\pi]]),
  create_snippet('geq', [[\geq]]),
  create_snippet('leq', [[\leq]]),
  create_snippet('neq', [[\neq]]),
  create_snippet('times', [[\times]]),
  create_snippet('dottimes', [[\cdot]]),
  create_snippet('epsilon', [[\epsilon]]),
  create_snippet('lambda', [[\lambda]]),
  create_snippet('sigma', [[\Sigma]]),
  create_snippet('ellipses', [[\ldots]]),
  create_snippet('nchoosek', [[\binom{<>}{<>}]], { i(1), i(2) }),
  create_snippet('mm', [[$<>$]], { i(1) }),
  create_snippet('-text', [[text]]),
  create_snippet('text', [[\text{ <> }]], { i(1) }),
  create_snippet('-set', [[\{<>\}]], { i(1) }),
  create_snippet('fraction', [[\frac{<>}{<>}]], { i(1), i(2) }),
  create_snippet('overline', [[\overline{<>}]], { i(1) }),
  create_snippet('powerset', [[\mathcal{P}(<>)]], { i(1) }),
  create_snippet('bar', [[|<>|]], { i(1) }),
  create_snippet('mono', [[\texttt{<>}]], { i(1) }),
  create_snippet('italic', [[\textit{<>}]], { i(1) }),
  create_snippet('x->', [[\xrightarrow{<>}]], { i(1) }),
  create_snippet('->', [[\rightarrow]]),
  create_snippet('lambda', [[\lambda]]),
  create_snippet('delta', [[\delta]]),
  create_snippet('land', [[\land]]),
  create_snippet('lor', [[\lor]]),
  create_snippet('neg', [[\neg]]),
  create_snippet('implies', [[\implies]]),
  create_snippet('biimplication', [[\iff]]),
  create_snippet('forall', [[\forall]]),
  create_snippet('thereexists', [[\exists]]),
  create_snippet('bar', [[|<>|]], { i(1) }),
  create_snippet('paren', [[(<>)]], { i(1) }),
  create_snippet('sqrt', [[\sqrt{<>}]], { i(1) }),
  create_snippet('-vec', [[vec]]),
  create_snippet('vec', [[\mathbf{<>}]], { i(1) }),
  create_snippet('cvec', [[\langle <>, <> \rangle]], { i(1), i(2) }),
  create_snippet('tcblue', [[\textcolor{blue}{<>}]], { i(1) }),
  create_snippet('tcred', [[\textcolor{red}{<>}]], { i(1) }),
  create_snippet('img', [[![<>](<>){width=<> height=<>}]], { i(1, 'alt-text'), i(2, 'link'), i(3), i(4) }),
  s({ trig = 'textit', snippetType = 'autosnippet' }, fmta([[\textit{<text>}<end>]], { text = i(1), ['end'] = i(2) })),
  s(
    { trig = 'template' },
    fmta(
      [[
\documentclass{article}
    % General document formatting
    \usepackage[margin=0.7in]{geometry}
    \usepackage[parfill]{parskip}
    \usepackage[utf8]{inputenc}
    
    % Related to math
    \usepackage{amsmath,amssymb,amsfonts,amsthm}

    \usepackage{graphicx}
      \graphicspath{ {~/Personal/Denison/spring-2024/CS234/assignments/a2/} }
    \usepackage{tikz}
    \usepackage{xcolor}

\title{Assignment <>}
\author{
  Joel Singh
}

\date{\today}

\newcommand{\image}[1]{
  \begin{figure}[h]
    \centering
    \includegraphics[width=10cm]{#1}
  \end{figure}
}

\usepackage{etoolbox}
\preto\subsection{\clearpage} % Inserts \clearpage before every subsection

\begin{document}
\maketitle

\setcounter{section}{-1}
\section{Introduction}

\begin{itemize}
  \item 2.2, 2.4  
  \item 2.8, 2.12, 2.14, 2.15, 2.16, 2.18, 2.19, 2.24, 2.27  
  \item 3.4, 3.5  
  \item 3.13, 3.19  
  \item 3.27, 3.33  
  \item 3.36, 3.38  
  \item 3.40, 3.41, 3.42, 3.44, 3.46  
\end{itemize}


\section{<>}
\subsection*{<>}
\textcolor{blue}{<>}

\end{document}
  ]],
      { i(1), i(2), i(3), i(4) }
    )
  ),
}
