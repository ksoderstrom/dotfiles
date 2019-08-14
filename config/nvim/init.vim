set encoding=utf-8


" Plugins
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" :CocInstall coc-ultisnips coc-html coc-json coc-css coc-eslint

Plug 'SirVer/ultisnips'
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags'
Plug 'morhetz/gruvbox'
Plug 'wellle/targets.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'janko-m/vim-test'
call plug#end()

syntax on                         " show syntax highlighting
filetype plugin indent on
set autoindent                    " set auto indent
set autoread                      " Don't bother me hen a file changes
set autowrite                     " Write on :next/:prev/^Z
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set norelativenumber              " don't show relative line numbers
set number                        " show line numbers
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
" set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=5                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set noshowmode                    " don't show -- INSERT --
set signcolumn=yes                " always show sign column (lint, gitgutter, etc)
set infercase                     " Completion recognizes capitalization
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set regexpengine=1
set termguicolors                 " use true colors
set updatetime=100

set backspace=indent,eol,start    " allow backspace to erase previously entered characters, autoindent, and newlines
set mouse-=a                      " disable mouse input

set background=dark

" gruvbox theme
let g:gruvbox_italic = 1
colorscheme gruvbox

" infinite undo
set undofile
set undodir=~/.vim/undodir

" backups
set nobackup                  " keep no backup file
set nowritebackup             " No backups made while editing
set directory=~/.vim/_swaps   " store swap files here

" set leader key to comma
let mapleader = ","

" macros
nmap <Leader>e :NERDTreeToggle<CR>
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

" vim-test
nmap <Leader>q :TestNearest<CR>
nmap <Leader>l :TestFile<CR>
nmap <Leader>a :TestSuite<CR>

" having Ex mode start or showing me the command history
" is a complete pain in the ass if i mistype
map Q  <silent>
map q: <silent>

" allow ctrl-s to be used to save
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" ctrl-h to hide highlight
nmap <c-h> :noh<CR>

" use t to jump to tag
noremap <Leader>j <c-]>

let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'qflist',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}
call esearch#map('<c-k>', 'esearch-word-under-cursor')
call esearch#map('<leader>s', 'esearch')
" autocmd VimEnter * nunmap <Leader>ff

" fzf
nmap <Leader>b :Buffers<CR>
" nnoremap <C-p> :Files<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>f :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Gitgutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'
"
" ale
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['ruby'] = ['rubocop']
let g:ale_javascript_prettier_use_local_config = 1
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
"
" Lightline
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left': [['mode', 'paste'], ['gitbranch', 'filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head',
\   'filename': 'LightLineFilename'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

function! LightLineFilename()
  return expand('%')
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

