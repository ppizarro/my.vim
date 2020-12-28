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
" Collection of common configurations for the Nvim LSP client
Plugin 'neovim/nvim-lspconfig'

" Extentions to built-in LSP, for example, providing type inlay hints
"Plugin 'tjdevries/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plugin 'nvim-lua/completion-nvim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'

Plugin 'majutsushi/tagbar'

"" Go Lang Bundle
"Plugin 'fatih/vim-go', { 'tag': 'v1.24', 'do': ':GoInstallBinaries' }
"Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Color
"Plugin 'fatih/molokai'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'dracula/vim'
"Plugin 'nanotech/jellybeans.vim', { 'tag': 'v1.7' }
Plugin 'arcticicestudio/nord-vim'

"Plugin 'ervandew/supertab'

"to split a one-liner into multiple lines'
Plugin 'AndrewRadev/splitjoin.vim'

Plugin 'SirVer/ultisnips'

Plugin 'godlygeek/tabular'
Plugin 'uarun/vim-protobuf'

Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/vim-slumlord'
Plugin 'aklt/plantuml-syntax'

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
set nocompatible

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
set smartindent
filetype indent on

set noautochdir

set mouse=a                     "Enable mouse mode

set noerrorbells                " No beeps

"" Tabs. May be overriten by autocmd rules
set tabstop=4					          " Render TABs using this many spaces.
set softtabstop=0
set shiftwidth=4				        " Indentation amount for < and > commands.
set expandtab					          " Insert spaces when TAB is pressed.

set clipboard=unnamedplus

"" Enable hidden buffers
set hidden						          " Switch between buffers without having to save first.

"" Searching
set hlsearch					          " Highlight search results.
set incsearch					          " Incremental search.
set ignorecase					        " Make searching case insensitive
set smartcase					          " ... unless the query has capital letters.
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
set nowritebackup

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

" Turn on the sign column so you can see error marks on lines
" where there are quickfix errors.
set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable					" Enable syntax highlighting.
set ruler						  " Show the line and column numbers of the cursor.
set number						" Show the line numbers on the left side.

if !exists('g:not_finish_vundle')
"  colorscheme jellybeans
  colorscheme nord
endif

set background=dark
"set background=light

set lazyredraw          		" Wait to redraw

" vim-airline
let g:airline_powerline_fonts = 1
"let g:airline_solarized_bg='dark'
"let g:airline_theme = 'jellybeans'
let g:airline_theme = 'nord'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

if !has('gui_running')
  set t_Co=256
endif
"let g:molokai_original = 1
"let g:rehash256 = 1
"let g:monochrome_italic_comments = 1
"let g:solarized_termcolors=256

set termguicolors

augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L
  
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf

  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
  autocmd BufRead,BufNewFile *.gotmpl set filetype=gotexttmpl
  autocmd BufNewFile,BufRead *.gohtml set filetype=gohtmltmpl
  
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

"*****************************************************************************
" Configure lsp
"*****************************************************************************
" https://github.com/neovim/nvim-lspconfig#gopls
lua <<EOF
local nvim_lsp = require'lspconfig'

function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    local method = "textDocument/codeAction"
    local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
    if resp and resp[1] then
      local result = resp[1].result
      if result and result[1] then
        local edit = result[1].edit
        vim.lsp.util.apply_workspace_edit(edit)
      end
    end

    vim.lsp.buf.formatting()
end

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- enable gopls
nvim_lsp.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  on_attach=on_attach,
}

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)
EOF

autocmd BufWritePre *.go lua goimports(1000)
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

"*****************************************************************************
" Code navigation shortcuts
" as found in :help lsp
"*****************************************************************************
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gy    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" gopls and rust-analyzer does not yet support goto declaration
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<CR>

let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_sign_priority = 0

" Enable type inlay hints
"autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
""\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }

"nnoremap <Leader>T :lua require'lsp_extensions'.inlay_hints()

"*****************************************************************************
" Completion + Snippet
"*****************************************************************************
set shortmess+=c          " Avoid showing extra messages when using completion
set belloff+=ctrlg        " If Vim beeps during completion

" Completion options (select longest + show menu even if a single match is found)
" set completeopt=menu,menuone
set completeopt=menuone,noinsert,noselect

" Completion window max size
set pumheight=10

" better key bindings for UltiSnipsExpandTrigger
" let g:SuperTabDefaultCompletionType = "context"
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Trigger completion with <tab>
" found in :help completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

let g:completion_enable_snippet = 'UltiSnips'

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
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" ==================== PlantUML ====================
let g:plantuml_executable_script='/usr/bin/plantuml'

"nnoremap <F5> :w<CR> :silent make<CR>
"inoremap <F5> <Esc>:w<CR>:silent make<CR>
"vnoremap <F5> :<C-U>:w<CR>:silent make<CR

"nnoremap <F5> :w<CR> :make<CR>

"*****************************************************************************
"" Go Lang
"*****************************************************************************
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"let g:go_fmt_command = "gopls"
"let g:go_fmt_fail_silently = 1
"let g:go_imports_autosave = 1
"
"let g:go_list_type = "quickfix"
"let g:go_auto_type_info = 0
"let g:go_auto_sameids = 1
"
"let g:go_echo_command_info = 1
"let g:go_autodetect_gopath = 1
"
"let go_textobj_include_function_doc = 1
"
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'vetshadow']
""let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode', 'gas', 'goconst', 'gocyclo', 'gosimple', 'ineffassign', 'vetshadow']
"let g:go_metalinter_autosave = 1
""let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_autosave_enabled = ['vet','errcheck']
""let g:go_metalinter_deadline = "5s"
"
"let g:go_highlight_space_tab_error = 0
"let g:go_highlight_array_whitespace_error = 0
"let g:go_highlight_trailing_whitespace_error = 0
"let g:go_highlight_types = 0
"let g:go_highlight_fields = 0
"let g:go_highlight_functions = 0
"let g:go_highlight_function_calls = 0
"let g:go_highlight_operators = 0
"let g:go_highlight_extra_types = 0
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_format_strings = 0
"
"let g:go_modifytags_transform = 'camelcase'
"let g:go_fold_enable = []
"
"let g:go_play_open_browser = 0
"let g:go_play_browser_command = "chrome"
"
"let g:go_decls_includes = "func,type"
"
"nmap <C-d> :GoDeclsDir<cr>
"imap <C-d> <esc>:<C-u>GoDeclsDir<cr>

"" run :GoBuild or :GoTestCompile based on the go file
"function! s:build_go_files()
"  let l:file = expand('%')
"  if l:file =~# '^\f\+_test\.go$'
"    call go#test#Test(0, 1)
"  elseif l:file =~# '^\f\+\.go$'
"    call go#cmd#Build(0)
"  endif
"endfunction
"
"augroup FileType go
"  autocmd!
"
"  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
"  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
"  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)
"
"  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)
"
"  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
"  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
"
"  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
"  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
"  autocmd FileType go nmap <silent> <leader>tf <Plug>(go-test-func)
"  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
"  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)
"
"  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
"
"  autocmd FileType go nmap <silent> <Leader>m <Plug>(go-implements)
"
"  autocmd FileType go nmap <Leader>gt :GoDeclsDir<cr>
"
"  " I like these more!
"  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"augroup END
"
"" create a go doc comment based on the word under the cursor
"function! s:create_go_doc_comment()
"  norm "zyiw
"  execute ":put! z"
"  execute ":norm I// \<Esc>$"
"endfunction
"nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
"let g:go_def_mapping_enabled = 0
