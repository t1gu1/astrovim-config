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
        button("LDR S f", "󰈙  Find Recent sessions"),
        button("LDR f p", "󰈙  Open Project  "),
        button("LDR n  ", "  New File   "),
        button("LDR f f", "  Find File  "),
        button("LDR f w", "󰈭  Find Word  "),
        button("LDR f '", "  Bookmarks  "),
      }
      return opts
    end,
  }, -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            :with_pair(cond.not_after_regex "%%")
            :with_pair( -- don't add a pair if the next character is % -- don't add a pair if  the previous character is xxx
              cond.not_before_regex("xxx", 3)
            )
            :with_move(cond.none())
            :with_del(cond.not_after_regex "xx")
            :with_cr(cond.none()), -- don't move right when repeat character -- don't delete if the next character is xx -- disable adding a newline when you press <cr>
        }, -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function() require("spectre").setup() end,
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
  { "metakirby5/codi.vim", cmd = "Codi" },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function() vim.g.mkdp_auto_start = 1 end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function() require("todo-comments").setup() end,
  },
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
    "nvim-telescope/telescope.nvim",
    dependencies = { -- add a new dependency to telescope that is our new plugin
      "nvim-telescope/telescope-media-files.nvim",
    },
    -- the first parameter is the plugin specification
    -- the second is the table of options as set up in Lazy with the `opts` key
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      local telescope = require "telescope"
      telescope.load_extension "media_files"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "User AstroFile",
  },
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require("mini.indentscope").setup()
      require("mini.move").setup()
      -- require("mini.surround").setup()
      -- sa to add sourroud (visual mode)
      -- sd to remove sourround (visual or normal mode)
      -- saiw to add sourround from normal mode
    end,
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
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
