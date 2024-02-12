" fix cursor error in Iterm2&macOS
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" use system clipboard
set clipboard=unnamed

" leader key
let mapleader=";"

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Setting Vundle and Plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'bkad/CamelCaseMotion'
map <leader>w <Plug>CamelCaseMotion_w
map <leader>b <Plug>CamelCaseMotion_b
map <leader>e <Plug>CamelCaseMotion_e
map <leader>ge <Plug>CamelCaseMotion_ge
omap <leader>iw <Plug>CamelCaseMotion_iw
xmap <leader>iw <Plug>CamelCaseMotion_iw
omap <leader>ib <Plug>CamelCaseMotion_ib
xmap <leader>ib <Plug>CamelCaseMotion_ib
omap <leader>ie <Plug>CamelCaseMotion_ie
xmap <leader>ie <Plug>CamelCaseMotion_ie

Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/nerdtree'
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
Plugin 'Lokaltog/vim-easymotion'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall
" (optional) For those using the fish shell: add set shell=/bin/bash to your .vimrc
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Turn on syntax highlighting
syntax on

" movition
nmap H ^
nmap L $

" Search down into subfolders
" provides tab completion for all file related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Security
set modelines=0
set exrc
set secure

" Show line numbers
set number
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=99
set formatoptions=tcqrn1
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set smartindent
set noshiftround
" set colorcolumn=100
" highlight ColorColumn ctermbg=darkgray

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Window splitting directions
set splitbelow
set splitright

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Uncomment this to enable by default:
set list " To enable by default

" This will enable
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
command! MakeTags !ctags -R .

" Autocompletion is already enabled with ctags
" - ^x^n for JUST this file
" - ^x^f for filenames (works with out path trick!)
" - ^x^] for tags only
" - ^n for anythign specified by the 'complete' option
" - Use ^n and ^p to go back and forth in the suggestion list
"
" Overview: In insert mode you can...
"
" ^r = insert text from a register
" ^a = insert text from register '.'
" ^p = completion menu
" ^x = special "completion mode" submode of insert
" --^] = tag
" --^p = pull from previous context
" --^n = pull from next context
" --^f = file completion
" --^l = line
" --^o = omnicompletion
"
" How to change where to complete from:
set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u,t,i,kspell

" Cursor motion
set scrolloff=10
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Insert newline without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search
nnoremap <F3> :set hlsearch!<CR>

" Code folding
set foldmethod=indent
set foldlevel=99
nnoremap <C-space> za

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip

" Remap ^] to ^ä
map <C-ä> <C-]>

" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" clean trailing whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%Y-%m-%d\ %H:%M:%S\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

" Color scheme (terminal)
set t_Co=256
set background=dark
set termguicolors
colorscheme pencil

"GUI settings"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    if exists('g:AutoDarkLoaded') || &cp
      finish
    end
    let g:AutoDarkLoaded = 1

    if !exists('##OSAppearanceChanged') && has("gui_running")
      echomsg "AutoDark requires MacVim Snapshot 160 or later."
      finish
    end
    " auto change color theme with system
    func! s:ChangeBackground()
      if (v:os_appearance)
        set background=dark
      else
        set background=light
      endif
      redraw!
    endfunc

    augroup AutoDark
      autocmd OSAppearanceChanged * call s:ChangeBackground()
    augroup END
endif

