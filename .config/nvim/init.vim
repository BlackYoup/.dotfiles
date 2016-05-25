set tabstop=2
set shiftwidth=2
set expandtab

set mouse=a
set number
set ruler
set showmatch
set noerrorbells
set esckeys

set hlsearch
set incsearch
set ignorecase
set smartcase

set wrap

set swapfile
set dir=~/.config/nvim/.nvim-tmp

syntax on
syntax enable

set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/syntastic'
Plug 'ciaranm/detectindent'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'walm/jshint.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'vim-scripts/JavaScript-Indent'
Plug 'groenewege/vim-less'
Plug 'wincent/command-t'
Plug 'shime/vim-livedown'
Plug 'majutsushi/tagbar'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'kchmck/vim-coffee-script'
Plug 'rking/ag.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'rust-lang/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'digitaltoad/vim-jade'
Plug 'godlygeek/tabular'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-obsession'
Plug 'junegunn/vim-peekaboo'

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

" html auto close
au FileType xhtml,xml so ~/.vim/scripts/html_autoclosetag.vim

" CommandT
set wildignore+=**/.git/*,**/node_modules/*,**/bower_components/*

map gm :call LivedownPreview()<CR>

set rtp+=/home/arnaud/.local/lib/python3.4/site-packages/powerline/bindings/vim/

" vim-airline
set laststatus=2
"let g:airline_powerline_fonts = 1
set t_Co=256

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_seed_identifiers_with_syntax = 1

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

"let g:EclimCompletionMethod = 'omnifunc'
source ~/.config/nvim/init.bepo.vim

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
