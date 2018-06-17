# Dotfiles

Installation:
~~~
$ git clone https://github.com/plup/dotfiles.git ~/.dotfiles
$ cd !$ && stow bash
~~~

Add `vim` plugins:
~~~
$ cd .dotfiles
$ git submodule add https://github.com/vim-airline/vim-airline.git vim/.vim/pack/my-plugins/start/vim-airline
$ git commit
~~~

Update `vim` plugins:
~~~
$ cd .dotfiles
$ git submodule update --remote --merge
$ git commit
~~~
