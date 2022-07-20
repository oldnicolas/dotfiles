vim.g.solarized_termtrans = 1
vim.g.solarized_italics = 1

vim.g.falcon_background = 0
vim.g.falcon_inactive = 1

vim.g.aurora_italic = 1
vim.g.aurora_bold = 1

vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1

vim.g.vscode_style = 'dark'
vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true

vim.g.tokyonight_transparent = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_lualine_bold = true

require('rose-pine').setup({
  ---@usage 'main'|'moon'
  dark_variant = 'main',
  disable_background = true
})

require('kanagawa').setup({
  transparent = true,
  globalStatus = true
})

local function day_time()
  local hour = tonumber(os.date("%H"))
  if hour > 7 and hour < 19 then
    return "light"
  else
    return "dark"
  end
end

local apperance = day_time()

if apperance == "light" then
  vim.cmd [[colorscheme kanagawa]]
else
  vim.cmd [[colorscheme codesmell_dark]]
end

