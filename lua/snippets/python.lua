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

local utils = require("snippets._utils")

-- https://numpydoc.readthedocs.io/en/latest/format.html
local numpy_style_doc = function(args)
	local nodes = {}
	local params = args[1][1]:gsub("%s", "")
	local arg_inputs = utils.split(params, ",")
	for index, arg in ipairs(arg_inputs) do
		nodes[#nodes + 1] = t({ "", "\t" .. arg .. " : ", })
		nodes[#nodes + 1] = i(2 * index - 1, "type")
		nodes[#nodes + 1] = t({ "", "\t\t" })
		nodes[#nodes + 1] = i(2 * index, "description")
	end
	nodes = sn(nil, nodes)
	return nodes
end

-- https://google.github.io/styleguide/pyguide.html
local google_style_doc = function(args)
	local nodes = {}
	local params = args[1][1]:gsub("%s", "")
	local arg_inputs = utils.split(params, ",")
	for index, arg in ipairs(arg_inputs) do
		nodes[#nodes + 1] = t({ "", "\t\t" .. arg .. ": " })
		nodes[#nodes + 1] = i(index, "description")
	end
	nodes = sn(nil, nodes)
	return nodes
end

local snippets = {
	s({ trig = "ifmain" }, {
		t({ "if __name__ == '__main__':", "	" }),
		i(1),
	}),
	s(
		{ trig = "pr" },
		fmt("print('{node1}'.format({node2})){node3}", {
			node1 = i(1),
			node2 = i(2),
			node3 = i(0),
		})
	),
	s({ trig = "par" }, {
		t({ "parser = argparse.ArgumentParser()", "" }),
		i(1),
		t({ "", "args = parser.parse_args()", "" }),
		i(0),
	}),
	s({ trig = "parsadd" }, {
		c(1, {
			fmt("parser.add_argument('{node1}', type={node2}, default={node3}, help='{node4}')", {
				node1 = i(1),
				node2 = i(2),
				node3 = i(3),
				node4 = i(4),
			}),
			fmt("parser.add_argument('{node1}', type={node2}, required={node3}, help='{node4}')", {
				node1 = i(1),
				node2 = i(2),
				node3 = i(3, "True"),
				node4 = i(4),
			}),
			fmt("parser.add_argument({node})", { node = i(1) }),
		}),
	}),

	s({ trig = "for(%w+)", regTrig = true }, {
		f(function(args, snip)
			return "for " .. snip.captures[1] .. " in range("
		end, {}),
		i(1),
		t({ "):", "	" }),
		i(0),
	}),

	s({ trig = "cls" }, {
		t({ "class " }),
		i(1, "CLS"),
		t({ ":", "	def __init__(self, " }),
		i(2),
		t({ "):", "		" }),
		i(0),
	}),
	s({ trig = "d" }, c(1,
		{
			sn(nil, {
				t("def "), i(1, 'function'), t("("),
				i(2, "param1"), t({ "):", '\t"""', "\t" }), i(3, "A docstring"),
				t({ "", "", "\tArgs:" }),
				d(4, google_style_doc, { 2 }, {}),
				t({ "", "", "\tReturns:", "\t\t" }), i(5, "description"),
				t({ "", '\t"""', "\t" }), i(6)
			}),
			sn(nil, {
				t("def "), i(1, 'function'), t("("),
				i(2, "param1"), t({ "):", '\t"""', "\t" }), i(3, "A docstring"),
				t({ "", "", "\tParameters", "\t----------" }),
				d(4, numpy_style_doc, { 2 }, {}),
				t({ "", "", "\tReturns", "\t-------", "\t" }), i(5, "type"),
				t({ "", '\t"""', "\t" }), i(6)
			}),
			fmt([[
def {}({}):
	"""{}"""
	{}
			]], { i(1, "function"), i(2, "param1"), i(3, 'This is a docstring'), i(4) }),
			fmt([[
def {}({}):
	{}
			]], { i(1, "function"), i(2, "param1"), i(0) })
		}
	)
	),
}

return snippets
