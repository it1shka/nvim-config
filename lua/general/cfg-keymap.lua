local keymap = {}

function keymap.setup()
	keymap.map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggles nvim-tree panel" })
	keymap.map("n", "<C-l>", ":nohlsearch<CR>", { desc = "Clears built-in text search highlighting" })
	keymap.config_telescope_keymapping()
end

function keymap.config_telescope_keymapping()
	local telescope = require("telescope.builtin")
	keymap.map("n", "tf", telescope.find_files, {
		desc = "Telescope: find files",
	})
	keymap.map("n", "tg", telescope.live_grep, {
		desc = "Telescope: live grep",
	})
	keymap.map("n", "tb", telescope.buffers, {
		desc = "Telescope: buffers",
	})
	keymap.map("n", "th", telescope.help_tags, {
		desc = "Telescope: help tags",
	})
end

function keymap.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		if opts.desc then
			opts.desc = "keymaps.lua: " .. opts.desc
		end
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

return keymap
