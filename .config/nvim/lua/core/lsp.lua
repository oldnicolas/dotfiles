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

-- LSP Config
local lspconfig = require('lspconfig')

-- Keymap
local function map(mode, l, r, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, l, r, opts)
end

map('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Diagnostic go to prev' })
map('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Diagnostic go to next' })
map('n', '<space>df', vim.diagnostic.open_float, { desc = 'Diagnostic open float' })
map('n', '<space>ds', vim.diagnostic.setloclist, { desc = 'Diagnostic setloclist' })

local custom_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function bufmap(mode, l, r, opts)
    opts = vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {})
    vim.keymap.set(mode, l, r, opts)
  end

  bufmap('n', '<space>la', vim.lsp.buf.code_action, { desc = 'LSP code action' })
  bufmap('n', '<space>ld', vim.lsp.buf.definition, { desc = 'LSP definition' })
  bufmap('n', '<space>lD', vim.lsp.buf.declaration, { desc = 'LSP declaration' })
  bufmap('n', '<space>li', vim.lsp.buf.implementation, { desc = 'LSP implementation' })
  bufmap('n', '<space>lt', vim.lsp.buf.type_definition, { desc = 'LSP type definition' })
  bufmap('n', '<space>lr', vim.lsp.buf.rename, { desc = 'LSP rename' })
  bufmap('n', '<space>lR', vim.lsp.buf.references, { desc = 'LSP references' })
  bufmap('n', '<space>lf', vim.lsp.buf.formatting, { desc = 'LSP formatting' })
  bufmap('n', '<space>ls', vim.lsp.buf.document_symbol, { desc = 'LSP document symbol' })
  bufmap('n', '<space>lw', vim.lsp.buf.workspace_symbol, { desc = 'LSP workspace symbol' })
  bufmap('n', '<space>lk', vim.lsp.buf.hover, { desc = 'LSP hover' })
  bufmap('n', '<space>lh', vim.lsp.buf.signature_help, { desc = 'LSP signature help' })

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
-- https://github.com/folke/lua-dev.nvim/blob/main/lua/lua-dev/sumneko.lua
local luadev = require("lua-dev").setup({
  lspconfig = {
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Disable',
        },
        diagnostics = {
          globals = { 'vim' },
          neededFileStatus = {
            ['codestyle-check'] = 'Any',
          },
        },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = 'space',
            indent_size = '2',
          }
        },
      },
    },
  }
})

lspconfig.sumneko_lua.setup(luadev)

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

-- Typescript
require("typescript").setup({
  server = {
    on_attach = custom_attach,
    capabilities = updated_capabilities,
  },
})

-- LSP Signature
require("lsp_signature").setup({
  log_path = vim.env.HOME .. "/.cache/nvim/lsp-signature.log",
  -- debug = true,
  -- floating_window = false,
  -- handler_opts = { border = "single" },
  -- transparency = 10,
})

-- UI Customization
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
