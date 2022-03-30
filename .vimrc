" Type :so % to refresh .vimrc after making changes


set shell=/bin/bash

"Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible "required

" PLUGINS {{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim' "allowing vundle to manage itself
Plugin 'Yggdroot/indentLine' "display indent lines for every indentation level (spaces)
Plugin 'junegunn/fzf' "fuzzyfinder base plugin
Plugin 'junegunn/fzf.vim' "fuzzyfinder plugin
Plugin 'itchyny/lightline.vim' "replace statusline
Plugin 'tpope/vim-surround' "plugin to help surround text with brackets
Plugin 'tpope/vim-repeat' "plugin to repeat surround maps using '.'
Plugin 'HenryNewcomer/vim-theme-papaya' "use papaya colorscheme
Plugin 'airblade/vim-gitgutter' "git-gutter vim 
Plugin 'wfxr/minimap.vim' "blazing fast minimap
Plugin 'hashivim/vim-terraform' "HCL syntax highlighting and tab completion
Plugin 'ap/vim-css-color' "show colors for hex color values

call vundle#end() " required

" ========= Plugin configs =========
colorscheme papaya

map ; :Files<cr>
set laststatus=2 "replace statusline

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'modified', 'mode' ], [ 'absolutepath' ] ],
    \   'right': [ [ 'filetype' ], [ 'gitstatus' ] ]
    \ },
    \ 'component_function': {
    \   'gitstatus': 'GitStatus'
    \ }
  \ }

" ========= Git Gutter  =========
set signcolumn=yes "always show gitgutter sign column
set updatetime=60 "reduce the time vim waits before writing to swap file and makes signs appear faster
silent! call repeat#set("\<Plug>vim-gitgutter", v:count) "enable use of '.' for plugin mappings

let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_set_sign_backgrounds = 1

" ========= Minimap  =========
let g:minimap_width = 15
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight_search = 1
let g:minimap_git_colors = 1

" ========= Colors  =========
"customize gitgutter colors for papaya
highlight! link SignColumn LineNr
highlight CursorLineNr ctermfg=15 ctermbg=236

highlight DiffAdd ctermfg=119 ctermbg=235
highlight DiffChange ctermfg=220 ctermbg=235
highlight DiffDelete ctermfg=160 ctermbg=235
highlight DiffText ctermfg=160 ctermbg=235

highlight GitGutterAdd ctermfg=119 ctermbg=235
highlight GitGutterChange ctermfg=220 ctermbg=235
highlight GitGutterDelete ctermfg=160 ctermbg=235

autocmd BufReadPost * highlight minimapDiffAdded ctermfg=119 ctermbg=235
autocmd BufReadPost * highlight minimapDiffLine ctermfg=220 ctermbg=235
autocmd BufReadPost * highlight minimapDiffRemoved ctermfg=160 ctermbg=235

" }}}


" RICE {{{


" ========= Basic Settings =========
set encoding=UTF-8 "for vim devicons to work
set autoread "Reload file changes outside vim
set autoindent
set complete=.,w,b,u,t " scan all buffers and include tags
set display=lastline " display as much as possible of a line
set formatoptions=tcqj " auto-wrap text, better comment formatting
set number "turn line numbers on
set paste "allows to paste into vim without ruining indentation
set numberwidth=5 "increase width of number column
set cursorline "highlight the current line
set splitright "open new split panes to the right and bottom
set list listchars=tab:\ \ ,eol:·,nbsp:+ "display end of line with dots
set matchpairs+=<:> "HTML editing
set fillchars+=vert:\ 


filetype on "try to detect filetype
filetype plugin on "Enable plugins detect filetype
filetype indent on "Load an indent file for detected file type


" ========= Scrolling =========
set ttyfast "faster scrolling
set mouse=a "copying text in vim editor with mouse does not select line no.
set scrolloff=8 "start scrolling when we're 8 lines away from margins


" ========= Searching =========
set ignorecase "case insensitive searching (unless specified)
set smartcase "case sensitive search when caps used
set incsearch "highlight search hits while typing
set hlsearch "highlight search hits


" ========= Indentation =========
set tabstop=2
set expandtab "expand a tab key press into spaces
set shiftwidth=2
set shiftround "keeps indentation at multiples of shiftwidth


" ========== Appearance =========
set vb "use visual terminal bell
set linebreak "dont break words when wrapping lines
set showmatch "highlight matching paired delimiter
set showcmd "display incomplete commands


" }}}


" Re-mappings {{{
let mapleader = "\<space>" "leader - ( Spacebar )

" Enter key creats new line in normal mode
nnoremap <CR> o<Esc>

" center cursor vertically when searching 'zv' to open fold
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" for jumplist
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

"move lines up or down
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '>-2<CR>gv=gv

" Yank from cursor to the end of line.
nnoremap Y y$

" Turn off highlight manually
nnoremap <silent><leader>m :nohlsearch<CR>:call minimap#vim#ClearColorSearch()<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" ========== Functions ===========
"Toggle relative numbering, when in insert mode
function! ToggleNumbersOn()
  set nu!
  set rnu
endfunction

function! ToggleRelativeOn()
  set rnu!
  set nu
endfunction

"Fetch number of changes for lightline
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

" ======= Auto commands =======
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" }}}

"to configure statusline (only works at bottom of the file)
set noshowmode "hide the old mode display
