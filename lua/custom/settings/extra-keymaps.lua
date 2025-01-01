vim.keymap.set('n', '<Leader>W', '<CMD>w<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<Leader>sy', '<CMD>Telescope symbols<CR>', { desc = '[S]earch S[y]mbols' })

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md' }, command = 'set tw=60' })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md' }, command = 'Copilot disable' })
