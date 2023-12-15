local M = {}

-- Function to map keys. calls vim.keymap.set underneath.
-- Parameters:
--  mode (string | table): Mode to set keymap for. Ex: n | i | v |
--  lhs (string): Key to set mapping for.
--  rhs (string | function): Function or value of keymap.
--  desc (table | nil) : Optional description
M.map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

M.set_leader = function(key)
	vim.g.mapleader = key
	vim.g.maplocalleader = key
	M.map({ "n", "v" }, key, "<nop>")
end

return M
