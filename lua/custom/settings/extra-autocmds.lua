-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, { pattern = { '*.md' }, command = 'set tw=60' })

vim.api.nvim_create_autocmd(
  { 'BufWritePost' },
  { pattern = { '*.tex' }, command = 'silent !pdflatex -output-directory=%:h' .. '/output' .. ' % > /dev/null &' }
)

vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*.md',
  command = 'write | doautocmd BufWritePre | doautocmd BufWritePost',
})

vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*.tex',
  command = 'write | doautocmd BufWritePre | doautocmd BufWritePost',
})

-- Add two spaces to the end of every line
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*.md',
--   callback = function()
--     local save_cursor = vim.fn.getpos '.'
--     vim.cmd [[silent! %s/\([^\ ]\)$/\1  ]]
--     vim.fn.setpos('.', save_cursor)
--   end,
-- })

-- Remove double spaces
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.md',
  callback = function()
    local save_cursor = vim.fn.getpos '.'
    vim.cmd [[silent! %s/\(\S\)  \(\S\)/\1 \2/g]]
    vim.fn.setpos('.', save_cursor)
  end,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, { pattern = { '*.md' }, command = 'silent !pandoc % -o ~/Personal/Temporary/current_md_file_in_nvim.pdf &' })

vim.api.nvim_create_autocmd({ 'VimLeavePre' }, { command = 'mksession! ~/.cache/nvim/session.vim' })

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
