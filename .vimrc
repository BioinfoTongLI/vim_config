" filetype off
" call pathogen#runtime_append_all_bundles()

" required by LanguageTool
syntax on
filetype plugin indent on

" set not to be compatible with vi
set nocompatible

set t_Co=256
set modelines=0

"~~~~~~~~~~decorations~~~~~~~~~
set encoding=utf-8
set scrolloff=3
"set autoindent
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
set number
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

" Enable folding
set foldmethod=indent
set foldlevel=99

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
let python_highlight_all=1

" Grammarous configurations
set nospell
let g:grammarous#disabled_rules = {
			\ '*' : ['WORD_CONTAINS_UNDERSCORE,EN_QUOTES,DASH_RULE'],
			\}
set spellfile=~/.vim/spell/en.utf-8.add
set spelllang=en_us
let g:grammarous#enable_spell_check=1
let g:grammarous#use_vim_spelllang=1
let g:grammarous#show_first_error=1

let g:grammarous#default_comments_only_filetypes = {
	    \ '*' : 1, 'python' : 0, 'markdown' : 0,
	    \ }

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
    nmap <buffer><C-r> <Plug>(grammarous-reset)
    nmap <buffer><C-f> <Plug>(grammarous-fixit)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
    nunmap <buffer><C-r>
    nunmap <buffer><C-f>
endfunction

"Abbrevations
" for typos
:iabbrev adn and
:iabbrev waht what
:iabbrev tehn then
" for writing
:iabbrev phd _Ph.D_ 
:iabbrev kt kinetochore
:iabbrev kts kinetochores
:iabbrev mu $\mu$
:iabbrev alpha $\alpha$
:iabbrev beta $\beta$
:iabbrev gamma $\gamma$
:iabbrev citex \cite{}
:iabbrev ciph [@]
:iabbrev figph ![ \label{fig_}](source/figures/placeholder.png){width=50%}
:iabbrev spombe _S.pombe_ 
:iabbrev ie _i.e._ 
:iabbrev eg _e.g._ 
:iabbrev etc _etc._ 

" vim-plug configuration
call plug#begin()

" markdown related
Plug 'iamcco/markdown-preview.vim'
" Need these two thing to render math formula (uncomment if needed)
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" <Leader> based line commenter
Plug 'scrooloose/nerdcommenter'

" air-line decoration
Plug 'vim-airline/vim-airline'

" auto-completion
Plug 'valloric/youcompleteme'

" Python lint
Plug 'nvie/vim-flake8'

" Grammar checking based on LanguageTool
Plug 'rhysd/vim-grammarous'

call plug#end()

" Python-related
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
autocmd BufWritePost *.py call flake8#Flake8()
" Force indentation styles for this directory
autocmd FileType python set shiftwidth=2
autocmd FileType python set tabstop=2
autocmd FileType python set softtabstop=2

" vim-template configuration
:let g:email='tongli.bioinfo@gmail.com'
:let g:templates_use_licensee='1'
:let g:license='BSD-3'
:let g:username='Tong LI'

" Fuzzy file find
set path+=**
