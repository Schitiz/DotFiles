"----------------------- Vim Plug -----------------------------
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'kaicataldo/material.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()
"--------------------- Custom Settings -----------------------------
"set omnifunc=syntaxcomplete#Complete
set guifont=Fira\ Code
set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set ignorecase
set autochdir
set smartcase
set number relativenumber " enable line numbers
set hidden
set noshowmode
set encoding=utf-8
set laststatus=2
set omnifunc=ale#completion#OmniFunc

syntax on " enable highlighting

let mapleader=" "

filetype on
filetype plugin on
filetype indent on
"""""""""""""""""""""""" Material Theme Setup {{{
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material
"""""""""""""""""""""""""" }}}

"""""""""""""""""""""""""""""""""""" Highlight rules identified here
highlight Comment ctermfg=BLACK ctermbg=GREY
highlight LineNr ctermfg=YELLOW ctermbg=NONE
highlight ErrorMsg guibg=White guifg=Red
highlight ALEWarning ctermbg=YELLOW ctermfg=RED
highlight ALEError ctermbg=RED ctermfg=BLACK
"""""""""""""""""""""""""" }}}

"""""""""""""""""""""""""""" Custom Keybindings {{{
map <Leader>p :ALEToggle<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>
nmap <silent> <leader>a :set nu! rnu!<CR>
nnoremap gb :ls<CR>:b<Space>
noremap H g^
noremap L g$
map <Leader>s :source $MYVIMRC<CR>
nnoremap <leader>. :CtrlPTag<cr>
"""""""""""""""""""""""""" }}}

"""""""""""""""""""""""" set indent for 2 spaces {{{
set tabstop=2
set shiftwidth=2
set expandtab
"""""""""""""""""""""""""" }}}

""""""""""""""""""""""""" CtrlP settings {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"""""""""""""""""""""""""" }}}

""""""""""""""""""""""""" RainbowToggle {{{
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"""""""""""""""""""""""""" }}}

""""""""""""""""""""""""" RainbowToggle {{{
"let g:AutoPairsFlyMode = 1
"""""""""""""""""""""""""" }}}

""""""""""""""""""""""""""""" NERDTree setup {{{
let g:NERDTreeIgnore = ['^build$[[dir]]', '^node_modules$[[dir]]','^tags']
let NERDTreeRespectWildIgnore=1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
"""""""""""""""""""""""""" }}}

""""""""""""""""""""""""""""" YCM Setup {{{
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_filepath_completion_use_working_dir = 1 
"let g:ycm_use_clangd = 1
"""""""""""""""""""""""""" }}}
"""""""""""""""""""""""""""" VIM ALE Setup {{{
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1

let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'yaml': ['yamllint'],
  \   'rust': ['rls'],
  \}
let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \   'sql': ['pgformatter'],
  \   'yaml': ['prettier'],
  \   'rust': ['rustfmt']
  \}

nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

"""""""""""""""""""""""""""" }}}

"""""""""""""""""""""""""""""" Emmet Setup {{{
let g:user_emmet_leader_key=','

"""""""""""""""""""""""""""""" Lightline Setup {{{
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'material_vim',
	  \ 'active': {
      \ 	'right':   [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
      \               [ 'percent' ],
      \              	[ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
	  \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
    \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok', 
      \ }, 
		\ 'component_type': {
      \  'linter_checking': 'right',
      \  'linter_infos': 'right',
      \  'linter_warnings': 'warning',
      \  'linter_errors': 'error',
      \  'linter_ok': 'right',
      \ },
      \ }
"""""""""""""""""""""""""" }}}
