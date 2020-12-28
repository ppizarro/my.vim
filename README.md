# Introduction

My init.vim configuration, plugins and some other vim useful stuff (mainly taken from [Practical Vim: Edit Text at the Speed of Thought](http://pragprog.com/book/dnvim/practical-vim)).

# Installation

Put your init file into folder $XDG_CONFIG_HOME/nvim/init.vim
```
/bin/rm -rf ~/.config/nvim/init.vim
/bin/ln -fs "$(pwd)/init.vim" ~/.config/nvim
```

Install neovim >= 0.5 and python-client

```
sudo pacman -S neovim python2-neovim python-neovim fzf ripgrep
```

Execute ViM and it will install plugins automatically
```
nvim +PluginInstall +GoInstallBinaries +UpdateRemotePlugins +qall
```

# Basic Usage

- Press `,b`  to build
- Press `,t`  to test
- Press `,tf` to test function on the cursor
- Press `,c`  to coverage
- Press `,r`  to run
- Press `,e`  to install

- Press `,i`  to see info
- Press `,l`  to run metalinter
- Press `,x`  to see go doc
- Press `,v`  to definitions vertical
- Press `,s`  to definitions split

- Press `F4`  to outliner viewer

- Press `c-p` to search across files in the current directory
- Press `a-p` to search in the buffers
- Press `c-b` to search in the history
- Press `c-g` to jump between declarations

- Press `,n`  to open nerd tree

# To select the content of a function enclosure:
- if - inner function
- af - a function

# Struct split and join
- gS - split the struct expression into multiple lines
- gJ - join field definitions (If your cursor is on the variable)

# Snippets
- errp -> panic()
- fn -> fmt.Println()
- ff -> fmt.Printf()
- ln -> log.Println()
- lf -> log.Printf()
- json -> json tag to the struct field

# Navigate it
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

# Guru
- :GoReferrers
- :GoDescribe
- :GoImplements
- :GoWhicherrs
- :GoChannelPeers
- :GoCallees, :GoCallers, :GoCallstack
- :GoGuruScope <scope>
- :GoGuruTags mycustomtag
- :GoFreevars

# Generate it
- :GoGenerate to generate
- :GoImpl to create Method stubs implementing an interface

# Share it
- :GoPlay

# Copy and Paste
- yo - insert in paste mode

# Exploring the filesystem
- :e.	:edit .		at current working directory
- :sp.	:split .	in split at current working directory
- :vs.	:vsplit .	in vertical split at current working directory
- :E	:Explore	at directory of current file
- :Se	:Sexplore	in split at directory of current file
- :Vex	:Vexplore	in vertical split at directory of current file

# Manipulating the filesystem
- %	create a new file
- d	create a new directory
- R	rename the file/directory under the cursor
- D	Delete the file/directory under the cursor

# Buffer
- :ls          returns information about each buffer
- :bn          switch to the next buffer
- :bp          switch to the previous buffer
- :b<number>   switch to buffer number <number>
- :badd <file> open file in a hidden buffer
- :e <file>    open file in a new buffer and do it current
- :bd <number> delete the buffer - also takes buffer numbers as arguments
- :ball        open all buffers into windows
- c-6          switch to alternate buffer

