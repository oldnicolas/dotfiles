vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local path = vim.fs.find({ "package.json", ".git" })
local vscode_extension_path = vim.env.HOME .. "/.vscode/extensions/"
local juanfranblanco_server = vscode_extension_path .. 'juanblanco.solidity-0.0.139/out/src/server.js'

vim.lsp.start({
  name = "vscode-solidity",
  cmd = { "node", juanfranblanco_server, "--stdio" },
  root_dir = vim.fs.dirname(path[1]),
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
})
