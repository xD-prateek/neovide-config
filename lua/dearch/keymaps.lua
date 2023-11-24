-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local term_opts = { silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":resize +2<CR>", opts)

-- Navigate Buffers
keymap("n", "S-l", ":bnext<CR>", opts)
keymap("n", "S-h", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete|NvimTreeClose<CR>", opts)
-- vim.cmd[[
--   autocmd BufReadPattern,bash nmap <leader>bd :bdelete!|NvimTreeClose<CR>
-- ]]

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Fixing the problem of yanking when pasting
keymap("v", "p", '"_dP', opts)

-- NvimTreeToggle
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

-- Terminal --
-- Better terminal navigation
keymap("n", "<C-x>", ":terminal<CR>", term_opts)
keymap("t", "<C-x>", "<C-\\><C-n>", term_opts)
