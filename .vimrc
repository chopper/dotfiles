set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

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
Plugin 'morhetz/gruvbox'
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
Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Select color scheme
colorscheme gruvbox
set background=dark

" Turn on syntax highlighting
syntax on

" Misc settings
set nocompatible
set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=200
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
set undolevels=1000      " use many levels of undo
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set cpoptions+=$        " puts a $ marker for the end of words/lines in cw/c$ commands
set colorcolumn=80
set statusline=%=%P\ %f\ %m " status line format
set fillchars=vert:\ ,stl:\ ,stlnc:\  " no fill chars for vertical split and status line
set laststatus=2        " always show last status
set noshowmode          " don't show '-- INSERT --' in status line

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

" Quick ESC
imap ;; <ESC>

"Start an external command with a single bang
nnoremap ! :!

" Command to remove extra spaces at end of lines
command! Rmspaces :%s/\s\+$//

" Clear highlighted search results through ,/
nnoremap <silent> ,/ :nohlsearch<CR>

" Tab between open buffers
nnoremap <Tab> :bnext<CR>:redraw<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>

" Toggle absolute/relative line numbers with Ctrl+n
nnoremap <silent> <C-n> :set relativenumber!<cr>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Shortcut to edit .vimrc
nmap <leader>e :e! ~/.vimrc<cr> " edit ~/.vimrc

" Shortcut to reload .vimrc
nmap <leader>r :so ~/.vimrc<cr> " reload ~/.vimrc

" Highlight any characters beyond column 80
:au BufWinEnter * let w:m2=matchadd('TooManyChars', '\%>80v.\+', -1)

" Enable mixed filetypes
autocmd BufRead,BufNewFile *.handlebars,*.hbs set filetype=html syntax=handlebars
autocmd BufRead,BufNewFile *.hbs.erb set filetype=eruby.html syntax=handlebars
autocmd BufRead,BufNewFile *.coffee.erb set filetype=eruby.coffee syntax=coffee
" autocmd BufRead,BufNewFile,BufEnter * syntax on " commented out, breaks custom higlights

" Open netrw at startup if no argument was specified ($ vim):
autocmd VimEnter * if !argc() | Explore | endif

" Open netrw at starup when the specified argument is a directory ($ vim /tmp):
autocmd VimEnter * if isdirectory(expand('<afile>')) | Explore | endif

" Configure netrw
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1
let g:netrw_sort_options = 'i'

" Configure gitgutter
let g:gitgutter_max_signs = 2048

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 2000
let g:ctrlp_max_depth = 15
let g:ctrlp_custom_ignore = {
    \ 'dir':  '(\.git|bower_components|node_modules|tmp|dist|generated_js)$',
    \ 'file': '\.(swp|git)$',
    \ 'link': '',
    \ }

" Ignore the following file types / folders
set wildignore+=*/tmp/*
set wildignore+=*/bower_components/*
set wildignore+=*/node_modules/*
set wildignore+=*/dist/*
set wildignore+=*.so
set wildignore+=*.swp
set wildignore+=*.zip
set wildignore+=*/generated_js/*

" General colors
hi VertSplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi EndOfBuffer ctermfg=237 ctermbg=235
hi CursorLine ctermbg=236

" Colors for gitgutter
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=green
hi GitGutterChange ctermbg=235 ctermfg=yellow
hi GitGutterDelete ctermbg=235 ctermfg=red
hi GitGutterChangeDelete ctermbg=235 ctermfg=yellow

" Don't show color column
hi clear ColorColumn

" Color for characters beyond column 80
hi TooManyChars ctermbg=238

" Colors for status line
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=235
