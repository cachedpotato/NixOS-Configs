vim.g.mapleader = ' '

local keymap = vim.keymap

-- insert mode keymaps
keymap.set("i", "jk", "<ESC>", {desc = "Exit insert mode with jk"})

-- normal mode keybinds
keymap.set("n", "<leader>uh", ":noh<CR>", {desc = "undo highlight"})
keymap.set("n", "}", "<C-d>zz", {desc = "move half screen up & adjust"})
keymap.set("n", "{", "<C-u>zz", {desc = "move half screen down & adjust"})
keymap.set("n", "<leader>+", "<C-a>", {desc = "increment number"})
keymap.set("n", "<leader>-", "<C-x>", {desc = "decrement number"})



