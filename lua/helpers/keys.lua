local M = {}

-- Function to map any keys dynamically
function M.map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

function M.set_leader(key)
	vim.g.mapleader = " "
end

return M
