set nocompatible
set tabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set encoding=utf-8  	" The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

syntax on

" Display non printable caracters
set list
set listchars=nbsp:␣,tab:▸-,extends:»,precedes:«,trail:•	

" Disable backup files
set nobackup
set nowritebackup

" Set colors
colorscheme slate

" Key bindings
nnoremap <F2> :NERDTreeToggle<CR>

" Disable tab expansion for Makefile
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
