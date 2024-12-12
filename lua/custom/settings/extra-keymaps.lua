vim.keymap.set('n', 'W', '<CMD>w<CR>', { desc = 'Write file' })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md' }, command = 'Copilot disable' })
