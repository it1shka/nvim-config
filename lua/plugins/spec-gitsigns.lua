return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()
	end,
}
