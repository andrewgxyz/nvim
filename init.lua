require "core.options"
require "core.autocmds"

vim.pack.add({
  {
    src = "https://github.com/catppuccin/nvim",
    name = "catppuccin",
  },
  { src = 'https://github.com/saghen/blink.cmp' },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/vimwiki/vimwiki" },
  { src = "https://github.com/folke/zen-mode.nvim" },
  -- Detect tabstop and shiftwidth automatically
  { src = "https://github.com/tpope/vim-sleuth" },
  -- Powerful Git integration for Vim
  { src = "https://github.com/tpope/vim-fugitive" },
  -- GitHub integration for vim-fugitive
  { src = "https://github.com/tpope/vim-rhubarb" },
  -- Hints keybinds
  { src = "https://github.com/folke/which-key.nvim" },
  -- Autoclose parentheses, brackets, quotes, etc.
  { src = "https://github.com/windwp/nvim-autopairs" },
  -- High-performance color highlighter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = 'https://github.com/akinsho/bufferline.nvim' },
  { src = 'https://github.com/moll/vim-bbye' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/terrortylor/nvim-comment' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvimtools/none-ls-extras.nvim' },
  { src = 'https://github.com/nvimtools/none-ls.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
})

vim.cmd.colorscheme "catppuccin"
vim.cmd("set completeopt+=noselect")

-- Plugin configurations
require("plugins.lsp")
require("plugins.lualine")
require("plugins.none-ls")

require('oil').setup()
require("blink.cmp").setup({
  -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- 'super-tab' for mappings similar to vscode (tab to accept)
  -- 'enter' for enter to accept
  -- 'none' for no mappings
  --
  -- All presets have the following mappings:
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  --
  -- See :h blink-cmp-config-keymap for defining your own keymap
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = { documentation = { auto_show = false } },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})

require("gitsigns").setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  signs_staged = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
})

require("ibl").setup({
  indent = {
    char = '▏',
  },
  scope = {
    show_start = false,
    show_end = false,
    show_exact_scope = false,
  },
  exclude = {
    filetypes = {
      'help',
      'startify',
      'dashboard',
      'packer',
      'neogitstatus',
      'NvimTree',
      'Trouble',
    },
  },
})

require("mini.pick").setup()
require("nvim_comment").setup()

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c", "c_sharp", "cpp", "css",
    "dart", "dockerfile",
    "go", "gomod", "gosum", "gowork",
    "html", "http",
    "javascript", "json",
    "kotlin",
    "lua",
    "make", "mermaid", "muttrc", "markdown",
    "nginx",
    "php", "prisma", "python",
    "regex", "rust",
    "scss", "sql", "ssh_config",
    "typescript", "toml",
    "xml", "yaml", "zig"
  },
  highlight = { enable = true }
})

require("nvim-autopairs").setup({
  event = "InsertEnter",
  config = true,
  opts = {},
})

require('bufferline').setup {
  options = {
    mode = 'buffers',              -- set to "tabs" to only show tabpages instead
    themable = true,               -- allows highlight groups to be overriden i.e. sets highlights as default
    numbers = 'none',              -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
    buffer_close_icon = '✗',
    close_icon = '✗',
    path_components = 1, -- Show only the file name without the directory
    modified_icon = '●',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    show_tab_indicators = false,
    indicator = {
      -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'none', -- Options: 'icon', 'underline', 'none'
    },
    icon_pinned = '󰐃',
    minimum_padding = 1,
    maximum_padding = 5,
    maximum_length = 15,
    sort_by = 'insert_at_end',
  },
  highlights = {
    separator = {
      fg = '#434C5E',
    },
    buffer_selected = {
      bold = true,
      italic = false,
    },
  },
}

require("zen-mode").setup({
  window = {
    width = 84,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
    },
  },
})

require "core.keymaps"
