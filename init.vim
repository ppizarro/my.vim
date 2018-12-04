"*****************************************************************************
"" Plugin core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " be iMproved, required
  filetype off                   " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.config/nvim/bundle/Vundle.vim/
endif

let vundle_readme=expand('~/.config/nvim/bundle/Vundle.vim/README.md')

if !filereadable(vundle_readme)
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim ~/.config/nvim/bundle/Vundle.vim/
  let g:not_finish_vundle = "yes"
endif

call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"*****************************************************************************
"" Plugin install packages
"*****************************************************************************
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'

"" Go Lang Bundle
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Color
Plugin 'fatih/molokai'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'dracula/vim'
"Plugin 'morhetz/gruvbox'
"Plugin 'google/vim-colorscheme-primary'
"Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'bitfield/vim-gitgo'
"Plugin 'fxn/vim-monochrome'
"Plugin 'sjl/badwolf'

Plugin 'AndrewRadev/splitjoin.vim'

"" Go Lang Context-sensitive autocompletion
Plugin 'mdempsky/gocode', {'rtp': 'nvim/'}
"Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plugin 'zchee/deoplete-go', {'build': {'unix': 'make'}}

Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'

Plugin 'jodosha/vim-godebug'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'uarun/vim-protobuf'

" All of your Plugins must be added before the following line
call vundle#end()         " required

filetype plugin indent on " Load plugins according to detected filetype, required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" let's make sure we are in noncompatble mode
set nocp

" Sets how many lines of history VIM has to remember
set history=700

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set guifont=Go\ Mono\ for\ Powerline

set backspace=indent,eol,start	" Make backspace work as you would expect.

"" Tabs. May be overriten by autocmd rules
set tabstop=4					" Render TABs using this many spaces.
set softtabstop=0
set shiftwidth=4				" Indentation amount for < and > commands.
set expandtab					" Insert spaces when TAB is pressed.

set clipboard=unnamedplus

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden						" Switch between buffers without having to save first.

"" Searching
set hlsearch					" Highlight search results.
set incsearch					" Incremental search.
set ignorecase					" Make searching case insensitive
set smartcase					" ... unless the query has capital letters.

if exists('&inccommand')
  set inccommand=split
endif

"" Encoding
set bomb
set binary

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd 					" Show (partial) command in status line.
set shell=/bin/sh

" Automatically save before :next, :make etc.
set autowrite

" Make sure that coursor is always vertically centered on j/k moves
"set so=999

" add vertical lines on columns
"set colorcolumn=80,120

" Highlight current line - allows you to track cursor position more easily
set cursorline
set nocursorcolumn				" Speed up syntax highlighting

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
" To disable Python 2 support
let g:loaded_python_provider = 1
" Skip the check of neovim module
"let g:python3_host_skip_check = 1
" To disable ruby support
let g:loaded_ruby_provider = 1

" Close the current buffer (w/o closing the current window)
map <leader>bd :Bclose<cr>

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable					" Enable syntax highlighting.
set ruler						" Show the line and column numbers of the cursor.
set number						" Show the line numbers on the left side.

set termguicolors
"set t_Co=256

"let g:rehash256 = 1
"let g:molokai_original = 1
"let g:monochrome_italic_comments = 1
"let g:solarized_termcolors=256

if !exists('g:not_finish_vundle')
  colorscheme molokai
"  colorscheme solarized
"  colorscheme primary
"  colorscheme PaperColor
"  colorscheme gitgo
"  color dracula
"  colorscheme gruvbox
"  colorscheme monochrome
"  colorscheme badwolf
endif

set background=dark
"set background=light

set lazyredraw          		" Wait to redraw

" vim-airline
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'powerlineish'
let g:airline_theme = 'molokai'
"let g:airline_theme = 'solarized'
"let g:airline_solarized_bg='dark'
"let g:airline_theme = 'base16_google'
"let g:airline_theme = 'gruvbox'
"let g:airline_theme = 'monochrome'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" explore current directory in vertical split
nmap <silent> <F3> :vs.<CR>

"" Tabs
"nnoremap <Tab> gt
"nnoremap <S-Tab> gT
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
let g:go_fmt_fail_silently = 0
"let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"

let g:go_autodetect_gopath = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

"let g:go_def_mode = 'godef'
"let g:go_decls_includes = "func,type"
"
"let g:go_play_open_browser = 0
"let g:go_play_browser_command = "chrome"

"" quickfix list instead of location lists
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:go_test_timeout = '10s'

let g:go_metalinter_command = ""
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode', 'gas', 'goconst', 'gocyclo', 'gosimple', 'ineffassign', 'vetshadow']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'vetshadow']
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_deadline = "5s"

"let g:go_textobj_include_function_doc = 0

nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup FileType go
  autocmd!

  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
  autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  autocmd FileType go nmap <Leader>e <Plug>(go-rename)
  autocmd FileType go nmap <Leader>m <Plug>(go-implements)

  autocmd FileType go nmap <Leader>gt :GoDeclsDir<cr>

  " I like these more!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

augroup END

"*****************************************************************************
" Completion + Snippet
"*****************************************************************************
" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menuone
"set completeopt=menu,menuone

" neocomplete like
"set completeopt+=noinsert
" deoplete.nvim recommend
"set completeopt+=noselect

" Completion window max size
set pumheight=10

" Run deoplete.nvim automatically
"let g:deoplete#enable_at_startup = 1
" deoplete-go settings
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#package_dot = 1
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#sources#go#pointer = 1
"let g:deoplete#sources#go#cgo = 1

" Use partial fuzzy matches like YouCompleteMe
"if !exists('g:not_finish_vundle')
" call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
" call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
" call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
"endif

" Disable deoplete when in multi cursor mode
"function! Multiple_cursors_before()
"    let b:deoplete_disable_auto_complete = 1
"endfunction

"function! Multiple_cursors_after()
"    let b:deoplete_disable_auto_complete = 0
"endfunction

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:SuperTabDefaultCompletionType = "context"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"let g:ycm_key_list_select_completion = ['<c-Space>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<c-s-Space>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<c-Space>'

"let g:UltiSnipsExpandTrigger = "<C-l>"
"let g:UltiSnipsJumpForwardTrigger = "<C-j>"
"let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

"*****************************************************************************
"" FZF
"*****************************************************************************
" disable statusline overwriting
let g:fzf_nvim_statusline = 0
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

if executable('fzf')
  " FZF {{{
  " <C-p> to search files
  nnoremap <silent> <C-p> :FZF<cr>

  " <M-p> for open buffers
  nnoremap <silent> <M-p> :Buffers<cr>

  " <M-S-p> for MRU
  nnoremap <silent> <M-S-p> :History<cr>

  " Better command history with q:
  command! CmdHist call fzf#vim#command_history({'right': '40'})
  nnoremap q: :CmdHist<CR>

  " Better search history
  command! QHist call fzf#vim#search_history({'right': '40'})
  nnoremap q/ :QHist<CR>

  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  " Advanced customization using autoload functions
  inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

  fun! s:fzf_root()
  	let path = finddir(".git", expand("%:p:h").";")
  	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
  endfun

  nnoremap <silent> <Leader>ff :exe 'Files ' . <SID>fzf_root()<CR>
  nnoremap <silent> <Leader>fc :Colors<CR>
  nnoremap <silent> <Leader>fh :History<CR>
  nnoremap <silent> <Leader>bb :Buffers<CR>
  nnoremap <silent> <Leader>; :Commands<CR>
  nnoremap <silent> <Leader>h :Helptags<CR>
  nnoremap <silent> <Leader>ll :Lines<CR>
  nnoremap <silent> <Leader>lb :BLines<CR>"
  " }}}
else
  " CtrlP fallback
end

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"*****************************************************************************
" Ack searching and cope displaying
"*****************************************************************************
" Open Ack and put the cursor in the right position
map <leader>g :Ack<space>

