-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = "unnamedplus"   -- use system clipboard
vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.mouse = "a"                 -- allow the mouse to be used in Nvim

-- Fonts
vim.opt.encoding="utf-8"
vim.opt.guifont = "Meslo LG M Bold for Powerline:h10"

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = false          -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enable 23-bit RGB color in the TUI
vim.opt.showmode = false            -- we are experienced, wo don"t need the "-- INSERT --" mode hint

-- File recovery options
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Color column
vim.opt.colorcolumn = "80"

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- LSP options
vim.diagnostic.config({
  virtual_text = false
})
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]



<<<<<<< HEAD


=======
>>>>>>> Linux
-- Leader key
vim.g.mapleader = " "
--vim.g.maplocalleader = " "
vim.g.maplocalleader = "\\"

<<<<<<< HEAD
=======
-- Undotree instead of swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

>>>>>>> Linux
-- Airline
vim.g.airline_powerline_fonts = 1

-- Zig
vim.g.zig_fmt_autosave = 1
-- Set completeopt to have a better completion experience
--set completeopt=menuone,noinsert,noselect
vim.opt.completeopt = "menuone,noinsert,noselect"
-- Enable completions as you type
vim.g.completion_enable_auto_popup = 1

-- Python
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/usr/local/bin/python"

-- Vimtex options:
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_general_viewer = "zathura"
vim.g.vimtex_quickfix_mode = 0

-- Ignore mappings
vim.g.vimtex_mappings_enabled = 1

---- Auto Indent
--vim.g["vimtex_indent_enabled"] = 1

---- Syntax highlighting
vim.g.vimtex_syntax_enabled = 0

-- Error suppression:
vim.g.vimtex_log_ignore = ({
  "Underfull",
  "Overfull",
  "specifier changed to",
  "Token not allowed in a PDF string",
})


