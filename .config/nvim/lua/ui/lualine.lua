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
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true
  },
  sections = {
    lualine_a = {},
    lualine_b = {
      { 'b:gitsigns_head', icon = '' },
      { 'diff', source = diff_source },
    },
    lualine_c = { 'filename', 'diagnostics', },

    lualine_x = { 'lsp_progress' },
    lualine_y = { 'encoding', 'filetype' },
    lualine_z = {},
  }
}
