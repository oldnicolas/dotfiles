-- Automatic server installation ==============================================
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  automatic_installation = true,
})

-- LSP Config =================================================================
local function map(mode, l, r, options)
  options = vim.tbl_extend("force", { noremap = true, silent = true }, options or {})
  vim.keymap.set(mode, l, r, options)
end

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

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

-- Sumneko Lua ================================================================
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

-- Solidity ===================================================================
-- brew install solidity
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

-- https://github.com/qiuxiang/solidity-ls
-- npm i solidity-ls -g
configs.qiuxiang_solidity = {
  default_config = {
    cmd = { 'solidity-ls', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = function(fname)
      return util.find_git_ancestor(fname)
          or util.find_node_modules_ancestor(fname)
          or util.find_package_json_ancestor(fname)
          or vim.loop.cwd()
    end,
    single_file_support = true,
  },
}

-- https://github.com/juanfranblanco/vscode-solidity
local vscode_extension_path = vim.env.HOME .. "/.vscode/extensions/"
local juanfranblanco_server = vscode_extension_path .. 'juanblanco.solidity-0.0.139/out/src/server.js'

configs.juanfranblanco_solidity = {
  default_config = {
    cmd = { "node", juanfranblanco_server, "--stdio" },
    filetypes = { "solidity" },
    root_dir = function(fname)
      return util.find_git_ancestor(fname)
          or util.find_node_modules_ancestor(fname)
          or util.find_package_json_ancestor(fname)
          or vim.loop.cwd()
    end,
    init_options = vim.fn.stdpath("cache"),
    settings = {
      solidity = {
        nodemodulespackage = "solc",
        compileUsingRemoteVersion = "latest",
        compilerOptimization = 200,
        compileUsingLocalVersion = "",
        defaultCompiler = "remote", -- remote | localFile | localNodeModule | embedded
        linter = "solhint", -- solhint | solium
        solhintRules = nil,
        formatter = "prettier", -- prettier | none
        soliumRules = {
          ["imports-on-top"] = 0,
          ["variable-declarations"] = 0,
          ["indentation"] = { "off", 4 },
          ["quotes"] = { "off", "double" },
        },
        enabledAsYouTypeCompilationErrorCheck = true,
        validationDelay = 1500,
        packageDefaultDependenciesDirectory = "node_modules",
        packageDefaultDependenciesContractsDirectory = "",
      },
    },
  },
}

local default_server_settings = {
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

-- lspconfig.juanfranblanco_solidity.setup(default_server_settings)
-- lspconfig.qiuxiang_solidity.setup(default_server_settings)

-- Typescript =================================================================
require("typescript").setup({
  server = default_server_settings,
})

-- Rust =======================================================================
require('rust-tools').setup({
  server = {
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    standalone = true,
  }
})

-- Diagnostic =================================================================
-- Renders diagnostics using virtual lines on top of the real line of code
-- require("lsp_lines").setup()

vim.diagnostic.config({
  -- Disable virtual_text since it's redundant due to lsp_lines.
  virtual_text = true,
  -- With the default settings, you will not see updated diagnostics until you
  -- leave insert mode. Set update_in_insert = true if you want diagnostics to
  -- update while in insert mode.
  update_in_insert = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

map('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = "Jump to previous diagnostic" })
map('n', '<leader>dd', vim.diagnostic.goto_next, { desc = 'Jump to next diagnostic' })
map('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Show diagnostics in floating window.' })
map('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'Add diagnostics to location list.' })

vim.keymap.set("", "<Leader>dl", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- LSP signature hint =========================================================
require("lsp_signature").setup({
  log_path = vim.env.HOME .. "/.cache/nvim/lsp-signature.log",
})
