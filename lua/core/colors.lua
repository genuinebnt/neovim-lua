-- Setup colorscheme
local status_ok, color_scheme = pcall(require, "onedark")
if not status_ok then
	return
end

-- Configuration for onedark colorscheme
require("onedark").setup({
	style = "darker",
})

require("onedark").load()
