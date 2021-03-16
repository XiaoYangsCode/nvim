# How to install
- git clone to `~/.config/`

- install `Neovim 0.4.3` from Github (correspond to `kdheepak/lazygit.nvim` for 0.4.3 nvim)

  extract `nvim-linux64.tar.gz` from Github and then add to env `.zshrc`
  ```bash
  export PATH="/usr/local/Cellar/nvim/bin:$PATH"
  ```
- change python path in `_machine_specific.vim`
- use `checkhealth` to find some package have not been install
- use `vim-plug` to install nvim plug
- upgrade nodejs for ubuntu (low version on ubuntu 18.04)
- install `coc.nvim`

  common command:
  ```bash
  CocInstall coc-marketplace
  CocList marketplace
  CocList extensions
  ```
- ripgrep for ubuntu18.04 should install from github release
	```bash
	curl -LO  https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
	sudo dpkg -i ripgrep_12.1.1_amd64.deb
	```
- set default conda env
  ```bash
  conda activate ml385
  #conda config --set auto_activate_base false # set not auto start
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





# file navigation
## keymap
| hotkey  | action                                 |
|---------|----------------------------------------|
| `<C-p>` | open ranger                            |
| `<C-t>` | open file as tab from ranger           |
| `<C-x>` | open file horizontal split from ranger |
| `<C-v>` | open file vertical split from ranger   |
## plugins

- kevinhwang91/rnvimr



# Markdown
## Snippets

| hotkey  | action     |
|---------|------------|
| `,`+`a` | web link   |
| `,`+`b` | bold       |
| `,`+`c` | code block |
| `,`+`d` | `` <++>    |
## Plugins


