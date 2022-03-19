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
Plugin 'francoiscabrol/ranger.vim' "opens ranger while searching for files
Plugin 'junegunn/fzf' "fuzzyfinder base plugin
Plugin 'junegunn/fzf.vim' "fuzzyfinder plugin
Plugin 'itchyny/lightline.vim' "replace statusline
Plugin 'terryma/vim-multiple-cursors' "creates multiple cursors
Plugin 'tpope/vim-surround' "plugin to help surround text with brackets
Plugin 'tpope/vim-repeat' "plugin to repeat surround maps using '.'
Plugin 'scrooloose/nerdtree' "filetree
Plugin 'tpope/vim-fugitive'
Plugin 'HenryNewcomer/vim-theme-papaya' "use papaya colorscheme

call vundle#end() " required

" ========= Plugin configs =========

let g:ranger_replace_netrw = 1 "Open ranger when vim opens a directory
map ; :Files<cr>
set laststatus=2 "replace statusline
nnoremap <C-o> :NERDTreeToggle<cr>

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
set numberwidth=6 "increase width of number column
set cursorline "highlight the current line
set splitright "open new split panes to the right and bottom
set list listchars=tab:\ \ ,eol:·,nbsp:+ "display end of line with dots
set matchpairs+=<:> "HTML editing

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
nnoremap <silent><leader>m :nohlsearch<cr>


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


" ========== Colorscheme =========
colorscheme papaya

" }}}


" Re-mappings {{{
let mapleader = "\<space>" "leader - ( Spacebar )

" Enter key creats new line in normal mode
nnoremap <CR> o<Esc>

" center cursor vertically when searching
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

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

" ======= Auto commands =======
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Recompile suckless programs automatically
autocmd BufWritePost config.h,config.def.h !sudo make install

" }}}


"to configure statusline (only works at bottom of the file)
set noshowmode "hide the old mode display
