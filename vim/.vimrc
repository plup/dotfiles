"--- PLUGINS ---

"Plugin manager
"Install: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
":PlugInstall to install the plugins, :PlugUpdate to update them, :PlugClean to remove unused plugins, :PlugUpgrade to update vim-plug itself. 

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree',  { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'shawncplus/phpcomplete.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ledger/vim-ledger'

call plug#end()

"--- GENERAL SETTINGS ---

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

autocmd BufNewFile,BufRead *.t2t set ft=txt2tags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

colorscheme mustang

" key bindings
nnoremap <F2> :NERDTreeToggle<CR>
