require("config.lazy")

local function configure_tabs()
  local set = vim.opt
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true
  vim.opt.autoindent = true
end

local function configure_key_mappings()
  local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end
  map('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggles nvim-tree panel' })
  map('n', '<C-l>', ':nohlsearch<CR>', { desc = 'Clears built-in text search highlighting' })
end

configure_tabs()
configure_key_mappings()
