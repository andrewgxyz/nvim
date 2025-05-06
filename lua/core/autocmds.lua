vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    local function get_words()
      return string.format("%d words", vim.fn.wordcount().words)
    end

    vim.opt.spell = true
    vim.opt.wrap = true
    vim.opt.tw = 80

    require("lualine").setup {
      sections = {
        lualine_y = { get_words, "location" },
      },
    }
  end,
})
