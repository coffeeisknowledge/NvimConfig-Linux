-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}


M.ui = {

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default",
    border_color = "nord_blue",
    selected_item_bg = "colored",
  },
  tabufline = {
    enabled = true,
    lazyload = true,
  },
  statusline = {
    theme = "vscode_colored",
    -- separator_style = "round",
  },
  telescope = {
    style = "borderless"
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                 ",
    "                                 ",
    "          ⣤⡶⢶⣦⡀                  ",
    "⠀⠀⠀⣴⡿⠟⠷⠆⣠⠋⠀⠀⠀⢸⣿                  ",
    "⠀⠀⠀⣿⡄⠀⠀⠀⠈⠀⠀⠀⠀⣾⡿                  ",
    "⠀⠀⠀⠹⣿⣦⡀⠀⠀⠀⠀⢀⣾⣿                   ",
    "⠀⠀⠀⠀⠈⠻⣿⣷⣦⣀⣠⣾⡿                    ",
    "⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⡿⠟                     ",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀⢠⠏⡆⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣀⡀     ",
    "⠀⠀⠀⠀⠀⡟⢦⡀⠇⠀⠀⣀⠞⠀⠀⠘⡀⢀⡠⠚⣉⠤⠂⠀⠀⠀⠈⠙⢦⡀   ",
    "⠀⠀⠀⠀⠀⡇⠀⠉⠒⠊⠁⠀⠀⠀⠀⠀⠘⢧⠔⣉⠤⠒⠒⠉⠉⠀⠀⠀⠀⠹⣆  ",
    "⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀⣤⠶⠶⢶⡄⠀⠀⠀⠀⢹⡆",
    "⠀⣀⠤⠒⠒⢺⠒⠀⠀⠀⠀⠀⠀⠀⠀⠤⠊⠀⢸⠀⡿⠀⡀⠀⣀⡟⠀⠀⠀⠀⢸⡇ ",
    "⠈⠀⠀⣠⠴⠚⢯⡀⠐⠒⠚⠉⠀⢶⠂⠀⣀⠜⠀⢿⡀⠉⠚⠉⠀⠀⠀⠀⣠⠟   ",
    "⠀⠠⠊⠀⠀⠀⠀⠙⠂⣴⠒⠒⣲⢔⠉⠉⣹⣞⣉⣈⠿⢦⣀⣀⣀⣠⡴⠟     ",
    "                                 ",
    "                                 ",
  },
}

M.base46 = {
	-- theme = "gatekeeper",
	theme = "solarized_osaka",
  transparency = false,

  hl_add = {
    NvimTreeOpenedFolderName = {fg = "blue", bold = true},
  },

	hl_override = {
		-- Comment = { italic = true },
		["@comment"] = { italic = true },
		["@annotation"] = { italic = true },
		["@function"] = { italic = true },
    CursorLine = {
      bg = "one_bg"
    },
    Visual = {
      bg = "one_bg3"
    },
    NvDashAscii = {
      bg = "NONE",
      fg = "vibrant_green"
    },
    NvimTreeFolderArrowClosed = {
      fg = "nord_blue",
    },
    NvimTreeFolderIcon = {
      fg = "nord_blue",
    },
    NvimTreeFolderName = {
      fg = "nord_blue"
    },
    NvimTreeOpenedFolderName = {
      fg = "white"
    },
    NvimTreeFolderArrowOpen = {
      fg = "white",
      underdashed = true
    },
    NvimTreeCursorLine = {
      bg = "one_bg3"
      -- bg = "red"
    },
    NvDashButtons = {
      bg = "NONE",
      fg = "vibrant_green",
    },
	},
}

return M
