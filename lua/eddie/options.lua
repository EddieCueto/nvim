vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
-- Fonts
vim.opt.encoding = "utf-8"
vim.opt.guifont = "FiraCodeNerdFont-Regular:h10"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- LSP options
vim.diagnostic.config({
    virtual_text = false
})
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Vimtex options:
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_general_viewer = "zathura"
vim.g.vimtex_quickfix_mode = 0

-- OBSD options
--vim.g.vimtex_compiler_latexmk={ 'cmd': '' }


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

