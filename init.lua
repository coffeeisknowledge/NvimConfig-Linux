vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

require("configs.jdtls").setup()

local function prettier_format()
  local tempfile = vim.fn.tempname()
  vim.cmd("silent! write! " .. tempfile)
  local output = vim.fn.system("prettierd --stdin-filepath " .. vim.fn.expand "%:p" .. " < " .. tempfile)
  vim.fn.delete(tempfile)
  return output
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "json", "http" },
  callback = function()
    vim.opt_local.formatexpr = "v:lua.prettier_format()"
  end,
})

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = "setlocal shiftwidth=2"
})

vim.schedule(function()
  require "mappings"
end)
