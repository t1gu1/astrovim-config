-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>fr"] = {
      "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
      desc = "Search and replace on current file",
    },
    ["<leader>fR"] = {
      "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
      desc = "Search and replace on all files",
    },
  },
  t = {
    -- ["sa"] = {
    --   "<cmd>lua require('mini.surround').setup()<CR>",
    --   desc = "Sourround",
    -- },
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["sa"] = {
      "<cmd>lua require('mini.surround').setup()<CR>",
      desc = "Sourround",
    },
  },
}
