local opts = { noremap = true, silent = true }

-- NORMAL
vim.keymap.set("n", "<leader>f", ":Pick files <CR>", {desc = "Find file"})

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying to register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Buffers
vim.keymap.set("n", "L", ":bnext<CR>", opts)
vim.keymap.set("n", "H", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>bn", "<cmd> enew <CR>", opts)

-- Writing bindings
vim.keymap.set("n", "<leader>wz", ":ZenMode<CR>", opts)

-- Better window management
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move current line / block with Alt-j/k
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- VISUAL

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv-gv'", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv-gv'", opts)

vim.keymap.set("v", "p", '"_dP', opts)

--vim.keymap.set("n", "<leader>/", require("Comment").toggle.linewise.current, opts)
-- vim.keymap.set(
--"v",
--"<leader>/",
--"<esc><cmd>lua require('Comment').toggle.linewise(vim.fn.visualmode())<cr>",
--opts
--)
