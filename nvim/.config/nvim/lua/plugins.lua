return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'tpope/vim-dispatch'}

  use({ "kevinhwang91/nvim-bqf", ft = "qf" })
  use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

  use("rcarriga/nvim-notify")
  use("Raimondi/delimitMate")
  use("tpope/vim-surround")
  use("tpope/vim-dotenv")
  use("tpope/vim-fugitive")
  use("tpope/vim-vinegar")
  -- usefull for unix functions
  use("tpope/vim-commentary")

  use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- treesitter 
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp"

  --LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    }

  -- Telescope
  use {
   'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- nvim tree
use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
}
  -- Themes
  use({
          "nvim-lualine/lualine.nvim",
          requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
 
  use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	})

  -- use {'dracula/vim', as = 'dracula'}
  use "EdenEast/nightfox.nvim"

end)

