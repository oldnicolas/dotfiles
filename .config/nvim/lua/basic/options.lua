vim.g.mapleader = ' '

vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.colorcolumn = '80'

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autowrite = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir:remove(".")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.mouse = 'a'
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.shortmess:remove("F"):append("c")

vim.opt.updatetime = 100
vim.opt.timeoutlen = 600
vim.opt.lazyredraw = true

vim.opt.wildignore = { ".git", "*/node_modules/*", "*/target/*" }
vim.opt.wildignorecase = true

if vim.loop.os_uname().sysname == 'Darwin' then
  vim.g.python3_host_prog = '/usr/local/bin/python3'
else
  vim.g.python3_host_prog = '/usr/bin/python3'
end

if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case --hidden'
  vim.opt.grepformat = '%f:%l:%c:%m'
end

vim.g.loaded_python_provider  = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_node_provider    = 0

-- https://github.com/hrsh7th/nvim-cmp
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- https://github.com/kevinhwang91/nvim-ufo
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true

-- https://github.com/neovim/neovim/pull/17266
vim.opt.laststatus = 3

-- https://github.com/neovim/neovim/pull/16251
vim.opt.cmdheight = 0
