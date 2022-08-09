local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Use Esc as Esc in neovim terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- Move visual block selection with <C-[jk]> in visual mode
map("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Keep matches center screen when cycling with n|N
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Center cursor after join
map("n", "J", "mzJ`z", opts)

-- Vimrc
map("n", "<leader>ve", ":e ~/.vimrc<CR>", opts)
map("n", "<leader>vs", ":so ~/.vimrc<CR>", opts)
map("n", "<leader>vv", ":so ~/.config/nvim/init.lua<CR>", opts)

-- Toggle hlsearch
map("n", "<leader>vh", ":set invhlsearch<CR>", opts)
map("n", "<leader>vc", ":set invignorecase<CR>", opts)

-- Switch or create new tmux session
map("n", "<leader>ts", ":silent !tmux neww tmux-sessionizer<CR>", opts)
