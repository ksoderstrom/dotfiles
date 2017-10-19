set encoding=utf-8

" Lightline
let g:lightline = {
  \ 'colorscheme': 'neodark',
  \ }

" Plugins
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'itchyny/lightline.vim'
Plug 'eugen0329/vim-esearch'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'roxma/vim-tmux-clipboard'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'tpope/vim-rhubarb'
call plug#end()

syntax on                         " show syntax highlighting
filetype plugin indent on
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
" set relativenumber                " show relative line numbers
set number			  " show line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set noshowmode                    " don't show -- INSERT --
set signcolumn=yes                " always show sign column (lint, gitgutter, etc)

set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full

set backspace=indent,eol,start    " allow backspace to erase previously entered characters, autoindent, and newlines
set mouse-=a                      " disable mouse input

" put git status, column/row number, total lines, and percentage in status
" set statusline=%F
" set statusline+=%#todo#  "switch to todo highlight
" set statusline+=%m       "modified flag
" set statusline+=%*       "switch back to normal statusline highlight
" set statusline+=%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" set dark background and color scheme
"set background=dark
"colorscheme base16-railscasts
let g:neodark#terminal_transparent = 1
let g:neodark#use_custom_terminal_theme = 1 " default: 0
colorscheme neodark

" infinite undo
set undofile
set undodir=~/.vim/undodir

" backups
set backup                    " keep a backup file
set backupdir=~/.vim/_backups " store backups here
set directory=~/.vim/_swaps   " store swap files here

" set leader key to comma
let mapleader = ","

" nnoremap <C-p> :FuzzyOpen<CR>

" allow ctrl-s to be used to save
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

" hint to keep lines short
" if exists('+colorcolumn')
"   set colorcolumn=80
" endif

" fzf
nmap ; :Buffers<CR>
nnoremap <C-p> :Files<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

