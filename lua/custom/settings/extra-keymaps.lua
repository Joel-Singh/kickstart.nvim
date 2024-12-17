vim.keymap.set('n', 'W', '<CMD>w<CR>', { desc = 'Write file' })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md' }, command = 'set tw=60' })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md' }, command = 'Copilot disable' })

vim.api.nvim_set_keymap('n', '<C-j>', ':Treewalker Down<CR>', { noremap = true, desc = 'Treewalker Down' })
vim.api.nvim_set_keymap('n', '<C-k>', ':Treewalker Up<CR>', { noremap = true, desc = 'Treewalker Up' })
vim.api.nvim_set_keymap('n', '<C-h>', ':Treewalker Left<CR>', { noremap = true, desc = 'Treewalker Left' })
vim.api.nvim_set_keymap('n', '<C-l>', ':Treewalker Right<CR>', { noremap = true, desc = 'Treewalker Right' })
