local M = {}

-- Function to map keys. calls vim.keymap.set underneath.
-- Parameters:
--  mode (string | table): Mode to set keymap for. Ex: n | i | v |
--  lhs (string): Key to set mapping for.
--  rhs (string | function): Function or value of keymap.
--  desc (table | nil) : Optional description
function M.map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Function: Set leader key. calls vim.g.mapleader
-- Parameters:
--  key: string
function M.set_leader(key)
	vim.g.mapleader = key
end

return M
