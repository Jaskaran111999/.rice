local builtin = require('telescope.builtin')
-- builtin.setup{  defaults = { file_ignore_patterns = { "node_modules" }} }
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
