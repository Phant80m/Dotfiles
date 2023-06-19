-- ===================
-- =		     =
-- = 	Plugins      =
-- =	             =
-- ===================

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	-- init packer,
	use 'wbthomason/packer.nvim'

	-- ======================
	--
	-- 	   LSP SUPPORT
	--
	-- ======================

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- Required dependencies
			{'neovim/nvim-lspconfig'},
			-- Optional dependencies
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
	-- Syntax highlighting
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})



	-- ======================
	--
	-- 	   UI
	--
	-- ======================

	-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}


	-- telescope / fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} } -- Dependency
	}
	-- vscode like variable click actions, and indent lines, 
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"lukas-reineke/indent-blankline.nvim",
		},
		config = function()
			require("barbecue").setup()
		end,
	})
	-- tab bar:
	use 'nvim-tree/nvim-web-devicons'
	use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
	-- dashboard
	use {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
		config = function()
			require"startup".setup(require"config.dashboard")
		end
	}
	-- File tree / explorer
	use 'nvim-tree/nvim-tree.lua'
	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}
	-- colorize
	use {'norcalli/nvim-colorizer.lua'}
	-- Colorscheme
	use {
		"catppuccin/nvim",
		as = "catppuccin"
	}
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
	})


end)
