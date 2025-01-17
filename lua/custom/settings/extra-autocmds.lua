-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md' }, command = 'set tw=60' })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md', '*.tex' }, command = 'Copilot disable' })

vim.api.nvim_create_autocmd({ 'BufWritePost' }, { pattern = { '*.tex' }, command = 'silent !pdflatex -output-directory=output % > /dev/null &' })

vim.api.nvim_create_autocmd({ 'VimLeavePre' }, { command = 'mksession!' })
