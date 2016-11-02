set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" My Plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-vinegar'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'slim-template/vim-slim'
Plugin 'repmo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'chrisbra/NrrwRgn'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'stephpy/vim-yaml'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme Tomorrow-Night

syntax on

set nocompatible
set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
set noerrorbells         " don't beep
set visualbell           " don't beep
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands
set colorcolumn=80

" Colors for gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" Makefiles need tabs
autocmd FileType make setlocal noexpandtab

" Disable arrow keys in insert mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Switch windows with two keystrokes
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Enter command mode with one keystroke
" nnoremap ; :
" nnoremap : ;

" Quick ESC
imap ;; <ESC>

"Start an external command with a single bang
nnoremap ! :!

" Command to remove extra spaces at end of lines
command Rmspaces :%s/\s\+$//

" Clear highlighted search results through ,/
nnoremap <silent> ,/ :nohlsearch<CR>

" Tab between open buffers
nnoremap <Tab> :bnext<CR>:redraw<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>

" Enable mixed filetypes
autocmd BufRead,BufNewFile *.handlebars,*.hbs set filetype=html syntax=handlebars
autocmd BufRead,BufNewFile *.hbs.erb set filetype=eruby.html syntax=handlebars
autocmd BufRead,BufNewFile *.coffee.erb set filetype=eruby.coffee syntax=coffee
autocmd BufRead,BufNewFile,BufEnter * syntax on

" show relative line numbers when vim is in focus and absolute ones when not
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" show absolute line numbers in insert mode and relative ones in command mode
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" toggle relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Configure netrw
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1 " or 3
let g:netrw_sort_options = 'i'

" Configure gitgutter
let g:gitgutter_max_signs = 2048

" Open netrw at startup if no argument was specified ($ vim):
autocmd VimEnter * if !argc() | Explore | endif

" Open netrw only when the specified argument is a directory ($ vim /tmp):
autocmd VimEnter * if isdirectory(expand('<afile>')) | Explore | endif

set wildignore+=*/tmp/*,*/bower_components/*,*/node_modules/*,*/dist/*,*.so,*.swp,*.zip,*/generated_js/*

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 2000
let g:ctrlp_max_depth = 15

" Tab between buffers
noremap <tab> <c-w><c-w>

" Shortcut to edit .vimr
nmap <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc
