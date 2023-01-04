--[[
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
Plugin 'tpope/vim-commentary' "plugin to comment stuff out
Plugin 'tpope/vim-repeat' "plugin to repeat surround maps using '.'
Plugin 'vim-scripts/ReplaceWithRegister' "plugin to copy stuff into register
Plugin 'christoomey/vim-system-copy' "plugin to copy with indentation
Plugin 'mattn/vim-textobj-url' "custom txt object
Plugin 'kana/vim-textobj-user' "url txt object
Plugin 'dracula/vim', {'name': 'dracula'} "use dracula colorscheme
Plugin 'airblade/vim-gitgutter' "git-gutter vim 
Plugin 'wfxr/minimap.vim' "blazing fast minimap
Plugin 'hashivim/vim-terraform' "HCL syntax highlighting and tab completion
Plugin 'ap/vim-css-color' "show colors for hex color values
Plugin 'ryanoasis/vim-devicons' "devicons

call vundle#end() " required

" ========= Plugin configs =========
colorscheme dracula

let g:dracula_colorterm = 0
let g:dracula_italic = 0

map ; :Files<cr>
set laststatus=2 "replace statusline

let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ 'active': {
    \   'left': [ [ 'modified', 'mode' ], [ 'absolutepath' ] ],
    \   'right': [ [ 'filetype' ], [ 'gitstatus' ] ]
    \ },
    \ 'component_function': {
    \   'gitstatus': 'GitStatus',
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
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
"highlight CursorLineNr ctermfg=15 ctermbg=236

highlight DiffAdd ctermfg=119
highlight DiffChange ctermfg=220
highlight DiffDelete ctermfg=160
highlight DiffText ctermfg=160

"highlight GitGutterAdd ctermfg=119 ctermbg=235
"highlight GitGutterChange ctermfg=220 ctermbg=235
"highlight GitGutterDelete ctermfg=160 ctermbg=235

autocmd BufReadPost * highlight minimapDiffAdded ctermfg=119
autocmd BufReadPost * highlight minimapDiffLine ctermfg=220
autocmd BufReadPost * highlight minimapDiffRemoved ctermfg=160

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

" ======= DevIcons  =======
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" }}}

"to configure statusline (only works at bottom of the file)
set noshowmode "hide the old mode display

--]]


-- RICE

-- ========= Basic Settings =========
vim.opt.encoding = 'UTF-8' -- for vim devicons to work
vim.opt.autoread = true -- Reload file changes outside vim
vim.opt.autoindent = true
-- vim.opt.syntax = true
vim.opt.complete = '.,w,b,u,t' --  scan all buffers and include tags
vim.opt.display = 'lastline' --  display as much as possible of a line
vim.opt.formatoptions= 'tcqj' --  auto-wrap text, better comment formatting
vim.opt.number = true -- turn line numbers on
vim.opt.paste = true -- allows to paste into vim without ruining indentation
vim.opt.numberwidth = 5 -- increase width of number column
vim.opt.cursorline = true -- highlight the current line
vim.opt.splitright = true -- open new split panes to the right and bottom
-- vim.opt.list listchars=tab:\ \ ,eol:·,nbsp:+ -- display end of line with dots
vim.opt.matchpairs = vim.opt.matchpairs + '<:>' -- HTML editing
vim.opt.fillchars = vim.opt.fillchars + 'vert: '

--  ========= Scrolling =========
vim.opt.ttyfast = true -- faster scrolling
vim.opt.mouse = 'a' -- copying text in vim editor with mouse does not select line no.
vim.opt.scrolloff = 8 -- start scrolling when we're 8 lines away from margins

-- vim.opt.filetype = true -- try to detect filetype
-- filetype plugin on -- Enable plugins detect filetype
-- filetype indent on -- Load an indent file for detected file type

-- ========= Searching =========
vim.opt.ignorecase = true -- case insensitive searching (unless specified)
vim.opt.smartcase = true -- case sensitive search when caps used
vim.opt.incsearch = true -- highlight search hits while typing
vim.opt.hlsearch = true -- highlight search hits

--  ========= Indentation =========
vim.opt.tabstop = 2
vim.opt.expandtab = true -- expand a tab key press into spaces
vim.opt.shiftwidth = 2
vim.opt.shiftround = true -- keeps indentation at multiples of shiftwidth

--  ========== Appearance =========
vim.opt.vb = true -- use visual terminal bell
vim.opt.linebreak = true -- dont break words when wrapping lines
vim.opt.showmatch = true -- highlight matching paired delimiter
vim.opt.showcmd = true -- display incomplete commands


-- RE-MAPPINGS
vim.g.mapleader = ' ' -- leader(space)

vim.keymap.set('n', '<Cr>', 'o<Esc>', {desc = 'Enter key creates new line in normal mode'})
vim.keymap.set('n', 'Y', 'y$', {desc = 'Yank from cursor to the end of line'})
vim.keymap.set('n', '<Leader>m', ':nohlsearch<CR>', {desc = 'Turn off highlight manually'})
-- nnoremap <silent><leader>m :nohlsearch<CR>:call minimap#vim#ClearColorSearch()<CR>

vim.keymap.set('n', 'n', 'nzzzv', {desc = 'Center cursor vertically when searching zv to open fold'})
vim.keymap.set('n', 'N', 'Nzzzv', {desc = 'Center cursor vertically when searching zv to open fold'})
vim.keymap.set('n', 'J', 'mzJ`z')

-- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j' -- jump list
-- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k' -- jump list

-- move lines up/down
vim.keymap.set('n', '<Leader>j', ':m .+1<CR>==')
vim.keymap.set('n', '<Leader>k', ':m .-2<CR>==')
vim.keymap.set('v', '<Leader>j', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '<Leader>k', ':m \'>-2<CR>gv=gv')

-- fzf for current directory
-- nnoremap <leader>; :Files %:h<Cr>
