"*****************************************************************************
"" NeoBundle core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"

  " Run shell script if exist on custom select language
endif

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs.git'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'majutsushi/tagbar'

"" Color
NeoBundle 'tomasr/molokai'

"" Go Lang Bundle
NeoBundle "fatih/vim-go"

"" Go Lang Context-sensitive autocompletion
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'zchee/deoplete-go', {'build': {'unix': 'make'}}

call neobundle#end()

" Required:
filetype plugin indent on " Load plugins according to detected filetype.

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set backspace=indent,eol,start	" Make backspace work as you would expect.

"" Tabs. May be overriten by autocmd rules
set tabstop=4					" Render TABs using this many spaces.
set softtabstop=0
set shiftwidth=4				" Indentation amount for < and > commands.
set expandtab					" Insert spaces when TAB is pressed.

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden						" Switch between buffers without having to save first.

"" Searching
set hlsearch					" Highlight search results.
set incsearch					" Incremental search.
set ignorecase					" Make searching case insensitive
set smartcase					" ... unless the query has capital letters.

"" Encoding
set bomb
set binary

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd 					" Show (partial) command in status line.
set shell=/bin/sh

"" Call make on save
set autowrite

"" quickfix list instead of location lists
let g:go_list_type = "quickfix"

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on						" Enable syntax highlighting.
set ruler						" Show the line and column numbers of the cursor.
set number						" Show the line numbers on the left side.

let no_buffers_menu=1
if !exists('g:not_finsh_neobundle')
  colorscheme molokai
endif

if &term =~ '256color'
  set t_ut=
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" Next/Previous error
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"*****************************************************************************
"" Go Lang
"*****************************************************************************
let g:go_fmt_command = "goimports"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup FileType go
  au!

  au FileType go nmap <leader>r <Plug>(go-run)
  ""au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>e <Plug>(go-rename)
  au FileType go nmap <Leader>i <Plug>(go-info)

"  au FileType go nmap gd <Plug>(go-def)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)

  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>s  <Plug>(go-implements)

augroup END

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'
let g:deoplete#sources#go#cgo = 1

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

