-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md' }, command = 'set tw=60' })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md', '*.tex' }, command = 'Copilot disable' })

vim.api.nvim_create_autocmd({ 'BufWritePost' }, { pattern = { '*.tex' }, command = 'silent !pdflatex -output-directory=output % > /dev/null &' })

vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*.md',
  command = 'write | doautocmd BufWritePre | doautocmd BufWritePost',
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.md',
  callback = function()
    local save_cursor = vim.fn.getpos '.'
    vim.cmd [[silent! %s/\([^\ ]\)$/\1  ]]
    vim.fn.setpos('.', save_cursor)
  end,
})

vim.api.nvim_create_autocmd(
  { 'BufWritePost' },
  { pattern = { '*.md' }, command = 'silent !pandoc % -o ~/Personal/Temporary/current_md_file_in_nvim.pdf > /dev/null &' }
)

vim.api.nvim_create_autocmd({ 'VimLeavePre' }, { command = 'mksession! ~/nvim/Session.vim' })

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd 'normal! g`"zz'
    end
  end,
})
