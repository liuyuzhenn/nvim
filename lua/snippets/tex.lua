local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")


local table_node = function(args)
	local tabs = {}
	local count
	table = args[1][1]:gsub("%s", ""):gsub("|", "")
	count = table:len()
	for j = 1, count do
		tabs[2 * j - 1] = i(j)
		if j ~= count then
			tabs[2 * j] = t " & "
		end
	end
	return sn(nil, tabs)
end

local snippets = {
	s("tabular", {
		t "\\begin{tabular}{",
		i(1, "0"),
		t { "}", "" },
		d(2, table_node, { 1 }, {}),
		t { "", "\\end{tabular}" }
	}),
	s({ trig = "tr(%d+)", regTrig = true, dscr = "table row" }, {
		d(1, function(args, snip)
			local col = snip.captures[1]
			local nodes = {}
			nodes[1] = i(1)
			for j = 1, col - 1 do
				nodes[j * 2] = t(" & ")
				nodes[j * 2 + 1] = i(j + 1)
			end
			nodes[2 * col] = t(" \\\\")
			return sn(nil, nodes)
		end, {})
	}),
	s({ trig = "eq" }, {
		t("\\begin{equation}"),
		i(1),
		t("\\end{equation}")
	}),
	s({ trig = "center" }, {
		t({ "\\begin{center}", "" }),
		i(1),
		t({ "", "\\end{center}" })
	}),
	s({ trig = "begin" }, {
		t("\\begin{"), i(1), t({ "}", "" }),
		i(2),
		t({ "", "\\end{" }),
		f(function(args, snip)
			return args[1][1]
		end, { 1 }),
		t("}")
	}),
	s({ trig = "ls" },
		fmt([[
\begin{itemize}
	\item <>
\end{itemize}
		]], { i(1) }, { delimiters = "<>" })
	),
	s({ trig = "table" }, {
		c(1, {
			fmt([[
\begin{table}
\begin{center}
	\begin{tabular}{<>}
		\toprule
		<>
		\midrule
		<>
		\bottomrule
	\end{tabular}
	\caption{<>}
	\label{tab:<>}
\end{center}
\end{table}
]], { i(1, "c"), i(4), i(5), i(2, "a table"), i(3, "a label") }, { delimiters = "<>" }),
			fmt([[
\begin{table}
\begin{center}
	\begin{tabular}{<>}
		<>
	\end{tabular}
	\caption{<>}
	\label{tab:<>}
\end{center}
\end{table}
]], { i(1, "c"), i(4), i(2, "a table"), i(3, "a label") }, { delimiters = "<>" }),
			fmt([[
\begin{table}
\begin{center}
	<>
	\caption{<>}
	\label{tab:<>}
\end{center}
\end{table}
]], { i(3), i(1, "a table"), i(2, "a label") }, { delimiters = "<>" }),
		})
	}),
	s({ trig = "figure" }, {
		c(1, {
			fmt([[
\begin{figure}
\begin{center}
	\includegraphics[width=<>\textwidth]{<>}
\end{center}
\end{figure}
]], { i(1, "0.8"), i(2) }, { delimiters = "<>" }),
			fmt([[
\begin{figure}
\begin{center}
	\includegraphics[width=<>\textwidth]{<>}
	\caption{<>}
	\label{fig:<>}
\end{center}
\end{figure}
]], { i(1, "0.8"), i(2), i(3, "a figure"), i(4, "a label") }, { delimiters = "<>" }),
		})
	}),
	s({ trig = "defcref" },
		fmt([[
% >> Cref definition begins <<
\crefname{subsection}{Sec.}{Secs.}
\crefname{section}{Sec.}{Secs.}
\crefname{table}{Table}{Tables}
\crefname{figure}{Fig.}{Figs.}
\crefname{equation}{Eqn.}{Eqns.}
\crefname{algorithm}{Algorithm}{Algorithms}
% >> Cref definition ends <<
		]], {}, { delimiters = "<>" })
	)
}

return snippets
