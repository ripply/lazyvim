-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
})

-- https://github.com/nvim-java/nvim-java?tab=readme-ov-file#hammer-how-to-install
require("java").setup()
require("lspconfig").jdtls.setup({})
-- require("remote-nvim").setup()
