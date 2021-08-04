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
" treesitter-based highlighting
"Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plugin 'nvim-treesitter/playground'

" Collection of common configurations for the Nvim LSP client
Plugin 'neovim/nvim-lspconfig'

" Autocompletion framework for built-in LSP
"Plugin 'nvim-lua/completion-nvim'
Plugin 'hrsh7th/nvim-compe'
Plugin 'ray-x/lsp_signature.nvim'

" Snippets support
Plugin 'hrsh7th/vim-vsnip'
Plugin 'SirVer/ultisnips'
Plugin 'norcalli/snippets.nvim'
Plugin 'honza/vim-snippets'

" dependencies
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'kyazdani42/nvim-web-devicons'

" telescope
Plugin 'nvim-telescope/telescope.nvim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"" Go Lang Bundle
"Plugin 'fatih/vim-go', { 'tag': 'v1.24', 'do': ':GoInstallBinaries' }
"Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Color
"Plugin 'fatih/molokai'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'dracula/vim'
"Plugin 'nanotech/jellybeans.vim', { 'tag': 'v1.7' }
"Plugin 'arcticicestudio/nord-vim'
Plugin 'fenetikm/falcon'

"Plugin 'ervandew/supertab'

"to split a one-liner into multiple lines'
"Plugin 'AndrewRadev/splitjoin.vim'

Plugin 'godlygeek/tabular'
"Plugin 'uarun/vim-protobuf'

"Plugin 'lewis6991/gitsigns.nvim'
Plugin 'airblade/vim-gitgutter'


Plugin 'scrooloose/nerdtree'
"Plugin 'Raimondi/delimitMate'

"Plugin 'scrooloose/vim-slumlord'
"Plugin 'aklt/plantuml-syntax'

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

"" default indentation: 4 spaces
set tabstop=4	softtabstop=4 shiftwidth=4 expandtab

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
let g:loaded_python_provider = 0
" Skip the check of neovim module
"let g:python3_host_skip_check = 1
" To disable ruby support
let g:loaded_ruby_provider = 0
" To disable node support
let g:loaded_node_provider = 0
" To disable perl support
let g:loaded_perl_provider = 0

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

let g:falcon_background = 0
let g:falcon_inactive = 1

if !exists('g:not_finish_vundle')
  "colorscheme jellybeans
  "colorscheme nord
  colorscheme falcon
endif

set background=dark
"set background=light

set lazyredraw          		" Wait to redraw

" vim-airline
let g:falcon_airline = 1
let g:airline_powerline_fonts = 1
"let g:airline_solarized_bg='dark'
"let g:airline_theme = 'jellybeans'
"let g:airline_theme = 'nord'
let g:airline_theme = 'falcon'
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

  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
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
" Lua Config
"*****************************************************************************
lua <<EOF

--local ts = require 'nvim-treesitter.configs'
-- ts.setup {
--  --ensure_installed = 'maintained',
--  ensure_installed = 'go',
--  highlight = {enable = true},
--}

--require('telescope').setup()

--require('gitsigns').setup()

-- Configure lsp
-- https://github.com/neovim/nvim-lspconfig#gopls
local nvim_lsp = require'lspconfig'

function goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end

-- function to attach completion when setting up lsp
local on_attach = function(client)
  --require'completion'.on_attach(client)

  require "lsp_signature".on_attach()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- gopls and rust-analyzer does not yet support goto declaration
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gS', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gW', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- Goto previous/next diagnostic warning/error
  buf_set_keymap('n', 'g[', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'g]', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  buf_set_keymap('n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<c-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

  -- Show diagnostic popup on cursor hover
  --buf_set_keymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_exec([[
  --     hi LspReferenceRead cterm=bold ctermbg=red guibg=SlateBlue
  --     hi LspReferenceText cterm=bold ctermbg=red guibg=SlateBlue
  --     hi LspReferenceWrite cterm=bold ctermbg=red guibg=SlateBlue
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]], false)
  -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- enable gopls
nvim_lsp.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        nilness = true,
        shadow = true,
        unusedwrite = true,
      },
      staticcheck = true,
      buildFlags = { "-tags=integration" },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup {
  on_attach=on_attach,
  capabilities = capabilities,
}

-- Enable diagnostics
--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, {
--    virtual_text = false,
--    signs = true,
--    update_in_insert = true,
--  }
--)

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}
EOF

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Map leader to ,
let mapleader=','

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

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>

" Print full path
map <C-f> :echo expand("%:p")<cr>

nnoremap <F6> :setlocal spell! spell?<CR>

"highlight link CompeDocumentation NormalFloat

autocmd BufWritePre *.go lua goimports(1000)
"autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
"autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Show diagnostic popup on cursor hover
"nnoremap <space>e       <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_sign_priority = 0

"*****************************************************************************
" Completion + Snippet
"*****************************************************************************
" Trigger completion with <tab>
" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
"set completeopt=menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" If Vim beeps during completion
set belloff+=ctrlg

" Completion window max size
"set pumheight=10

" By default auto popup is enabled, turn it off by
"let g:completion_enable_auto_popup = 0

" By default LSP's hover is automatically called and displays in a floating window
"let g:completion_enable_auto_hover = 0

" By default signature help opens automatically whenever it's available
"let g:completion_enable_auto_signature = 0

" Use <Tab> as trigger keys
"imap <tab> <Plug>(completion_smart_tab)
"imap <s-tab> <Plug>(completion_smart_s_tab)

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"let g:completion_enable_snippet = 'UltiSnips'

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

"*****************************************************************************
"" Telescope
"*****************************************************************************
" Find files using Telescope command-line sugar.
nmap <C-p> <cmd>Telescope find_files<cr>
nmap <C-g> <cmd>Telescope live_grep<cr>
nnoremap <silent> <M-p> <cmd>Telescope buffers<cr>
nmap <C-h> <cmd>Telescope help_tags<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader><tab> :b#<cr>

" ==================== delimitMate ====================
"let g:delimitMate_expand_cr = 1   
"let g:delimitMate_expand_space = 1    
"let g:delimitMate_smart_quotes = 1    
"let g:delimitMate_expand_inside_quotes = 0    
"let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'   

"imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

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
"let g:plantuml_executable_script='/usr/bin/plantuml'

"nnoremap <F5> :w<CR> :silent make<CR>
"inoremap <F5> <Esc>:w<CR>:silent make<CR>
"vnoremap <F5> :<C-U>:w<CR>:silent make<CR

"nnoremap <F5> :w<CR> :make<CR>

"*****************************************************************************
"" Go Lang - vim-go
"*****************************************************************************
"" disable vim-go :GoDef short cut (gd)
"" this is handled by LSP
"let g:go_def_mapping_enabled = 0
"let g:go_fmt_autosave = 0
"let g:go_imports_autosave = 0
"let g:go_mod_fmt_autosave = 0
"let g:go_metalinter_autosave = 0
"let g:go_asmfmt_autosave = 0

"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"let g:go_fmt_command = "gopls"
""let g:go_fmt_fail_silently = 1
""
""let g:go_list_type = "quickfix"
""let g:go_auto_type_info = 0
""let g:go_auto_sameids = 1
""
""let g:go_echo_command_info = 1
""let g:go_autodetect_gopath = 1
""
""let go_textobj_include_function_doc = 1
""
""let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'vetshadow']
"""let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode', 'gas', 'goconst', 'gocyclo', 'gosimple', 'ineffassign', 'vetshadow']
""let g:go_metalinter_autosave = 1
"""let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
""let g:go_metalinter_autosave_enabled = ['vet','errcheck']
"""let g:go_metalinter_deadline = "5s"
""
""let g:go_highlight_space_tab_error = 0
""let g:go_highlight_array_whitespace_error = 0
""let g:go_highlight_trailing_whitespace_error = 0
""let g:go_highlight_types = 0
""let g:go_highlight_fields = 0
""let g:go_highlight_functions = 0
""let g:go_highlight_function_calls = 0
""let g:go_highlight_operators = 0
""let g:go_highlight_extra_types = 0
""let g:go_highlight_build_constraints = 1
""let g:go_highlight_generate_tags = 1
""let g:go_highlight_format_strings = 0
""
""let g:go_modifytags_transform = 'camelcase'
""let g:go_fold_enable = []
""
""let g:go_play_open_browser = 0
""let g:go_play_browser_command = "chrome"
""
""let g:go_decls_includes = "func,type"
""
""nmap <C-d> :GoDeclsDir<cr>
""imap <C-d> <esc>:<C-u>GoDeclsDir<cr>
"
""" run :GoBuild or :GoTestCompile based on the go file
""function! s:build_go_files()
""  let l:file = expand('%')
""  if l:file =~# '^\f\+_test\.go$'
""    call go#test#Test(0, 1)
""  elseif l:file =~# '^\f\+\.go$'
""    call go#cmd#Build(0)
""  endif
""endfunction
""
"augroup FileType go
"  autocmd!
"  "
"  "  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
"  "  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
"  "  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)
"  "
"  "  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)
"  "
"  "  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
"  "  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
"  "
"  "  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
"  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
"  "  autocmd FileType go nmap <silent> <leader>tf <Plug>(go-test-func)
"  "  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
"  "  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)
"  "
"  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
"  "
"  "  autocmd FileType go nmap <silent> <Leader>m <Plug>(go-implements)
"  "
"  "  autocmd FileType go nmap <Leader>gt :GoDeclsDir<cr>
"  "
"  "  " I like these more!
"  "  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"  "  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"  "  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"  "  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"augroup END
""
""" create a go doc comment based on the word under the cursor
""function! s:create_go_doc_comment()
""  norm "zyiw
""  execute ":put! z"
""  execute ":norm I// \<Esc>$"
""endfunction
""nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>
