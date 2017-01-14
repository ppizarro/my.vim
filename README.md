#Introduction

My vimrc configuration, plugins and some other vim useful stuff (mainly taken from [Practical Vim: Edit Text at the Speed of Thought](http://pragprog.com/book/dnvim/practical-vim)).

#Installation

Put your init file into folder $XDG_CONFIG_HOME/nvim/init.vim
```
mv ~/Downloads/generate.vim $XDG_CONFIG_HOME/nvim/init.vim
```

Install neovim/python-client

```
pip2 install --upgrade neovim
pip3 install --upgrade neovim
```

Install latest gocode

```
go get -u github.com/nsf/gocode
```

Execute ViM and it will install plugins automatically
```
vim +NeoBundleInstall +GoInstallBinaries +qall
```

#Basic Usage

- Press `,b`  to build
- Press `,t`  to test
- Press `,tf` to test function on the cursor
- Press `,c`  to coverage
- Press `,r`  to run
- Press `,e`  to rename

- Press `,i`  to see info
- Press `,d`  to see go doc
- Press `,l`  to run metalinter
- Press `,v`  to definitions vertical
- Press `,s`  to definitions split

- Press `F3`  to open nerd tree
- Press `F4`  to outliner viewer

- Press `c-p` to find files
