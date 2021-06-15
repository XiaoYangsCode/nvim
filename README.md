# How to install
- git clone to `~/.config/`

- install `Neovim 0.4.3` from Github (correspond to `kdheepak/lazygit.nvim` for 0.4.3 nvim)

  extract `nvim-linux64.tar.gz` from Github and then add to env `.zshrc`
  ```bash
  export PATH="/usr/local/Cellar/nvim/bin:$PATH"
  ```
- change python path in `_machine_specific.vim`
- use `checkhealth` to find some package have not been install
- upgrade nodejs for ubuntu (low version on ubuntu 18.04)
- use `vim-plug` to install nvim plug
- install `coc.nvim`

  common command:
  ```bash
  CocInstall coc-marketplace
  CocList marketplace
  CocList extensions
  ```

## Requirements
| package              | des                                         |
|----------------------|---------------------------------------------|
| nodejs>10.12         | for coc.nvim (more detailed info on github) |
| lazygit              | more detail info on github                  |
| fzf                  | more detail info on github                  |
| ripgrep              | for fzf rg (more detail info on github)     |
| jedi-language-server | for python (more detail info on github)     |
| bash-language-server | for bash (more detail info on github)       |





# File navigation
## Keymap

| hotkey      | action                                         |
|-------------|------------------------------------------------|
| `<C-p>`     | open **ranger**                                |
| `<C-t>`     | open file as tab from **ranger**               |
| `<C-x>`     | open file horizontal split from **ranger**     |
| `<C-v>`     | open file vertical split from **ranger**       |
| `<C-f>`     | find keyword in all file by **fzf**            |
| `<C-h>`     | find file history by **fzf**                   |
| `<C-w>`     | find buffers by **fzf** (open by enter)        |
| `<C-d>`     | find buffers by **fzf** (delete by enter)      |
| `<leader>;` | find commond history by **fzf**                |
| `<leader>f` | find file by **leaderF**                       |
| `<C-t>`     | find symbols in file by **vista**              |
| `<leader>v` | open right column to show symbols by **vista** |

## Plugins

- kevinhwang91/rnvimr
- junegunn/fzf.vim
- Yggdroot/LeaderF
- liuchengxu/vista.vim
- airblade/vim-rooter

# Markdown
## Snippets

| hotkey  | action               |
|---------|----------------------|
| `,`+`a` | web link             |
| `,`+`b` | bold                 |
| `,`+`c` | code block           |
| `,`+`d` | ` ` <++>             |
| `,`+`l` | line                 |
| `\`+`m` | inline math formula  |
| `\`+`M` | math formula block   |
| `\`+`s` | `\sum_{}^{<++>}<++>` |
| `\`+`f` | `\frac{}{<++>}<++>`  |


# Python

## HotKey

| hotkey    | action     |
|-----------|------------|
| `ctl`+`_` | python doc |


# Git

## HotKey

| hotkey       | action              |
|--------------|---------------------|
| `<LEADER>gf` | check all changes   |
| `<LEADER>G`  | check preview state |
| `<LEADER>g-` | pre hunk            |
| `<LEADER>g=` | next hunk           |
| `ghs`        | stage hunk          |
| `ghu`        | undohunk            |
