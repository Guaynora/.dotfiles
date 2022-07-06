pcall(require, "impatient")
if require "first_load" () then
  return
end

vim.g.mapleader = " "
require('plugins')

-- require('options')
require('keymaps')
require('globals')
require('gitsigns-config')
require('nvim-tree-config')
require('lualine-config')
require('telescope-config')
require('telescope-config.setup')
require('telescope-config.mappings')
require('completions')
vim.cmd("colorscheme nightfox")
