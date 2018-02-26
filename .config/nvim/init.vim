set tabstop=2
set shiftwidth=2
set expandtab

set mouse=a
set number relativenumber
set ruler
set showmatch
set noerrorbells

set hlsearch
set incsearch
set ignorecase
set smartcase

set wrap
set backupcopy=yes

set swapfile
set dir=~/.config/nvim/.nvim-tmp

syntax on
syntax enable

let g:typescript_indent_disable = 1

set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'ciaranm/detectindent'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'walm/jshint.vim'
Plug 'groenewege/vim-less'
"Plug 'Valloric/YouCompleteMe'
Plug 'rust-lang/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'digitaltoad/vim-jade'
Plug 'godlygeek/tabular'
Plug 'ap/vim-css-color'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/nvim-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'
Plug 'sebastianmarkow/deoplete-rust'

call plug#end()

set autoindent
filetype plugin indent on    " required

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2
au BufReadPost * :DetectIndent

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_rust_src_path = '/home/arnaud/Dev/rust/src'

let g:airline_powerline_fonts = 1
let g:airline_theme = "dark"

if &term =~ '^screen' && exists('$TMUX')
  set mouse+=a
  "tmux knows the extended mouse mode
  set ttymouse=xterm2
  " tmux will send xterm-style keys when xterm-keys is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  execute "set <xHome>=\e[1;*H"
  execute "set <xEnd>=\e[1;*F"
  execute "set <Insert>=\e[2;*~"
  execute "set <Delete>=\e[3;*~"
  execute "set <PageUp>=\e[5;*~"
  execute "set <PageDown>=\e[6;*~"
  execute "set <xF1>=\e[1;*P"
  execute "set <xF2>=\e[1;*Q"
  execute "set <xF3>=\e[1;*R"
  execute "set <xF4>=\e[1;*S"
  execute "set <F5>=\e[15;*~"
  execute "set <F6>=\e[17;*~"
  execute "set <F7>=\e[18;*~"
  execute "set <F8>=\e[19;*~"
  execute "set <F9>=\e[20;*~"
  execute "set <F10>=\e[21;*~"
  execute "set <F11>=\e[23;*~"
  execute "set <F12>=\e[24;*~"
endif

let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
endif

source ~/.config/nvim/init.bepo.vim

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

autocmd FileType rust setlocal tabstop=2 shiftwidth=2

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"deoplete
let g:deoplete#sources#rust#racer_binary='/home/arnaud/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/arnaud/Dev/rust/src'
