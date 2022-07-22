local download_packer = function()
  if vim.fn.input "Download Packer? (y for yes)" ~= "y" then
    return
  end

  local directory = string.format("%s/site/pack/packer/start/", vim.fn.stdpath "data")

  vim.fn.mkdir(directory, "p")

  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print "Downloading packer.nvim..."
  print(out)
  print "( You'll will be restart now )"

  vim.cmd [[qa]]
end

if not pcall(require, "packer") then
  download_packer()
else
  require 'core.plugins'
end
