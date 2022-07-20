vim.g.solarized_termtrans = 1
vim.g.solarized_italics = 1

vim.g.falcon_background = 0
vim.g.falcon_inactive = 1

vim.g.vscode_style = 'dark'
vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true

vim.g.tokyonight_transparent = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_lualine_bold = true

vim.g.nightflyNormalFloat = 1
vim.g.nightflyTransparent = 1

vim.g.moonflyNormalFloat = 1
vim.g.moonflyTransparent = 1

require('rose-pine').setup({
  ---@usage 'main'|'moon'
  dark_variant = 'main',
  disable_background = true
})

require('kanagawa').setup({
  transparent = true,
  globalStatus = true
})

vim.cmd [[colorscheme kanagawa]]
