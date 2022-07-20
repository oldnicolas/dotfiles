if not pcall(require, 'packer') then
  if vim.fn.input "Download Packer? (y for yes)" ~= "y" then
    return
  end

  local directory = string.format("%s/site/pack/packer/start/", vim.fn.stdpath "data")

  vim.fn.mkdir(directory, "p")

  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print "Downloading packer.nvim..."
  print(out)
  print("You'll need to restart now and run :PackerInstall")

  vim.cmd [[qa]]
else
  return require('packer').startup {
    function(use)
      use 'wbthomason/packer.nvim'

      use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = [[require 'core.treesitter']]
      }

      use {
        'neovim/nvim-lspconfig',
        requires = { 'williamboman/nvim-lsp-installer' },
        config = [[require 'core.lsp']]
      }

      use {
        'hrsh7th/nvim-cmp',
        requires = { { 'L3MON4D3/LuaSnip' }, { 'onsails/lspkind-nvim' } },
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

      use 'rafamadriz/friendly-snippets'
      use 'saadparwaiz1/cmp_luasnip'
      use 'hrsh7th/cmp-nvim-lsp'
      use 'hrsh7th/cmp-nvim-lsp-signature-help'
      use 'hrsh7th/cmp-buffer'
      use 'hrsh7th/cmp-path'
      use 'hrsh7th/cmp-cmdline'
      use 'petertriho/cmp-git'
      use 'hrsh7th/cmp-nvim-lua'

      use {
        'uga-rosa/cmp-dictionary',
        config = function()
          require('cmp_dictionary').setup({
            dic = {
              ['*'] = { '/usr/share/dict/words' },
            },
          })
        end
      }

      use {
        'tzachar/cmp-tabnine',
        run = './install.sh',
        config = [[require 'extra.tabnine']]
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
      use 'jose-elias-alvarez/typescript.nvim'
      -- use 'tomlion/vim-solidity'
      -- use 'simrat39/rust-tools.nvim'
      -- use 'mfussenegger/nvim-dap'
      -- use 'ThePrimeagen/harpoon'

      use 'ray-x/aurora'
      use 'fenetikm/falcon'
      use 'kyazdani42/blue-moon'
      use 'whatsthatsmell/codesmell_dark.vim'

      use 'ishan9299/nvim-solarized-lua'
      use 'mhartington/oceanic-next'
      use 'folke/tokyonight.nvim'
      use 'rebelot/kanagawa.nvim'
      use 'Mofiqul/vscode.nvim'
      use {
        'rose-pine/neovim',
        as = 'rose-pine',
        tag = 'v1.*',
      }

      use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = [[require 'ui.lualine']]
      }
    end,
    config = {
      luarocks = {
        python_cmd = "python3",
      },
      display = {
        open_fn = function()
          return require('packer.util').float({ border = 'single' })
        end
      }
    }
  }
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/nvim/lua/core/packer.lua",
  command = "source <afile> | PackerCompile",
  desc = "Auto Compile Packer Plugins",
})
