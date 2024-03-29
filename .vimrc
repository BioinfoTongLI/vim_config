" filetype off

syntax on
filetype plugin indent on
filetype indent on

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
"set relativenumber
"set number
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
"execute pathogen#infect()

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
:iabbrev delta $\Delta$
:iabbrev citex \cite{}
:iabbrev figph ![ \label{fig-}](source/figures/placeholder.png){width=100%}
:iabbrev sidfigph \begin{sidewaysfigure}<CR><Tab>\begin{subfigure}{\textwidth}<CR><Tab><Tab>\centering<CR><Tab><Tab>\includegraphics{source/figures/screening/.png}<CR><Tab><Tab>\caption{DABEST estimation plot of }<CR><Tab>\end{subfigure}<CR><CR><Tab>\begin{subfigure}{\textwidth}<CR><Tab><Tab>\centering<CR><Tab><Tab>\includegraphics{source/figures/screening/.png}<CR><Tab><Tab>\caption{DABEST estimation plot of }<CR><Tab>\end{subfigure}<CR><Tab>\caption{}<CR>\end{sidewaysfigure}
:iabbrev figphdouble ![DABEST estimation plot of with TBZ](source/figures/tbz/.png){width=100%}<CR><CR>![DABEST estimation plot of with TBZ](source/figures/tbz/.png){width=100%}<CR><CR>\newpage<CR>
:iabbrev spombe _S.pombe_
:iabbrev ie _i.e._
:iabbrev eg _e.g._
:iabbrev etc _etc._

" vim-plug configuration
call plug#begin()

" markdown related
"Plug 'iamcco/markdown-preview.vim'
" Need these two thing to render math formula (uncomment if needed)
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.vim'
" Distraction-free mode
"Plug 'junegunn/goyo.vim'



Plug 'scrooloose/nerdtree'

" <Leader> based line commenter
Plug 'scrooloose/nerdcommenter'

" air-line decoration
Plug 'vim-airline/vim-airline'

" auto-completion
Plug 'valloric/youcompleteme'

" Python lint
"Plug 'nvie/vim-flake8'

" Grammar checking based on LanguageTool
"Plug 'rhysd/vim-grammarous'

" vim-template
Plug 'aperezdc/vim-template'

" Nextflow highlight
Plug 'LukeGoodsell/nextflow-vim'

" Linting for yaml (and other config files)
Plug 'editorconfig/editorconfig-vim'

" Git helper
Plug 'tpope/vim-fugitive'

"""" argmode-related""""""
" Quick calendar creation
"Plug 'mattn/calendar-vim'

" org mode for task management
"Plug 'jceb/vim-orgmode'

" org mode deps: to increase/decrease date rapidely
"Plug 'tpope/vim-speeddating'

call plug#end()

" Python-related
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
"autocmd BufWritePost *.py call flake8#Flake8()
" Force indentation styles for this directory
autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set expandtab

autocmd FileType nextflow set tabstop=4
autocmd FileType nextflow set shiftwidth=4
autocmd FileType nextflow set softtabstop=4
autocmd FileType nextflow set expandtab
" vim-template configuration
:let g:email='tongli.bioinfo@proton.me'
:let g:templates_use_licensee='0'
:let g:license='BSD-3'
:let g:username='Tong LI'

" Fuzzy file find
set path+=**

" autoremove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" EditConfig setting
let g:EditorConfig_indent_style='tab'
let g:EditorConfig_indent_size=4
let g:EditorConfig_trim_trailing_whitespace='true'
