local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

require('lualine').setup {
  options = {
    section_separators = '',
    component_separators = { left = '', right = '' },
    globalstatus = true
  },
  sections = {
    lualine_b = {
      { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
      { 'filename', file_status = true, path = 1, shorting_target = 40 },
    },
    lualine_c = {
      { 'b:gitsigns_head', icon = '', padding = { left = 1, right = 0 } },
      { 'diff', source = diff_source },
    },
    lualine_x = {
      'lsp_progress',
      { 'diagnostics', icons_enabled = true },
    },
    lualine_y = {},
    lualine_z = {},
  }
}
