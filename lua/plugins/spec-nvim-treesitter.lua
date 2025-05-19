return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"svelte",
			},
			-- TODO: does not work, the treesitter is not enabled initially
			-- TODO: requires either a fix or removal
			highlight = {
				enable = true,
			},
		},
	},
}
