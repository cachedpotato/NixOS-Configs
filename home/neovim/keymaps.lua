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

-- telescope keybinds
local builtin = require('telescope.builtin')

kepmap.set('n', '<leader>ff', builtin.find_files, {desc = "[f]ind [f]iles"})
kepmap.set('n', '<leader>fg', builtin.live_grep, {desc = "[f]ind [g]repped pattern"})
kepmap.set('n', '<leader>fb', builtin.buffers, {desc = "[f]ind [b]uffer"})
kepmap.set('n', '<leader>fh', builtin.help_tags, {desc = "[f]ind [h]elp tags"})




