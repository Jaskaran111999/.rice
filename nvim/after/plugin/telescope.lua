local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>gpf', builtin.git_files, {})
vim.keymap.set('n', '<leader>grsi', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
