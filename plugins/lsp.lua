-- Configure error/warnings interface
vim.diagnostic.config {
  virtual_lines = {
    current_line = true,
  },
  severity_sort = true,
  float = {
    style = "minimal",
    border = "rounded",
    header = "",
    prefix = "",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.HINT] = "⚑",
      [vim.diagnostic.severity.INFO] = "»",
    },
  },
}

require('blink.cmp').setup({
  keymap = {
    preset = 'enter',
  },
  completion = {
    documentation = {auto_show = true},
    ghost_text = {enabled = false}
  },
  fuzzy = {implementation = 'lua'}
})

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      diagnostics = {
        disable = { "missing-fields" },
      }
    },
  },
}

require("lspconfig").rust_analyzer.setup {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {},
  },
}

require("lspconfig").denols.setup {
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
          ["https://cdn.nest.land"] = true,
        },
      },
    },
  },
}
require("lspconfig").ts_ls.setup {
  settings = {
    typescript = {
      suggest = {
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
      },
      preferences = {
        includePackageJsonAutoImports = "auto",
      },
    },
    javascript = {
      suggest = {
        includeCompletionsForModuleExports = true,
      },
    },
  },
}

vim.lsp.enable {
  "lua_ls",
  "typescript-language-server",
  "rust-analyzer",
  "intelephense",
  "gopls",
  "cssls",
  "dockerls",
  "sqls",
}
