local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
--
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Wrapping visual block
local blockChars = {
  { opener = "(", closer = ")" },
  { opener = "{", closer = "}" },
  { opener = "[", closer = "]" }
}

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", opts)
keymap("n", "<leader>fa", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false, hidden = true }))<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("v", "<leader>fg", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>fb", "<cmd> Telescope buffers<cr>", opts)
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", opts)
-- git
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts)

-- autocommand for removing auto comment insertion on new line trigger
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

for _, block in ipairs(blockChars) do
  local opener = block.opener
  local closer = block.closer
  keymap("x", "<leader>" .. opener, "<Esc>`>a" .. closer .. "<Esc>`<i" .. opener .. "<Esc>", opts)
  keymap("x", "<leader>" .. closer, "<Esc>`<i" .. opener .. "<Esc>`>la" .. closer .. "<Esc>", opts)
end

local chars = { "\"", "'" }
for _, char in ipairs(chars) do
	keymap("x", "<leader>" .. char, "<Esc>`<i" .. char .. "<Esc>`>la" .. char .. "<Esc>", opts)
end

local status_ok, npairs = pcall(require, "nvim-autopairs")
if status_ok then
	npairs.setup {
	  ignored_next_char = "[%w]"
	}
end

