-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return function(mappings)
  local new_mapping = {
    -- first key is the mode
    n = {
      ["<leader>t"] = {
        '<cmd>exe v:count1 . "ToggleTerm"<CR>',
        desc = "Toggle Terminal",
      },
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

      -- Harpoon
      ["<leader>1"] = { function() require("harpoon.ui").nav_file(1) end, desc = "Goto mark 1" },
      ["<leader>2"] = { function() require("harpoon.ui").nav_file(2) end, desc = "Goto mark 2" },
      ["<leader>3"] = { function() require("harpoon.ui").nav_file(3) end, desc = "Goto mark 3" },
      ["<leader>4"] = { function() require("harpoon.ui").nav_file(4) end, desc = "Goto mark 4" },
      ["<leader>5"] = { function() require("harpoon.ui").nav_file(5) end, desc = "Goto mark 5" },
      ["leader>6"] = { function() require("harpoon.ui").nav_file(6) end, desc = "Goto mark 6" },
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
      ["p"] = {
        '"_dP',
        desc = "Paste without replacing your buffer",
      },
      ["P"] = {
        '"_dP',
        desc = "Paste without replacing your buffer",
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

  -- Disable old terminal command
  -- Keep the new "<leader>t" to toggle terminal
  for key, val in pairs(mappings.n) do
    if key:find "<leader>t" and key ~= "<leader>t" then
      local new_key = key:gsub("<leader>t", "<leader>T")
      new_mapping.n[new_key] = val
      new_mapping.n[key] = false
    end
  end

  -- Merge old mappings with the new mappings
  for _k, mode in pairs { "n", "t", "v" } do
    for key, val in pairs(new_mapping[mode]) do
      mappings[mode][key] = val
    end
  end

  return mappings
end
