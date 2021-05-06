" __  ____   __  _   ___	 _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @theniceboy

" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
"source $XDG_CONFIG_HOME/nvim/_machine_specific.vim
source ~/.config/nvim/_machine_specific.vim


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
set autochdir
"filetype on
"filetype indent on
filetype plugin on
 " filetype plugin indent on
 " set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
 " set termencoding=utf-8
set encoding=UTF-8

" ===
" === Editor behavior
" ===
"syntax on
set exrc
set secure
set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block
set re=0
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap <C-r> :source $MYVIMRC<CR>
" noremap R :PlugInstall<CR>
"noremap ; :

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
"noremap <LEADER>rv :e .nvimrc<CR>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"	   ^
"	   k
" <h   l >
"	   j
noremap <silent> \v v$h

" J/K keys for 5 times j/k (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" N key: go to the start of the line
noremap <silent> H 0
" I key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

source ~/.config/nvim/cursor.vim

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command Mode Cursor Movement
" ===
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>
"cnoremap <C-b> <Left>
"cnoremap <C-f> <Right>
"cnoremap <M-b> <S-Left>
"cnoremap <M-w> <S-Right>


" ===
" === Searching
" ===
noremap - N
noremap = n


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap qf <C-w>o

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res -5<CR>
noremap <down> :res +5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
" noremap <LEADER>q <C-w>j:q<CR>

"double click jj quit input model qickly
inoremap jj <Esc>

" ===
" === Tab management
" ===
" Create a new tab with tn
noremap tn :tabe<CR>
" Move around tabs with tj and tk
noremap tj :tabn<CR>
noremap tk :tabp<CR>
" Close tag
noremap tc :tabc<CR>
" Close other tag
noremap to :tabo<CR>

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
"autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:term<CR>
"noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +5<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
"noremap tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>

" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'markdown'
		exec "MarkdownPreviewToggle"
	endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus'
Plug 'ryanoasis/vim-devicons'
" theme for neovim
Plug 'joshdick/onedark.vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
" commender tool
Plug 'preservim/nerdcommenter'
" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'tpope/vim-fugitive'
"Plug 'kdheepak/lazygit.nvim'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }

" File navigation
Plug 'junegunn/fzf.vim'
" install fzf use git on ubuntu
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'airblade/vim-rooter'
" Plug 'RRethy/vim-illuminate'
Plug 'kevinhwang91/rnvimr'
" Taglist
Plug 'liuchengxu/vista.vim'
Plug 'Yggdroot/indentLine'

" Debugger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}

" Other filetypes
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'easymotion/vim-easymotion'

call plug#end()


" ===================== Start of Plugin Settings =====================

" ===
" === theme setting
" ===
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
	set termguicolors
  endif
endif
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
if (has("autocmd"))
  augroup colorextend
	autocmd!
	" Make `Function`s bold in GUI mode
	autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
	" Override the `Statement` foreground color in 256-color mode
	autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
	" Override the `Identifier` background color in GUI mode
	autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
	" Override the `Visual` background color in GUI mode
	let s:dark_yellow = { "gui": "#d19a66 ", "cterm": "145", "cterm16" : "7" }
	let s:black = { "gui": "#282c34", "cterm": "145", "cterm16" : "7" }
	autocmd ColorScheme * call onedark#extend_highlight("Visual", {"fg": s:black, "bg": s:dark_yellow} )
	let s:pop_grey = { "gui": "#000024", "cterm": "145", "cterm16" : "7" }
	autocmd ColorScheme * call onedark#extend_highlight("Pmenu", {"bg": s:pop_grey} )
  augroup END
endif
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
	autocmd!
	let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
	autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
" Global color overrides
" let g:onedark_color_overrides = {
" \ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
" \ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
" \}
colorscheme onedark
" semshi colors
hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#666699

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign

" ===
" === vim-scrollstatus for airline
" ===
set laststatus=2
let g:airline_section_x = '%{ScrollStatus()} '
let g:airline_section_y = airline#section#create_right(['filetype'])
let g:airline_section_z = airline#section#create([
			\ '%#__accent_bold#%3l%#__restore__#/%L', ' ',
			\ '%#__accent_bold#%3v%#__restore__#/%3{virtcol("$") - 1}',
			\ ])
let g:airline_powerline_fonts = 0
let g:airline_theme='onedark'	 " for one theme
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
"let g:airline_left_sep = '▶'
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '❮'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" ===
" === coc.nvim
" ===
	"\ 'coc-gitignore',
	"\ 'coc-git',
"let g:coc_global_extensions = [
	"\ 'coc-explorer',
	"\ 'coc-highlight',
	"\ 'coc-json',
	"\ 'coc-jedi',
	"\ 'coc-lists',
	"\ 'coc-marketplace',
	"\ 'coc-snippets',
	"\ 'coc-diagnostic',
	"\ 'coc-pairs',
	"\ 'coc-yank',
	"\ 'coc-vimlsp',]


" Use tab to completion code
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"		   default is not go to the new line ,so I do not use
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>H :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
	call CocActionAsync('doHover')
  else
	execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
"And set it's color
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHighlightText guibg=#666699 ctermbg=150
"hi CocHighlightText ctermfg=231 guifg=#ffffff ctermbg=60 guibg=#4b5269
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code. auto to when save
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
" coc-explorer
nnoremap <LEADER>T :CocCommand explorer<CR>
" coc-snippets
let g:snips_author = 'Tianming'
" set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
"let g:lightline = {
  "\ 'active': {
  "\   'left': [
  "\     [ 'mode', 'paste' ],
  "\     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  "\   ],
  "\   'right':[
  "\     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  "\     [ 'blame' ]
  "\   ],
  "\ },
  "\ 'component_function': {
  "\   'blame': 'LightlineGitBlame',
  "\ }
"\ }

"function! LightlineGitBlame() abort
  "let blame = get(b:, 'coc_git_blame', '')
  "" return blame
  "return winwidth(0) > 120 ? blame : ''
"endfunction
" language server
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }

" ===
" === tabular
" ===
vmap ga :Tabularize /
" ===
" === pydocstring
" ===
nmap <silent> <C-_> <Plug>(pydocstring)
let g:pydocstring_formatter = 'numpy'
" ===
" === vim-markdown-toc
" ===
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" ===
" === markdown-preview.nvim
" ===
"let g:mkdp_auto_start = 1
"let g:mkdp_open_to_the_world = 1
" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
let g:table_mode_cell_text_object_i_map = 'k<Bar>'
let g:table_mode_corner =  '|'
" ===
" === Bullets.vim
" ===
let g:bullets_checkbox_markers = '    X'



" ==
" == GitGutter
" ==
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>G :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
"nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
" noremap <silent> <C-l> :Lines<CR>
noremap <silent> <C-w> :Buffers<CR>
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


" ===
" === Leaderf
" ===
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
		\ 'dir': ['.git', 'vendor', 'node_modules'],
		\ 'file': ['__vim_project_root']
		\}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0

" ===
" === IndentLine
" ===

"nmap <leader>il :IndentLinesToggle<CR>
let g:indentLine_char = "┊"
let g:indentLine_first_char = "┊"
let g:indentLine_enabled = 1
" let g:indentLine_color_gui = '#A4E57E'
" let g:indentLine_color_term = 239

" ===
" === Rnvimr
" ===
nnoremap <c-p> :RnvimrToggle<CR>
let g:rnvimr_enable_picker = 1
"let g:rnvimr_enable_ex = 1
" Map Rnvimr action
"let g:rnvimr_action = {
            "\ '<C-t>': 'NvimEdit tabedit',
            "\ '<C-x>': 'NvimEdit split',
            "\ '<C-v>': 'NvimEdit vsplit',
            "\ 'gw': 'JumpNvimCwd',
            "\ 'yw': 'EmitRangerCwd'
            "\ }

" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:scrollstatus_size = 15

" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
map  <Leader>m <Plug>(easymotion-bd-f)
nmap <Leader>m <Plug>(easymotion-overwin-f)

" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad
"let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval



" ===================== End of Plugin Settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

