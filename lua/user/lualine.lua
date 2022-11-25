local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end


local disp_cond_width = function()
  return vim.fn.winwidth(0) > 70
end

local diagnostics = {
  "diagnostics",
  --sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}


local diagnostics_bw = {
  "diagnostics",
  --sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = disp_cond_width
}

local mode = {
  "mode",
  --fmt = function(str)
    --return "-- " .. str .. " --"
  --end,
}

local filetype = {
  "filetype",
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  --padding = 0,
}


lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'jellybeans',
	component_separators = { left = '|', right = '|'},
	section_separators = { left = '', right = ''},
	disabled_filetypes = {
        statusline = {
		  --"dapui_watches",
		  --"dapui_stacks",
		  --"dapui_breakpoints",
		  --"dapui_scopes",
		  --"dapui_console",
		  --"dap-repl",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "alpha",
          "lir",
          "Outline",
          "spectre_panel",
          "toggleterm",
		},
        winbar = {
		  "dapui_watches",
		  "dapui_stacks",
		  "dapui_breakpoints",
		  "dapui_scopes",
		  "dapui_console",
		  "dap-repl",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "alpha",
          "lir",
          "Outline",
          "spectre_panel",
          "toggleterm",
        },
      },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, diagnostics_bw },
    lualine_c = { "filename" },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { diff, filetype, "encoding" },
    lualine_y = { "progress", location },
    lualine_z = { },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
    winbar = {
      lualine_a = {diagnostics},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "nvim-tree", "toggleterm", "quickfix" },
}
