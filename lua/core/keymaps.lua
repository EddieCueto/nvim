local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)

keymap("n", "<leader>pv", "<cmd>Ex<cr>", opts)

-------------------
---- Normal mode --
-------------------
--local opts = { noremap = true, silent = true }
--
--local term_opts = { silent = true }
--
---- Shorten function name
--local keymap = vim.api.nvim_set_keymap
--
----Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
--
---- Hint: see `:h vim.map.set()`
---- Better window navigation
--vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
--vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
--vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
--vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
--
---- Resize with arrows
---- delta: 2 lines
--vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
--vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
--vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
--vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
--
---- open File Explorer
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--
---- Navigate buffers
--vim.keymap.set("n", "<BS>", ":bnext<CR>", opts)
--vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts)
--
---- Telescope
----local builtin = require("telescope.builtin")
----vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
----vim.keymap.set("n", "<C-p>", builtin.git_files, {})
----vim.keymap.set("n", "<leader>ps", function ()
----    builtin.grep_string( { search = vim.fn.input("Grep > ") } );
----end)
--
---- Harpoon
----local mark = require("harpoon.mark")
----local ui = require("harpoon.ui")
----vim.keymap.set("n", "<leader>a", mark.add_file)
----vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
----
----vim.keymap.set("n", "<C-h>", function () ui.nav_file(1) end)
----vim.keymap.set("n", "<C-t>", function () ui.nav_file(2) end)
----vim.keymap.set("n", "<C-n>", function () ui.nav_file(3) end)
----vim.keymap.set("n", "<C-s>", function () ui.nav_file(4) end)
--
---- Undotree
--vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
--
---- Fugitive
--vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
--
---- Put line bellow in-front of line
--vim.keymap.set("n", "J", "mzJ`z")
--
---- Keep cursor in the middle
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")
--
---- Don't loose buffer
--vim.keymap.set("x", "<leader>p", "\"_dP")
--
--
-------------------
---- Visual mode --
-------------------
--
---- Hint: start visual mode with the same area as the previous area and the same mode
--vim.keymap.set("v", "<", "<gv", opts)
--vim.keymap.set("v", ">", ">gv", opts)
--
---- Move text on visual mode
--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
