--local builtin = require('vim-floaterm.builtin')

vim.keymap.set("n", "<leader>TS",
    "<cmd>:FloatermNew --height=0.3 --width=0.8 --wintype=float --name=floaterm1 --position=center --autoclose=2<CR>", { desc = "Open FloatTerm" })
vim.keymap.set("n", "<leader>TT",
    "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
vim.keymap.set("t", "<leader>TT",
    "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
