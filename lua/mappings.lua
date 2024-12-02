require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left"})
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right"})
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down"})
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up"})

map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "vertical split" })
map("n", "<leader>sd", "<cmd>split<CR>", { desc = "horizontal split" })
map("n", "<leader>tn", "<cmd>tabnew<CR>", { noremap = true, silent = true })
map("n", "<leader>ta", "<cmd>tabprevious<CR>", { noremap = true, silent = true })
map("n", "<leader>tp", "<cmd>tabnext<CR>", { noremap = true, silent = true })
map("n", "<leader>te", "<cmd>tabclose<CR>", { noremap = true, silent = true })

-- terminal mode
map("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })

-- flutter commands
map("n", "<leader>fs", ":Telescope flutter commands<CR>", {noremap = true, silent = true})

-- map({ "n", "i", "v" k}, "<C-s>", "<cmd> w <cr>")
