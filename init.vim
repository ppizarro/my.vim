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

Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'

Plugin 'godlygeek/tabular'
Plugin 'uarun/vim-protobuf'

Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'

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

set ttyfast

set laststatus=2

" Sets how many lines of history VIM has to remember
set history=700

"" Encoding
set encoding=utf-8

set guifont=Go\ Mono\ for\ Powerline

set autoread                    " Automatically reread changed files without asking me anything
set autoindent                  
set backspace=indent,eol,start	" Make backspace work as you would expect.

set noautochdir

set mouse=a                     "Enable mouse mode

set noerrorbells             " No beeps

"" Tabs. May be overriten by autocmd rules
set tabstop=4					" Render TABs using this many spaces.
set softtabstop=0
set shiftwidth=4				" Indentation amount for < and > commands.
set expandtab					" Insert spaces when TAB is pressed.

set clipboard=unnamedplus

"" Enable hidden buffers
set hidden						" Switch between buffers without having to save first.

"" Searching
set hlsearch					" Highlight search results.
set incsearch					" Incremental search.
set ignorecase					" Make searching case insensitive
set smartcase					" ... unless the query has capital letters.
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline

set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows

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

set updatetime=300

set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

" increase max memory to show syntax highlighting for large files 
set maxmempattern=20000

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
" To disable Python 2 support
let g:loaded_python_provider = 1
" Skip the check of neovim module
"let g:python3_host_skip_check = 1
" To disable ruby support
let g:loaded_ruby_provider = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable					" Enable syntax highlighting.
"set ruler						" Show the line and column numbers of the cursor.
set number						" Show the line numbers on the left side.

"set termguicolors
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
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

augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L
  
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

  autocmd BufRead,BufNewFile *.gotmpl set filetype=gotexttmpl
  
  autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
augroup END

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Map leader to ,
let mapleader=','

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" Next/Previous error
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" put quickfix window always to the bottom
augroup quickfix
    autocmd!
    autocmd FileType qf wincmd J
    autocmd FileType qf setlocal wrap
augroup END

" Automatically resize screens to be equally the same
" autocmd VimResized * wincmd =

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Remove search highlight
" nnoremap <leader><space> :nohlsearch<CR>
function! s:clear_highlight()
  let @/ = ""
  call go#guru#ClearSameIds()
endfunction
nnoremap <silent> <leader><space> :<C-u>call <SID>clear_highlight()<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>

" Print full path
map <C-f> :echo expand("%:p")<cr>

nnoremap <F6> :setlocal spell! spell?<CR>

" ==================== Fugitive ====================
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>

"*****************************************************************************
"" Go Lang
"*****************************************************************************
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
  \ 'goimports': '-local do/',
  \ }

let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0
let g:go_info_mode = "gocode"

let g:go_def_mode = 'gopls'
let g:go_echo_command_info = 1
let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'vetshadow']
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode', 'gas', 'goconst', 'gocyclo', 'gosimple', 'ineffassign', 'vetshadow']

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 0
let g:go_highlight_function_calls = 0
let g:go_gocode_propose_source = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []

nmap <C-d> :GoDeclsDir<cr>
imap <C-d> <esc>:<C-u>GoDeclsDir<cr>

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

  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>tf <Plug>(go-test-func)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  autocmd FileType go nmap <silent> <Leader>m <Plug>(go-implements)

  autocmd FileType go nmap <Leader>gt :GoDeclsDir<cr>

  " I like these more!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>

"*****************************************************************************
" Completion + Snippet
"*****************************************************************************
" Completion options (select longest + show menu even if a single match is found)
set completeopt=menu,menuone

" Completion window max size
set pumheight=10

" better key bindings for UltiSnipsExpandTrigger
let g:SuperTabDefaultCompletionType = "context"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"*****************************************************************************
"" FZF
"*****************************************************************************
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

" disable statusline overwriting
let g:fzf_nvim_statusline = 0

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

let g:fzf_history_dir = '~/.local/share/fzf-history'

" search across files in the current directory
nmap <C-p> :FzfFiles<cr>
imap <C-p> <esc>:<C-u>FzfFiles<cr>

" <M-p> for open buffers
nnoremap <silent> <M-p> :FzfBuffers<cr>

" search in history
nmap <C-b> :FzfHistory<cr>
imap <C-b> <esc>:<C-u>FzfHistory<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

nnoremap <C-g> :F<Cr>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"*****************************************************************************
" Ack searching and cope displaying
"*****************************************************************************
" Open Ack and put the cursor in the right position
map <leader>g :Ack<space>

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1   
let g:delimitMate_expand_space = 1    
let g:delimitMate_smart_quotes = 1    
let g:delimitMate_expand_inside_quotes = 0    
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'   

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

