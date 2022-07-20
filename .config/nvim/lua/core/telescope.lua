local telescope = require('telescope')
local actions = require('telescope.actions')

-- Setup
telescope.setup {
  defaults = {
    path_display = { truncate = 2 },
		sorting_strategy = "ascending",
		layout_strategy = "flex",
		layout_config = {
      width = 0.95,
      height = 0.95,
      prompt_position = "top",
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },
      vertical = {
        preview_cutoff = 1,
        preview_height = 0.6,
      },
		},
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
        ["<C-j>"] = actions.cycle_history_prev,
        ["<C-k>"] = actions.cycle_history_next,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {}
    }
  }
}

telescope.load_extension 'fzf'
telescope.load_extension 'ui-select'

local function map(mode, l, r, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, l, r, opts)
end

-- File pickers
map('n', '<leader>sf', '<cmd>Telescope find_files<cr>')
map('n', '<leader>sw', '<cmd>Telescope git_files<cr>')
map('n', '<leader>sS', '<cmd>Telescope grep_string<cr>')
map('n', '<leader>sp', '<cmd>Telescope live_grep<cr>')

-- Vim pickers
map('n', '<leader>sb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>sr', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>sc', '<cmd>Telescope commands<cr>')
map('n', '<leader>sh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>sm', '<cmd>Telescope man_pages<cr>')
map('n', '<leader>st', '<cmd>Telescope colorscheme<cr>')
map('n', '<leader>sq', '<cmd>Telescope quickfix<cr>')
map('n', '<leader>sk', '<cmd>Telescope keymaps<cr>')

-- Neovim LSP pickers
map('n', '<leader>sd', '<cmd>Telescope diagnostics<cr>')

-- Git pickers
map('n', '<leader>sgs', '<cmd>Telescope git_status<cr>')
map('n', '<leader>sgc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>sgb', '<cmd>Telescope git_branches<cr>')

-- camgraff/telescope-tmux.nvim
map('n', '<leader>sx', '<cmd>Telescope tmux sessions<cr>')
map('n', '<leader>so', '<cmd>Telescope tmux windows<cr>')

-- Custom pickers
map('n', '<leader>sR', function ()
  require('telescope.builtin').oldfiles({
    prompt_title = 'CWD Recent',
    only_cwd = true
  })
end, { desc = 'CWD Recent' })

map('n', '<leader>sv', function()
  require("telescope.builtin").find_files({
    prompt_title = 'Neovim Config',
    cwd = os.getenv('HOME') .. "/.config/nvim",
  })
end, { desc = 'Neovim Config' })

map('n', '<leader>sa', function()
  require("telescope.builtin").find_files({
    prompt_title = 'Hidden Files',
    find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix', '--no-ignore' },
    file_ignore_patterns = { '.git', 'node_modules' },
    hidden = true
  })
end, { desc = 'Hidden Files' })

