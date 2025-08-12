local opts = { noremap = true, silent = true }
local map = vim.keymap.set

local function mapdesc(desc)
  return {noremap = true, silent = true, desc = desc}
end

-- NORMAL
map("n", "<leader>f", ":Pick files <CR>", mapdesc("Find file"))

-- quit file
map("n", "<C-q>", "<cmd> q <CR>", mapdesc("Quit file"))

-- delete single character without copying to register
map("n", "x", '"_x', opts)

-- Vertical scroll and center
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Change in word as default
map("n", "cw", "ciw", opts)

-- Buffers
map("n", "L", ":bnext<CR>", opts)
map("n", "H", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bd<CR>", mapdesc("Close buffer"))
map("n", "<leader>bn", "<cmd> enew <CR>", mapdesc("New buffer"))

-- Writing bindings
map("n", "<leader>wz", ":ZenMode<CR>", mapdesc("Toggle ZenMode"))

-- Better window management
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move current line / block with Alt-j/k
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- VISUAL

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("v", "<A-j>", ":m '>+1<CR>gv-gv'", opts)
map("v", "<A-k>", ":m '<-2<CR>gv-gv'", opts)

map("v", "p", '"_dP', opts)

map({ "n", "v" }, "<leader>/", ":Comment<CR>", mapdesc("Toggle comments"))
