local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

-- set leader key. required for nvim to work.
require("helpers.keys").set_leader(" ")

-- Load plugins.
-- Leader key must be setup before this
lazy.setup({
	{
		"navarasu/onedark.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	-- other colorschemes:
	{ "tanvirtin/monokai.nvim", lazy = true },

	{ "https://github.com/rose-pine/neovim", name = "rose-pine", lazy = true },

	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			styles = {
				terminal_colors = true,
				comments = { italic = false },
				keywords = { italic = false },
			},
		},
	},

	-- Icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- Neoconf
	{ "folke/neoconf.nvim", cmd = "Neoconf" },

	-- For plugin development
	{ "folke/neodev.nvim" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- WhichKey
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup()
		end,
	},

	-- LSP
	{ "neovim/nvim-lspconfig" },

	-- Lsp completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },

	-- Lua snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	-- Nvim completions
	{
		"hrsh7th/nvim-cmp",
	},

	-- Lua snippets completions
	{ "saadparwaiz1/cmp_luasnip" },

	-- Alpha Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},

	-- Git labels
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("gitsigns").setup({})
		end,
	},

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},

	{
		"freddiehaddad/feline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
		},
	},
	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Indent line
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- Tag viewer
	{ "preservim/tagbar" },

	-- Autopair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- For Code Commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- For notification
	{ "rcarriga/nvim-notify" },

	-- Snippets
	{ "rafamadriz/friendly-snippets" },

	-- Coroutine library
	{ "nvim-lua/plenary.nvim" },

	-- Automatic indentation
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	-- Code outline window
	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	},

	-- Automatic pairing
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- Code runner
	{ "CRAG666/code_runner.nvim" },

	-- Highlight words on cursor line
	{ "yamatsum/nvim-cursorline" },

	-- Autocreate folders on save
	{
		"jghauser/mkdir.nvim",
	},

	-- UI Component library
	{ "MunifTanjim/nui.nvim" },

	-- Material colorscheme
	{ "marko-cerovac/material.nvim" },

	-- Toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},

	-- Improved yank and put
	{ "gbprod/yanky.nvim" },

	-- Trouble
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Autosave
	{ "pocco81/auto-save.nvim" },

	-- Buffer delete
	{ "famiu/bufdelete.nvim" },

	-- Git conflict
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup()
		end,
	},

	--  Image preview
	{ "adelarsq/image_preview.nvim" },

	-- Simple statusbar
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},

	-- Vscode like winbar for LSP context
	{
		"utilyre/barbecue.nvim",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup()
		end,
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},

	-- Improve UI
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- Debugger adapter protocol
	{ "mfussenegger/nvim-dap" },

	-- Auto close/rename html tags
	{ "windwp/nvim-ts-autotag" },

	-- Git completions
	{
		"petertriho/cmp-git",
		dependencies = "nvim-lua/plenary.nvim",
	},

	-- Code formatter
	{ "mhartington/formatter.nvim" },

	-- Add/change/delete surrounding delimiter pairs: Helpful
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- Rainbow delimiters
	"HiPhish/rainbow-delimiters.nvim",

	-- Shows colorcode
	"norcalli/nvim-colorizer.lua",

	-- Comment box
	"LudoPinelli/comment-box.nvim",

	-- nvim telescope
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- telescope emoji
	"xiyaowong/telescope-emoji.nvim",

	-- Bridges mason and null-ls
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},

	-- Search snippet and glance
	"kevinhwang91/nvim-hlslens",

	-- Neovim notification
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},

	-- Completions
	"lukas-reineke/cmp-under-comparator",

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
})

require("helpers.keys").map("n", "<leader>L", lazy.show, "Show lazy")
