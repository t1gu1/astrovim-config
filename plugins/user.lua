return {
  -- Personal added plugins

  -- Nice to sandbox some tests (Like JSBin but local with live preview)
  { "metakirby5/codi.vim", cmd = "Codi", event = "VeryLazy" },
  -- Show same words that the one under the cursor
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command "augroup user_plugin_cursorword"
      vim.api.nvim_command "autocmd!"
      vim.api.nvim_command "autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0"
      vim.api.nvim_command "autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif"
      vim.api.nvim_command "autocmd InsertEnter * let b:cursorword = 0"
      vim.api.nvim_command "autocmd InsertLeave * let b:cursorword = 1"
      vim.api.nvim_command "augroup END"
    end,
  },
  -- To be able to move line & block of code
  {
    "fedepujol/move.nvim",
    event = "BufRead",
  },
  -- Use some snippet defined in the snippets folder
  {
    "dcampos/nvim-snippy",
    config = function()
      require("snippy").setup {
        mappings = {
          is = {
            ["<Tab>"] = "expand_or_advance",
            -- ['<S-Tab>'] = 'previous',
          },
          nx = {
            ["<leader>x"] = "cut_text",
          },
        },
      }
    end,
  },
}
