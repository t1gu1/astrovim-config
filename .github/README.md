# !!! I switch to nvChad with my nice touch: [My NvChad config](https://github.com/t1gu1/nvchad/tree/main) !!!

So i'll stop to update that repo.

# The Real Catppuccin - AstroNvim User Configuration for React, Typescipt || Javascript

<img width="1296" alt="nvim dashboard" src="https://github.com/t1gu1/astrovim-config/assets/12479055/d1c4d79b-daac-48f6-ad31-1b8f95bf957b">

<img width="1728" alt="nvim code" src="https://github.com/t1gu1/astrovim-config/assets/12479055/e0b56443-e1ad-45a5-8767-069dcfb84567">

<img width="1728" alt="Oil" src="https://github.com/t1gu1/astrovim-config/assets/12479055/dedd0fd3-7846-412b-bcb8-a5e01c5afefb">

P.S. Bufferline/Heirline are now removed to get the fully `ThePrimeagen/harpoon` experience.
<img width="1728" alt="Nvim Herline" src="https://github.com/t1gu1/astrovim-config/assets/12479055/1a75a7c9-c17f-4820-9eb1-ffe668ef6e83">

<img width="1728" alt="Nvim Find file - Telescope" src="https://github.com/t1gu1/astrovim-config/assets/12479055/31a040ce-ad41-47b5-942e-6d89d3b4916c">


## Features / What I added or change from AstroVim

- dashboard ajusted to be and look really simple
- ~~neo-tree open to the right, so it don't move the code when open/close~~
- Use Oli.nvim file explorer (Edit file like a buffer & it's clean!)
- nvChad Telescope theme ajusted to fit with the cappuccin colors
- noice.nvim, to have the styled search and Commands Bar
- The `Esc` in the terminal will get you in view mode!
- I DISABLED nvim-notify, cause it was simply frustrating to have a useless notification hidding my code / wordspace
- project.nvim to manage projects
- move.nvim to be able to move block of code (Remove LSP K map to be able to shift + k to move block.) Works with arrows to.
- ThePrimeagen/harpoon cause it's blazingly fast
- I REMOVE completly the buffeline/Heirline to truly use ThePrimeagen/harpoon experience
- nvim-spectre for a nice search and replace
- Other plugins: rainbow-delimiter, git-blame, todo-comments
- I add and chage some keymap (There is a point explaining the keymaps from this config under). You can also check the `mapping` file

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
- ~~In the NeoTree press `?` to see all mapping~~
- In Oil, press `?` to see all mapping (Not that much cause it works like buffer)
  - `<leader>e` open current file directory (Do it again to go to parent directory)
  - `<leader>E` open root project (Be sure to have .git or something that project.nvim will be able to understand as project)
  - To move a file simply delete the file and paste it somewhere else. Then save in oil and it will tell you if you really want to move the file. (Really intuitive)
  - To edit a file name, simply edit it as a buffer then save in oil. Oil will ask if you really want to rename your file.
  - In Oil, press `b` to go to parent directory
- In the editor simply hit `space/leader` and wait 1s to see almost all maping
- If you want to add Project, open the project window (Accessible through Dashboard too) and then do one of these shorcuts: <https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/project/projectmgr-nvim>

### Terminal

- The `Esc` in the terminal will get you in view mode!
- `<Leader>t<Leader>` or `ctrl-t` will toogle terminal.

### Sourround

- If you want to Add, Change of delete surrounding, (<https://github.com/kylechui/nvim-surround>)
- In normal mode (WITHOUT `<leader>`), Add: `yss"` will surround a word with `"`, `ds"` will remove `"` and `cs"'` will replace `"` by `'`.
    - - To detail more, `y` then `s` follow by the manip to go to the end of the for and the caracter to add for the sourround. Example: `yss(` -> sourround the line with `()`. `ysw"` sourround the word with `"`. `ys4j{` => sourround the four line with `{`

### Harpoon (Quick navigation between marked file)

- `harpoon` `<leader><leader>a` to mark a file.
- Use `<leader>` follow by a number (`1` **to** `5`) to quick move between the 5 first marks.

P.S. I REMOVE completly the buffeline/Heirline to fully use `ThePrimeagen/harpoo` experience.

### Project

- Simply `enter` on the Open project in the Dashboard. (Will be empty, but you will be able to execute commands listed in the table below)
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

# Kitty tabs are now define by a number
tab_title_template "{index}"

# Remove window header of your OS (You may not want this line)
hide_window_decorations titlebar-only

# Make the terminal TRANSPARENT with some blur (Works nicely on Mac OS and maybe Linux)
background_opacity 0.8
background_blur 20

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
# 50% green, 50%
```
