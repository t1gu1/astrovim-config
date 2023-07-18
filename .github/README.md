# AstroNvim User Configuration

Go to [AstroNvim](https://github.com/AstroNvim/AstroNvim) to create easily a user configuration template if you don't like this one.

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

- AstroVim key mappings: <https://astronvim.com/Basic%20Usage/mappings>
- Added plugins mapping (soon.)

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
