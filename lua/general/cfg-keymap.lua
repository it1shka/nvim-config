local keymap = {}

function keymap.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then
      opts.desc = "keymaps.lua: " .. opts.desc
    end
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function keymap.setup()
  keymap.map('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggles nvim-tree panel' })
  keymap.map('n', '<C-l>', ':nohlsearch<CR>', { desc = 'Clears built-in text search highlighting' })
end

return keymap
