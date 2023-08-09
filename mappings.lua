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
    ["<leader>St"] = {
      "<cmd>CodiNew javascript<CR>",
      desc = "Create a JSBin like with inline preview",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>fr"] = {
      "<cmd>lua require('spectre').open_visual({select_word=true, path='!shared/**'})<CR>",
      desc = "Search and replace on all files",
    },
    ["<leader>fR"] = {
      "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
      desc = "Search and replace on current file",
    },
    ["dd"] = {
      '"_dd',
      desc = "Delete without cutting / replace old buffer",
    },
    ["<leader>r"] = {
      "<cmd>RegexplainerToggle<CR>",
      desc = "Regex explainer",
    },
    ["<leader>fp"] = {
      "<cmd>Telescope projects<CR>",
      desc = "Open Projects",
    },
    ["<S-Up>"] = {
      "<cmd>MoveLine(-1)<CR>",
      desc = "Move line up",
    },
    ["<S-Down>"] = {
      "<cmd>MoveLine(1)<CR>",
      desc = "Move line down",
    },
    -- Here, i'm not able to overwrite the Default Mappings.
    ["K"] = {
      "<cmd>MoveLine(-1)<CR>",
      desc = "Move line up",
    },
    ["J"] = {
      "<cmd>MoveLine(1)<CR>",
      desc = "Move line down",
    },
    ["<C-t>"] = {
      "<cmd>ToggleTerm<CR>",
      desc = "Toggle Terminal",
    },
    ["<leader>t<leader>"] = {
      "<cmd>ToggleTerm<CR>",
      desc = "Toggle Terminal",
    },
    ["<leader>s"] = {
      "<cmd>e $MYVIMRC | :cd %:p:h/lua/user/ | wincmd k | pwd | Neotree<CR>",
      desc = "Open AstroVim User Config",
    },
    ["<C-[>"] = {
      "<cmd>bprev<CR>",
      desc = "Go to previous buffer",
    },
    ["<C-]>"] = {
      "<cmd>bnext<CR>",
      desc = "Go to next buffer",
    },
    ["<Esc>"] = {
      "<C-\\><C-n>",
      desc = "Normal Vim Mode",
    },
  },
  t = {
    ["<C-t>"] = {
      "<cmd>ToggleTerm<CR>",
      desc = "Toggle Terminal",
    },
    ["<Esc>"] = {
      "<C-\\><C-n>",
      desc = "Terminal Normal Vim Mode",
    },
    -- A
    -- B
    -- C
    -- D
    -- E
    -- G
    -- H
  },
  v = {
    ["sa"] = {
      "<cmd>lua require('mini.surround').setup()<CR>",
      desc = "Sourround",
    },
    ["d"] = {
      '"_d',
      desc = "Delete without cutting / replace old buffer",
    },

    ["D"] = {
      '"_D',
      desc = "Delete line without cutting / replace old buffer",
    },
    ["<S-Up>"] = {
      ":'<,'> MoveBlock(-1)<CR>",
      desc = "Move block up",
    },
    ["<S-Down>"] = {
      ":'<,'> MoveBlock(1)<CR>",
      desc = "Move block down",
    },
    ["<S-k>"] = {
      ":'<,'> MoveBlock(-1)<CR>",
      desc = "Move block up",
    },
    ["<S-j>"] = {
      ":'<,'> MoveBlock(1)<CR>",
      desc = "Move block down",
    },
  },
}
