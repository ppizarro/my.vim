#Introduction

My vimrc configuration, plugins and some other vim useful stuff (mainly taken from [Practical Vim: Edit Text at the Speed of Thought](http://pragprog.com/book/dnvim/practical-vim)).

#Installation

Put your init file into folder $XDG_CONFIG_HOME/nvim/init.vim
```
mv ~/Downloads/generate.vim $XDG_CONFIG_HOME/nvim/init.vim
```

Install neovim and python-client

```
sudo pacman -S neovim python2-neovim python-neovim
```

Install latest gocode

```
go get -u github.com/nsf/gocode
```

Install CTags

sudo pacman -S extra/ctags


Execute ViM and it will install plugins automatically
```
vim +NeoBundleInstall +GoInstallBinaries +UpdateRemotePlugins +qall
```

#Basic Usage

- Press `,b`  to build
- Press `,t`  to test
- Press `,tf` to test function on the cursor
- Press `,c`  to coverage
- Press `,r`  to run
- Press `,e`  to rename

- Press `,i`  to see info
- Press `,d` or 'K'  to see go doc
- Press `,l`  to run metalinter
- Press `,v`  to definitions vertical
- Press `,s`  to definitions split

- Press `F3`  to open nerd tree
- Press `F4`  to outliner viewer

- Press `c-p` to find files
- Press `c-g` to jump between declarations

#To select the content of a function enclosure:
- if - inner function
- af - a function

#Struct split and join
- gS - split the struct expression into multiple lines
- gJ - join field definitions (If your cursor is on the variable)

#Snippets
- errp -> panic()
- fn -> fmt.Println()
- ff -> fmt.Printf()
- ln -> log.Println()
- lf -> log.Printf()
- json -> json tag to the struct field

#Navigate it
- :GoDef - Go to definition
- gd or c-] - Go to definition
- :GoDefPop - to jump to the previous location
- c-t - to jump back to the previous location
- c-o - to jump to the previous cursor location
- ]] -> jump to next function
- [[ -> jump to previous function
- GoDecls, GoDeclsDir - jumping between declarations
- :GoAlternate - Alternate between xxx.go and xxx_test.go
- :A, :AV, :AS and :AT - :A works just like :GoAlternate

#Guru
- :GoReferrers
- :GoDescribe
- :GoImplements
- :GoWhicherrs
- :GoChannelPeers
- :GoCallees, :GoCallers, :GoCallstack
- :GoGuruScope <scope>
- :GoGuruTags mycustomtag
- :GoFreevars

#Generate it
- :GoGenerate to generate
- :GoImpl to create Method stubs implementing an interface

#Share it
- :GoPlay

