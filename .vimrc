" filetype off
" call pathogen#runtime_append_all_bundles()
" filetype plugin indent on

" set not to be compatible with vi
set nocompatible

set modelines=0

"~~~~~~~~~~decorations~~~~~~~~~
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2  " always display the status line
set relativenumber
set undofile

"~~~~~~~~~~better search highlighting~~~~~~~~~~
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"~~~~~~~~~~set line width control~~~~~~~~~~~~
"set wrap
"set textwidth=79
"set formatoptions=qrn1
set colorcolumn=80

"~~~~~~~~~~disable arrow keys in normal mode ~~~~~~~
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" -----change the leader key to ,~~~~~
:let mapleader = ","

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" run pathogen plugin management
execute pathogen#infect()
syntax on
filetype plugin indent on
let python_highlight_all=1

" Languagetool configurations
:let g:languagetool_jar='/Volumes/Macintosh/LanguageTool-4.2/languagetool-commandline.jar'
:let g:languagetool_lang='en'

"powerline
set rtp+=/home/tongli/.local/lib/python3.6/site-package/powerline/bindings/vim/
set t_Co=256

"Abbrevations
:iabbrev adn and
:iabbrev ci \cite{} 
:iabbrev waht what
:iabbrev tehn then
:iabbrev kt kinetochore
:iabbrev kts kinetochores
:iabbrev ciph [@]

" vim-plug configuration
call plug#begin()

" markdown realted
Plug 'iamcco/markdown-preview.vim'
" Need these two thing to render math forlumar (uncomment if needed)
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" <Leader> based line commenter
Plug 'scrooloose/nerdcommenter'
call plug#end()

" Python
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
