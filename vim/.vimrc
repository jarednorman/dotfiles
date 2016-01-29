set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let mapleader = "\<space>"
let g:mapleader = "\<space>"

Plugin 'gmarik/Vundle.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'mattn/webapi-vim'
Plugin 'ervandew/supertab'
Plugin 'L9'
Plugin 'mattn/gist-vim'
Plugin 'sjl/splice.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'rking/ag.vim'
Plugin 'jarednorman/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'slim-template/vim-slim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'noprompt/vim-yardoc'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rking/vim-detailed'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on
syntax on

" gist-vim
let g:gist_post_private = 1

syntax enable
set t_Co=256
set background=dark
colo jaredized

set statusline=%f\ %y
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" vim-airline
let g:airline_theme = 'jardo'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

set shell=$SHELL

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { "mode": "passive" }

set noswapfile
set nobackup
set noerrorbells visualbell t_vb=

set expandtab
set softtabstop=2
set shiftwidth=2

set hlsearch
set ignorecase
set smartcase

set wrap
set cmdheight=1
set list listchars=tab:◀―,trail:•
set wildmode=list:longest,list:full
set splitright
set splitbelow
set fillchars+=vert:│
set ttyfast

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <cr> :
nnoremap K \<noop>
vnoremap K \<noop>
nnoremap <leader>/ :let @/=""<cr>
nnoremap <leader><cr> <cr>
nnoremap <leader><tab> :tabn<cr>
nnoremap <leader><s-tab> :tabp<cr>
nnoremap <leader><leader> :call FzyCommand("ag --nocolor -l --hidden --ignore /.git", ":e")<cr>

nnoremap <leader>c :SyntasticCheck<cr>
nnoremap <leader>fg :call FzyCommand("ag -g '' $(bundle show $(bundle list \| cut -f 4 -d' ' \| fzy))", ":e")<cr>
nnoremap <leader>fp :call FzyCommand("ag --nocolor -l --hidden --ignore /.git -g '' ~/Codes/$(ls ~/Codes \| fzy)", ":e")<cr>
nnoremap <leader>mk :!mkdir -p %:p:h<cr>
nnoremap <leader>t :!jf test %:.<cr><cr>
nnoremap <leader>r :!jf run %:.<cr><cr>
