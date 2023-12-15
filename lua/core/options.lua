-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- Show line number
opt.relativenumber = true -- line numbers relative to current line
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
opt.colorcolumn = "80" -- Line lenght marker at 80 columns
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline
opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
opt.encoding = "utf-8"
opt.showmatch = true
opt.undofile = true
opt.sw = 2
opt.showmatch = true
opt.laststatus = 2
vim.cmd("syntax on")
opt.list = true
opt.termguicolors = true
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.foldmethod = "foldlevel"
vim.notify = require("notify")
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

local async = require("plenary.async")

--g.indent_blankline_exclude_children = 0
-- g.indent_blankline_exclude_children = false

--[[ require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
}) ]]

require("ibl").setup()

wnotify = require("notify")

wnotify.setup({
	stages = "fade",
	render = "compact",
})

wnotify("Welcome")

require("guess-indent").setup({})

--------------------------------
require("aerial").setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})
-- You probably also want to set a keymap to toggle aerial
--vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')

-- vim.notify("This is an error message", "error")
-- Cuando Neovim se inicia
-- vim.cmd([[autocmd VimEnter * nno]])

-- Cuando Neovim se cierra
vim.cmd([[autocmd VimLeave * lua os.execute("pkill -f live-server")]])

require("yanky").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	ring = {
		history_length = 100,
		storage = "shada",
		sync_with_numbered_registers = true,
		cancel_event = "update",
		ignore_registers = { "_" },
	},
	system_clipboard = {
		sync_with_ring = true,
	},
})

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

--
--
require("colorizer").setup({
	"*", -- Highlight all files, but customize some others.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	css = { names = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = true }, -- Disable parsing "names" like Blue or Gray
})
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

vim.cmd([[
hi default link UfoPreviewSbar PmenuSbar
hi default link UfoPreviewThumb PmenuThumb
hi default link UfoPreviewWinBar UfoFoldedBg
hi default link UfoPreviewCursorLine Visual
hi default link UfoFoldedEllipsis Comment
hi default link UfoCursorFoldedLine CursorLine]])

require("hlslens").setup()

local kopts = { noremap = true, silent = true }
