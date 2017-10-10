if &compatible
  set nocompatible
endif

set runtimepath+=~/.config/nvim/bundle/neobundle.vim

call neobundle#begin(expand('~/.config/nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/dein.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'Shougo/vimproc.vim', {'build' : {'unix': 'make'}}
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'justmao945/vim-clang'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'cohama/lexima.vim'
NeoBundle 'tweekmonster/django-plus.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'itchyny/lightline.vim'
" Coloschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'MaxSt/FlatColor'
NeoBundle 'Drogglbecher/vim-moonscape'
NeoBundle 'fxn/vim-monochrome'

call neobundle#end()

filetype plugin indent on
syntax enable
set scrolloff=4
set number
set nowrap
set hidden
set showcmd
set mps+=<:>
set showmatch
set langmenu=en_US.utf-8
set encoding=utf-8
set laststatus=2
set noruler
set list
set listchars=tab:>-,trail:-
set backspace=indent,eol,start
set noswapfile
set browsedir=current
set clipboard=unnamed
set clipboard+=unnamedplus
set history=128
set undolevels=2048
set whichwrap=<,>,[,]
set cursorline

"set ignorecase
set smartcase
set nohlsearch
set incsearch

set tabstop=4
set shiftwidth=4
set noexpandtab
set gcr=a:blinkon0
set completeopt=menu,longest
set t_Co=256
hi Normal ctermbg=none

" enable mouse
set mouse=a

set background=dark
set guicursor=
colorscheme flatcolor

autocmd Filetype sh,bash,zsh setlocal expandtab ts=2 sw=2

let g:indentLine_char = '│'
let g:indentLine_color_term = 7

" VimShell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" NERDTree
let g:NERDTreeIgnore = ['\.pyc$', '\.o$', '__pycache__', '\~$']
let g:NERDTreeWinPos = "right"
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeMouseMode = 3

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1

" Lightline
let g:lightline = { 'colorscheme': 'flatcolor' }

" Vim-clang
let g:clang_cpp_completeopt = 'menu,longest'
let g:clang_diagsopt=''

" Jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 1
let g:jedi#show_call_signatures = 2

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

inoremap ;; <ESC>

map <F1> :NERDTreeToggle<cr>
map <F2> :VimShell<cr>
map <F3> :bd<cr>
imap <F3> :bd<cr>
map <C-g> :CtrlPBuffer<cr>

map <F6> :bn<cr>
imap <F6> :bn<cr>
map <F7> :bp<cr>
imap <F7> :bp<cr>

" Clone current line
imap <C-d> <esc>yypi
