function configure_plugins() 
  local Plug = vim.fn['plug#']
  vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'styled-components/vim-styled-components'
  Plug 'neoclide/coc.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'scalameta/nvim-metals'
  Plug 'preservim/nerdtree'
  Plug 'neoclide/vim-jsx-improve'
  Plug 'sbdchd/neoformat'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  -- Support for SQL
  Plug 'tpope/vim-dadbod'
  vim.g.db = 'postgresql:postgres'
  
  -- Color themes:
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'joshdick/onedark.vim'
  Plug 'EdenEast/nightfox.nvim'

  -- Lean support
  Plug 'Julian/lean.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'andrewradev/switch.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'nvim-telescope/telescope.nvim'

  vim.call('plug#end')
end

function configure_metals_for_scala() 
  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach({})
    end,
    group = nvim_metals_group,
  })
end

function configure_tabs()
  local set = vim.opt
  set.tabstop = 2
  set.softtabstop = 2
  set.shiftwidth = 2
  set.expandtab = true
  set.autoindent = true
end

function configure_line_numbers()
  vim.wo.number = true
  vim.wo.cursorline = true
  vim.wo.cursorlineopt = 'number'
  vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white' })
end

function configure_suggestions()
  vim.opt.showmatch = true
  vim.opt.ignorecase = true
  vim.opt.hlsearch = true
  vim.opt.incsearch = true
  vim.opt.wildmode = 'longest,list'
end

function configure_colorscheme()
  vim.cmd "colorscheme duskfox"
end

function configure_key_mappings()
  -- helper function for key mapping in Lua
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
  -- actual mappings
  map('n', '<S-W>', ':NERDTreeToggle<CR>', { desc = 'Toggles NERDTree View' })
  map('n', '<C-l>', ':nohlsearch<CR>', { desc = 'Clears built-in text search highlighting' })
end

function setup_lean()
  require('lean').setup{
    -- TODO: finish setup with instructions here: https://github.com/Julian/lean.nvim
    lsp = {},
    -- lsp = { on_attach = on_attach },
    mappings = true,
  }
end

function setup_telescope()
  -- got from https://github.com/nvim-telescope/telescope.nvim
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

function setup_editor()
  configure_tabs()
  configure_line_numbers()
  configure_suggestions()
  configure_plugins()
  configure_metals_for_scala()
  configure_colorscheme()
  configure_key_mappings()
  setup_lean()
  setup_telescope()
  vim.o.scrolloff = 10
  vim.o.smartindent = true
  -- configure_tabs()
  print('Welcome again, Tikhon')
end

setup_editor()

