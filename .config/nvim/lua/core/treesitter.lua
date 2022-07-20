require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'vim',
    'lua',
    'javascript',
    'typescript',
    'solidity',
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}
