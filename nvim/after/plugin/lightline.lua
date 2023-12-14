vim.cmd([[
  let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'modified', 'bufnum', 'mode' ], [ 'relativepath' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], ['fileformat'] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'gitstatus': 'GitStatus',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
    \ }
]])
