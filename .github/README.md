# My AstroNvim User Configuration for React, Typescipt || Javascript

![image](https://github.com/t1gu1/astrovim-config/assets/12479055/4ecf7714-2b1f-47ca-9e3f-5a34796a89aa)

## ⚡ Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (_Optional with manual intervention:_ See [Documentation on customizing icons](https://astronvim.com/Recipes/icons)) <sup>[[1]](#1)</sup>
  - Suggested: [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip)
- [Neovim 0.8+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using) <sup>[[2]](#2)</sup>
  - Suggested: [Kitty](https://sw.kovidgoyal.net/kitty/binary/)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>fw`) (Too much usefull to be optional)
- OPTIONAL Requirements:
  - [lazygit](https://github.com/jesseduffield/lazygit) - git ui toggle terminal (`<leader>tl` or `<leader>gg`)
  - [go DiskUsage()](https://github.com/dundee/gdu) - disk usage toggle terminal (`<leader>tu`)
  - [bottom](https://github.com/ClementTsang/bottom) - process viewer toggle terminal (`<leader>tt`)
  - [Python](https://www.python.org/) - python repl toggle terminal (`<leader>tp`)
  - [Node](https://nodejs.org/en/) - node repl toggle terminal (`<leader>tn`)

> <sup id="1">[1]</sup> All downloadable Nerd Fonts contain icons which are used by AstroNvim. Install the Nerd Font of your choice to your system and in your terminal emulator settings, set its font face to that Nerd Font. If you are using AstroNvim on a remote system via SSH, you do not need to install the font on the remote system.

> <sup id="2">[2]</sup> Note when using default theme: For MacOS, the default terminal does not have true color support. You will need to use [iTerm2](https://iterm2.com/), [Kitty](https://sw.kovidgoyal.net/kitty/), [WezTerm](https://wezfurlong.org/wezterm/), or another [terminal emulator](https://gist.github.com/XVilka/8346728#terminal-emulators) that has true color support.

## key mappings

### The basic

- AstroVim key mappings: <https://astronvim.com/Basic%20Usage/mappings> (Not listed in the things below)
- In the NeoTree press `?` to see all mapping
- In the editor simply hit `space/leader` and wait 1s to see almost all maping
- If you want to add Project, open the project window (Accessible through Dashboard too) and then do one of these shorcuts: <https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/project/projectmgr-nvim>

### Sourround
- If you want to Add, Change of delete surrounding, (<https://github.com/kylechui/nvim-surround>)
- In normal mode (WITHOUT `<leader>`), Add: `yss"` will surround a word with `"`, `ds"` will remove `"` and `cs"'` will replace `"` by `'`.
- - To detail more, `y` then `s` follow by the manip to go to the end of the for and the caracter to add for the sourround. Example: `yss(` -> sourround the line with `()`. `ysw"` sourround the word with `"`. `ys4j{` => sourround the four line with `{`

### Harpoon (Quick navigation between marked file)
- `harpoon` `<leader><leader>a` to mark a file. 
- Use numbers `1` **to** `4` to quick move between the 4 first marks.
  
### Project
- Simply `enter` on the Open project in the Dashboard. (Will be empty,  but you will be able to execute commands listed in the table below)
- `:ProjectMgr` (or <leader>p) toggles a telescope picker with your projects. The telescope preview displays information about your project and its current git state.

The following actions and keybinds are available for `:ProjectMgr` / In the `Open project` option in the Dashboard:

| Key               | Action                                                                                             |
| :---------------- | :------------------------------------------------------------------------------------------------- |
| `<CR>`            | Open the project under your cursor                                                                 |
| `<C-a>`           | Add a project. You will be asked for a name, a path, and optionally startup and shutdown commands. |
| `<C-d>` / `<C-x>` | Delete project under your cursor                                                                   |
| `<C-e>` / `<C-u>` | Edit the project under your cursor                                                                 |
| `<C-q>` / `<ESC>` | Close the window without doing anything                                                            |
| `<leader>P`       | Open the ProjectMgr panel                                                                          |

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Clone this repository

```shell
git clone https://github.com/t1gu1/astrovim-config ~/.config/nvim/lua/user
```

#### Symlink the snippets directory where it's read by the plugin

```shell
ln -s ~/.config/nvim/lua/user/snippets ~/.config/nvim/snippets
```

#### Start Neovim

```shell
nvim
```

##### After a first start

- At the first start everything should install. Then close nvim and reopen it.
- Then if you want to check if everything is ok use `:checkhealth` cmd inside nvim.
- P.S. Be sure to use a compatible terminal like kitty terminal and having a nerdFont installed.

### Customise Kitty terminal a little bit

Open Kitty terminal and open menu `kitty/preferences`.

Simply replace all your config by this:

```shell
## blurb:    Soothing pastel theme for the high-spirited!

font_size       19.0

# text
foreground           #CAD3F5
# base
background           #24273A
# subtext0
title_fg             #A5ADCB

# mantle
title_bg             #1E2030
margin_bg            #1E2030

# subtext1
margin_fg            #B8C0E0
# mantle
filler_bg            #1E2030

# 30% red, 70% base
removed_bg           #604456
# 50% red, 50% base
highlight_removed_bg #895768
# 40% red, 60% base
removed_margin_bg    #744D5F

# 30% green, 70% base
added_bg             #4B5D55
# 50% green, 50% base
highlight_added_bg   #658168
# 40% green, 60% base
added_margin_bg      #586F5E

# mantle
hunk_margin_bg       #1E2030
hunk_bg              #1E2030

# 40% yellow, 60% base
search_bg            #EED49F
# text
search_fg            #CAD3F5
# 30% sky, 70% base
select_bg            #445B6C
# text
select_fg            #CAD3F5
```
