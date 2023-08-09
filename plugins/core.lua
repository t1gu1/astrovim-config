return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- luacheck: push ignore
      local diablo_skull = {
        "9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP",
        " 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP",
        "  `9XXXXXXXXXXXXXXXXXXXXX'~   ~`OOO8b   d8OOO'~   ~`XXXXXXXXXXXXXXXXXXXXXP'",
        "    `9XXXXXXXXXXXP' `9XX'   DIE    `98v8P'  HUMAN   `XXP' `9XXXXXXXXXXXP'",
        "        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~",
        "                        )b.  .dbo.dP'`v'`9b.odb.  .dX(",
        "                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.",
        "                     dXXXXXXXXXXXP'   .   `9XXXXXXXXXXXb",
        "                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb",
        "                    9XXb'   `XXXXXb.dX|Xb.dXXXXX'   `dXXP",
        "                     `'      9XXXXXX(   )XXXXXXP      `'",
        "                              XXXX X.`v'.X XXXX",
        "                              XP^X'`b   d'`X^XX",
        "                              X. 9  `   '  P )X",
      }

      local cutty_cat = {
        "  ⟋|､",
        " (°､ ｡ 7",
        " |､  ~ヽ",
        " じしf_,)〳",
      }

      local dead_cutty_cat = {
        '          !:~~~ .:!M"T#$$$$WX??#MRRMMM!',
        '          ~?WuxiW*`   `"#$$$$8!!!!??!!!',
        '        :X- M$$$$       `"T#$T~!8$WUXU~',
        "       :%`  ~#$$$m:        ~!~ ?$$$$$$",
        '     :!`.-   ~T$$$$8xx.  .xWW- ~""##*"',
        "   -~~:<` !    ~?T#$$@@W@*?$$      /`",
        '!!! .!~~ !!     .:XUW$W!~ `"~:    :',
        ".:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`",
        '!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~',
        ' :X@!.-~   ?@WTWo("*$$$W$TH$! `    ⟋|､',
        'X$?!-~    : ?$$$B$Wu("**$RM!      (°､ ｡ 7',
        "~~ !     :   ~$$$$$B$$en:``       |､  ~ヽ",
        "W.~    :       ~##*$$$M~          じしf_,)〳",
      }

      local pikachu = {
        "          ▀████▀▄▄              ▄█ ",
        "            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
        "    ▄        █          ▀▀▀▀▄  ▄▀  ",
        "   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
        "  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
        "  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
        "   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
        "    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
        "   █   █  █      ▄▄           ▄▀   ",
      }
      -- luacheck: pop

      -- You can choose between diablo_skull, cutty_cat, dead_cutty_cat, pikachu
      opts.section.header.val = cutty_cat

      local button = require("astronvim.utils").alpha_button
      opts.section.buttons.val = {
        button("LDR S l", "  Last Session  "),
        button("LDR S f", "  Find Recent sessions"),
        button("LDR f p", "  Open Project  "),
        button("LDR s", "  Settings  "),
      }
      return opts
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { -- add a new dependency to telescope that is our new plugin
      "project_nvim",
    },
    -- the first parameter is the plugin specification
    -- the second is the table of options as set up in Lazy with the `opts` key
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      local telescope = require "telescope"
      telescope.load_extension "projects"
    end,
  },

  {
    "nvim-pack/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup {
        -- default = {
        --   find = {
        --     cmd = "rg",
        --     options = {},
        --   },
        --   replace = {
        --     cmd = "sed",
        --   },
        -- },
        -- Have to keep it up to date.. (Is there a way to only overite "send_to_qf")
        mapping = {
          ["send_to_qf"] = {
            map = "<C-'>",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all items to quickfix",
          },
          ["toggle_line"] = {
            map = "dd",
            cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
            desc = "toggle item",
          },
          ["enter_file"] = {
            map = "<cr>",
            cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
            desc = "open file",
          },
          ["replace_cmd"] = {
            map = "<leader>c",
            cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
            desc = "input replace command",
          },
          ["show_option_menu"] = {
            map = "<leader>o",
            cmd = "<cmd>lua require('spectre').show_options()<CR>",
            desc = "show options",
          },
          ["run_current_replace"] = {
            map = "<leader>rc",
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = "replace current line",
          },
          ["run_replace"] = {
            map = "<leader>R",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all",
          },
          ["change_view_mode"] = {
            map = "<leader>v",
            cmd = "<cmd>lua require('spectre').change_view()<CR>",
            desc = "change result view mode",
          },
          ["change_replace_sed"] = {
            map = "trs",
            cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
            desc = "use sed to replace",
          },
          ["change_replace_oxi"] = {
            map = "tro",
            cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
            desc = "use oxi to replace",
          },
          ["toggle_live_update"] = {
            map = "tu",
            cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
            desc = "update when vim writes to file",
          },
          ["toggle_ignore_case"] = {
            map = "ti",
            cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
            desc = "toggle ignore case",
          },
          ["toggle_ignore_hidden"] = {
            map = "th",
            cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
            desc = "toggle search hidden",
          },
          ["resume_last_search"] = {
            map = "<leader>l",
            cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
            desc = "repeat last search",
          },
          -- you can put your mapping here it only use normal mode
        },
      }
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function() require("nvim-ts-autotag").setup() end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  { "andweeb/presence.nvim" },
  { "metakirby5/codi.vim", cmd = "Codi", event = "VeryLazy" }, -- Nice to sandbox some tests (Like JSBin but local with live preview)
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function() require("todo-comments").setup() end,

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
    {
      "NvChad/nvim-colorizer.lua",
      event = "User AstroFile",
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function() require("nvim-surround").setup() end,
    },
    {
      "fedepujol/move.nvim",
      event = "BufRead",
    },
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
  },
}
