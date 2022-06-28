return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'tpope/vim-dispatch'}

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

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- treesitter 
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snipets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  --LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    }
  use "RRethy/vim-illuminate"
  use "b0o/SchemaStore.nvim"
  
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
  -- git
  use 'lewis6991/gitsigns.nvim'

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

