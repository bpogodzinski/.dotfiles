-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move lines in visual block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle when jumping pages and search
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Tab management
vim.keymap.set("n", "<leader><Tab>n", "<cmd>tabnew<CR>", { desc = "[N]ew tab" })
vim.keymap.set("n", "<leader><Tab>d", "<cmd>tabclose<CR>", { desc = "[D]elete tab" })
vim.keymap.set("n", "<leader><Tab>o", "<cmd>tabonly<CR>", { desc = "Delete [o]ther tabs" })
vim.keymap.set("n", "<leader><Tab>h", "<cmd>tabprev<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader><Tab>l", "<cmd>tabnext<CR>", { desc = "Next tab" })
