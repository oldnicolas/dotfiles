-- ray-x/aurora
vim.g.aurora_italic = 1
vim.g.aurora_bold = 1
vim.g.aurora_transparent = 1

-- fenetikm/falcon
vim.g.falcon_background = 0
vim.g.falcon_inactive = 1

-- Mofiqul/vscode.nvim
vim.g.vscode_style = 'dark'
vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true

-- folke/tokyonight.nvim
vim.g.tokyonight_transparent = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_lualine_bold = true

-- rebelot/kanagawa.nvim
require('kanagawa').setup({
  transparent = true,
  globalStatus = true
})

-- Tsuzat/NeoSolarized.nvim
vim.g.NeoSolarized_italics = 1
vim.g.NeoSolarized_visibility = 'normal'
vim.g.NeoSolarized_diffmode = 'normal'
vim.g.NeoSolarized_termtrans = 1
vim.g.NeoSolarized_lineNr = 0

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'NeoSolarized',
  callback = function()
    -- pseudo transparency for completion menu
    vim.opt.pumblend = 15
    vim.cmd [[hi PmenuSel blend=0]]

    -- pseudo transparency for floating window
    vim.opt.winblend = 10
  end
})

-- catppuccin/nvim
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
  dim_inactive = {
    enabled = true,
  },
  transparent_background = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin"
  },
  integrations = {
    which_key = true,
  },
})

-- rose-pine/neovim
require('rose-pine').setup({
  ---@usage 'main'|'moon'
  dark_variant = 'main',
  disable_background = true
})

-- luisiacc/gruvbox-baby
vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_transparent_mode = 0

local function apperance()
  local hour = tonumber(os.date("%H"))
  if hour > 7 and hour < 19 then
    return "light"
  else
    return "dark"
  end
end

if apperance() == "light" then
  vim.cmd.colorscheme "tokyonight"
else
  vim.cmd.colorscheme "oxocarbon-lua"
end

-- vim.cmd.colorscheme "oxocarbon-lua"
