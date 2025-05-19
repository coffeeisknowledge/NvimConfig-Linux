require "nvchad.mappings"
-- local springboot_nvim = require("springboot-nvim")
local harpoon = require("harpoon")

-- add yours here

local map = vim.keymap.set
local nvimtree = require("nvim-tree.api")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up" })

map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "vertical split" })
map("n", "<leader>sd", "<cmd>split<CR>", { desc = "horizontal split" })
map("n", "<leader>tn", "<cmd>tabnew<CR>", { noremap = true, silent = true })
map("n", "<A-a>", "<cmd>tabprevious<CR>", { noremap = true, silent = true })
map("n", "<A-f>", "<cmd>tabnext<CR>", { noremap = true, silent = true })
map("n", "<leader>te", "<cmd>tabclose<CR>", { noremap = true, silent = true })

-- terminal mode
map("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })

-- flutter commands
map("n", "<leader>fs", ":Telescope flutter commands<CR>", { noremap = true, silent = true })

-- tabs list commands
map('n', '<leader>tl', ':lua require("telescope-tabs").list_tabs()<CR>', { noremap = true, silent = true, desc = "telescope tabs list" })

-- java commands
-- map("n", "<leader>jr", springboot_nvim.boot_run, { desc = "[J]ava [R]un Spring Boot" })
-- map("n", "<leader>jc", springboot_nvim.generate_class, { desc = "[J]ava Create [C]lass" })
-- map("n", "<leader>ji", springboot_nvim.generate_interface, { desc = "[J]ava Create [I]nterface" })
-- map("n", "<leader>je", springboot_nvim.generate_enum, { desc = "[J]ava Create [E]num" })
-- map("n", "<leader>jr", springboot_nvim.generate_record, { desc = "[J]ava Create [R]ecord" })

-- harpoon commands

map("n", "mk", function() harpoon:list():add() end, {desc = "harpoon add mark"})
map("n", "md", function() harpoon:list():remove() end, {desc = "harpoon delete mark"})
map("n", "mc", function() harpoon:list():clear() end, {desc = "harpoon clear"})
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "mq", function() harpoon:list():select(1) end, { desc = "harpoon 1"})
map("n", "mw", function() harpoon:list():select(2) end, { desc = "harpoon 2"})
map("n", "me", function() harpoon:list():select(3) end, { desc = "harpoon 3"})
map("n", "mr", function() harpoon:list():select(4) end, { desc = "harpoon 4"})

-- map("n", "<A-j>", function() harpoon:list():prev() end, { desc = "harpoon list prev"})
-- map("n", "<A-k>", function() harpoon:list():next() end, { desc = "harpoon list next"})

-- map({ "n", "i", "v" k}, "<C-s>", "<cmd> w <cr>")


map('n', "<leader>'", "viw:s/\\%V\\(\\w\\+\\)/\"\\1\"/<CR>", { noremap = true, silent = true })
map('v', "<leader>'", ":s/\\%V\\([^[:space:]]\\+\\)/\"\\1\"/<CR>", { noremap = true, silent = true })
-- map("n", "<leader>fa" , function() nvimtree.tree.reload() end, { desc = "Recargar NvimTree" })
