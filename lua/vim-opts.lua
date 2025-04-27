vim.opt.termguicolors = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set relativenumber")
vim.cmd("set number")

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true, silent = true })

vim.opt.spell = true
vim.opt.spelllang = "en"
-- vim.opt.spelloptions:append("camel")

vim.keymap.set("n", "<leader>gb", "<C-o>", {})
