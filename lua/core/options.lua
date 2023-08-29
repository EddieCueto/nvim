local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  -- termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 4 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

---- Hint: use `:h <option>` to figure out the meaning if needed
--vim.opt.clipboard = "unnamedplus"   -- use system clipboard
--vim.opt.completeopt = {"menu", "menuone", "noselect"}
--vim.opt.mouse = "a"                 -- allow the mouse to be used in Nvim
--
---- Fonts
--vim.opt.encoding="utf-8"
--vim.opt.guifont = "Meslo LG M Bold for Powerline:h10"
--
---- Tab
--vim.opt.tabstop = 4                 -- number of visual spaces per TAB
--vim.opt.softtabstop = 4             -- number of spacesin tab when editing
--vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
--vim.opt.expandtab = true            -- tabs are spaces, mainly because of python
--
---- UI config
--vim.opt.number = true               -- show absolute number
--vim.opt.relativenumber = true       -- add numbers to each line on the left side
--vim.opt.cursorline = false          -- highlight cursor line underneath the cursor horizontally
--vim.opt.splitbelow = true           -- open new vertical split bottom
--vim.opt.splitright = true           -- open new horizontal splits right
--vim.opt.termguicolors = true        -- enable 23-bit RGB color in the TUI
--vim.opt.showmode = false            -- we are experienced, wo don"t need the "-- INSERT --" mode hint
--
---- File recovery options
--vim.opt.swapfile = false
--vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true
--
---- Color column
--vim.opt.colorcolumn = "80"
--
---- Searching
--vim.opt.incsearch = true            -- search as characters are entered
--vim.opt.hlsearch = false            -- do not highlight matches
--vim.opt.ignorecase = true           -- ignore case in searches by default
--vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered
--
---- LSP options
--vim.diagnostic.config({
--  virtual_text = false
--})
---- Show line diagnostics automatically in hover window
--vim.o.updatetime = 250
--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--
--
--
---- Leader key
--vim.g.mapleader = " "
----vim.g.maplocalleader = " "
--vim.g.maplocalleader = "\\"
--
---- Airline
--vim.g.airline_powerline_fonts = 1
--
---- Zig
--vim.g.zig_fmt_autosave = 1
---- Set completeopt to have a better completion experience
----set completeopt=menuone,noinsert,noselect
--vim.opt.completeopt = "menuone,noinsert,noselect"
---- Enable completions as you type
--vim.g.completion_enable_auto_popup = 1
--
---- Python
--vim.g.loaded_python_provider = 0
--vim.g.python3_host_prog = "/usr/local/bin/python"
--
---- Vimtex options:
--vim.g.vimtex_view_method = "zathura"
--vim.g.vimtex_general_viewer = "zathura"
--vim.g.vimtex_quickfix_mode = 0
--
---- Ignore mappings
--vim.g.vimtex_mappings_enabled = 1
--
------ Auto Indent
----vim.g["vimtex_indent_enabled"] = 1
--
------ Syntax highlighting
--vim.g.vimtex_syntax_enabled = 0
--
---- Error suppression:
--vim.g.vimtex_log_ignore = ({
--  "Underfull",
--  "Overfull",
--  "specifier changed to",
--  "Token not allowed in a PDF string",
--})
