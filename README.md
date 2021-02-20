# Dotfiles

Installation:
```
$ git clone https://github.com/plup/dotfiles.git ~/.plup
$ cd !$ && stow bash
```

Add `vim` plugins:
```
$ cd .dotfiles
$ git submodule add https://github.com/diepm/vim-rest-console.git vim/.vim/pack/my-plugins/start/vim-rest-console
$ git commit
```

Update `vim` plugins:
```
$ cd .dotfiles
$ git submodule update --remote --merge
$ git commit
```
