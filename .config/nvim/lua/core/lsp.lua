-- Automatic server installation
require("nvim-lsp-installer").setup {
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

local lspconfig = require 'lspconfig'

-- Keymap
local function map(mode, l, r, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, l, r, opts)
end

map('n', 'g[', vim.diagnostic.goto_prev, { desc = 'Diagnostic go to prev' })
map('n', 'g]', vim.diagnostic.goto_next, { desc = 'Diagnostic go to next' })
map('n', '<space>df', vim.diagnostic.open_float, { desc = 'Diagnostic open float' })
map('n', '<space>ds', vim.diagnostic.setloclist, { desc = 'Diagnostic setloclist' })

local custom_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function bufmap(mode, l, r, opts)
    opts = vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {})
    vim.keymap.set(mode, l, r, opts)
  end

  bufmap('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP definition' })
  bufmap('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP declaration' })
  bufmap('n', 'gi', vim.lsp.buf.implementation, { desc = 'LSP implementation' })
  bufmap('n', 'gt', vim.lsp.buf.type_definition, { desc = 'LSP type definition' })
  bufmap('n', 'gr', vim.lsp.buf.rename, { desc = 'LSP rename' })
  bufmap('n', 'ga', vim.lsp.buf.code_action, { desc = 'LSP code action' })
  bufmap('n', 'gR', vim.lsp.buf.references, { desc = 'LSP references' })
  bufmap('n', 'gF', vim.lsp.buf.formatting, { desc = 'LSP formatting' })
  bufmap('n', 'g0', vim.lsp.buf.document_symbol, { desc = 'LSP document symbol' })
  bufmap('n', 'gW', vim.lsp.buf.workspace_symbol, { desc = 'LSP workspace symbol' })

  bufmap('n', 'K', vim.lsp.buf.hover, { desc = 'LSP hover' })
  bufmap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'LSP signature help' })

  bufmap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = 'LSP add workspace folder' })
  bufmap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'LSP remove workspace folder' })
  bufmap('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    { desc = 'LSP list workspace folder' })
end

-- Capabilities
local updated_capabilities = vim.lsp.protocol.make_client_capabilities()

-- Add snippet capabilities supported by nvim-cmp
updated_capabilities = require('cmp_nvim_lsp').update_capabilities(updated_capabilities)

-- Add foldingRange capability supported by nvim-ufo
-- nvim hasn't added foldingRange to default capabilities, users must add it manually
updated_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

-- Sumneko Lua
-- Settings: https://github.com/sumneko/lua-language-server/blob/master/locale/en-us/setting.lua
local sumneko_lua_settings = {
  Lua = {
    completion = {
      callSnippet = 'Disable',
    },
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      globals = { 'vim' },
      neededFileStatus = {
        ['codestyle-check'] = 'Any',
      },
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file('', true),
    },
    telemetry = {
      enable = false,
    },
    format = {
      enable = true,
      defaultConfig = {
        indent_style = 'space',
        indent_size = '2',
      }
    },
  },
}

lspconfig.sumneko_lua.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities,
  settings = sumneko_lua_settings,
}

-- Solidity
-- https://github.com/qiuxiang/solidity-ls
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
require 'lspconfig.configs'.solidity = {
  default_config = {
    cmd = { 'solidity-ls', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = lspconfig.util.find_git_ancestor,
    single_file_support = true,
  },
}

lspconfig.solidity.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}
