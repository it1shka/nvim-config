local whitespace = {}

function whitespace.setup()
	vim.opt.tabstop = 2
	vim.opt.softtabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	vim.opt.autoindent = true
end

return whitespace
