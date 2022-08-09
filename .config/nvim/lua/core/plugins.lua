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
      -- { 'williamboman/nvim-lsp-installer' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'ray-x/lsp_signature.nvim' },
      { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },
      { 'folke/lua-dev.nvim' },
      { 'jose-elias-alvarez/typescript.nvim' },
      { 'simrat39/rust-tools.nvim' },
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

  use 'ray-x/aurora'
  use 'fenetikm/falcon'
  use 'Mofiqul/vscode.nvim'
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'Tsuzat/NeoSolarized.nvim'
  use { "catppuccin/nvim", as = "catppuccin", run = ":CatppuccinCompile" }
  use { 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*' }
  use { 'luisiacc/gruvbox-baby', branch = 'main' }
  use 'whatsthatsmell/codesmell_dark.vim'
  use 'B4mbus/oxocarbon-lua.nvim'

  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = {
  --     { 'kyazdani42/nvim-web-devicons' },
  --     { 'arkav/lualine-lsp-progress' }
  --   },
  --   config = [[require 'ui.lualine']]
  -- }

  use 'fladson/vim-kitty'
end)
