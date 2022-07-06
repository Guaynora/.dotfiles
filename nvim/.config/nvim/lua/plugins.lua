vim.cmd([[packadd packer.nvim]])
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use("lewis6991/impatient.nvim")
  use("tjdevries/colorbuddy.nvim")
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
  use "b0o/SchemaStore.nvim"
  use "RRethy/vim-illuminate"
  -- usefull for unix functions
  use("tpope/vim-commentary")

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- treesitter 
  use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	})

  -- completition 
  use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind-nvim",
        "L3MON4D3/LuaSnip",
        "windwp/nvim-autopairs",
        "rafamadriz/friendly-snippets",
      },
  })

  --LSP

  use({
      "neovim/nvim-lspconfig",
      "williamboman/nvim-lsp-installer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "jose-elias-alvarez/null-ls.nvim",
  })

  
  -- Telescope
  use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
        { "nvim-telescope/telescope-fzy-native.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" },
        { "tom-anders/telescope-vim-bookmarks.nvim" },
        { "kyazdani42/nvim-web-devicons" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-dap.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
  })

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

