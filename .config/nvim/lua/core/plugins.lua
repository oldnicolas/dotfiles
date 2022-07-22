-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
  desc = "Auto Compile Packer Plugins",
})

-- Using a floating window
require('packer').init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require 'core.treesitter']]
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'williamboman/nvim-lsp-installer' },
      { 'ray-x/lsp_signature.nvim' },
      { 'folke/lua-dev.nvim' },
      { 'jose-elias-alvarez/typescript.nvim' },
    },
    config = [[require 'core.lsp']]
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
      { 'onsails/lspkind-nvim' },
      { 'tzachar/cmp-tabnine', run = './install.sh' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'petertriho/cmp-git' },
      { 'uga-rosa/cmp-dictionary' },
    },
    config = [[require 'core.cmp']]
  }

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'camgraff/telescope-tmux.nvim' }
    },
    config = [[require 'core.telescope']]
  }

  use {
    'tpope/vim-fugitive',
    config = [[require 'extra.fugitive']]
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = [[require 'extra.gitsigns']]
  }

  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = [[require 'extra.fold']]
  }

  use {
    'windwp/nvim-autopairs',
    config = [[require 'extra.autopairs']]
  }

  use {
    'numToStr/Comment.nvim',
    requires = 'JoosepAlviste/nvim-ts-context-commentstring',
    config = [[require 'extra.comment']]
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup() end
  }

  use 'fladson/vim-kitty'
  -- use 'tomlion/vim-solidity'
  -- use 'simrat39/rust-tools.nvim'
  -- use 'mfussenegger/nvim-dap'
  -- use 'ThePrimeagen/harpoon'

  -- use 'ray-x/aurora'
  use 'fenetikm/falcon'
  use 'kyazdani42/blue-moon'
  use 'whatsthatsmell/codesmell_dark.vim'

  use 'ishan9299/nvim-solarized-lua'
  use 'mhartington/oceanic-next'
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'Mofiqul/vscode.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*', }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'arkav/lualine-lsp-progress' }
    },
    config = [[require 'ui.lualine']]
  }
end)
