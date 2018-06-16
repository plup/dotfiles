set nocompatible
set tabstop=4
set shiftwidth=4
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

autocmd BufNewFile,BufRead *.t2t set ft=txt2tags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

colorscheme slate

" key bindings
nnoremap <F2> :NERDTreeToggle<CR>
