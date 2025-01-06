local function run_current_file()
  if vim.bo.filetype == 'tex' then
    vim.cmd('!' .. vim.fn.expand '%:p:h' .. '/' .. 'compile.sh')
  end

  if vim.bo.filetype == 'python' then
    vim.cmd('cd ' .. vim.fn.expand '%:p:h')
    vim.cmd('!python ' .. vim.fn.expand '%:P')
  end

  if vim.bo.filetype == 'rust' then
    vim.cmd '!cargo run'
  end
end

vim.keymap.set('n', '<Leader>cr', run_current_file, { desc = '[C]ode [R]un' })
