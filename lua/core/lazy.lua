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
lazy.setup("plugins")

require("helpers.keys").map("n", "<leader>L", lazy.show, "Show lazy")
