require "core.options"
require "core.autocmds"

vim.pack.add {
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://github.com/folke/zen-mode.nvim" },
  -- Detect tabstop and shiftwidth automatically
  { src = "https://github.com/tpope/vim-sleuth" },
  -- Hints keybinds
  { src = "https://github.com/folke/which-key.nvim" },
  -- High-performance color highlighter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/terrortylor/nvim-comment" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
}

vim.cmd.colorscheme "catppuccin"
vim.cmd "set completeopt+=noselect"

-- Plugin configurations
require "plugins.bufferline"
require "plugins.gitsigns"
require "plugins.ibl"
require "plugins.lsp"
require "plugins.lualine"
require "plugins.nvim-treesitter"
require "plugins.zen-mode"
require("mini.pick").setup()
require("nvim_comment").setup()
require("render-markdown").setup {
  latex = { enabled = false },
  completions = { blink = {enabled = true} },
}
require("oil").setup()

require "core.keymaps"
