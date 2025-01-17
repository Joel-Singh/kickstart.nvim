vim.keymap.set('n', '<Leader>W', '<CMD>w<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<Leader>sy', '<CMD>Telescope symbols<CR>', { desc = '[S]earch S[y]mbols' })

vim.keymap.set('n', '<Leader>cc', '<CMD>CodeCompanionChat<CR>', { desc = '[C]ode [C]hat' })

vim.keymap.set('n', '<Tab>i', '<CMD>tabnew<CR>', { desc = '[Tab][I]nstantiate' })
vim.keymap.set('n', '<Tab>n', '<CMD>tabnext<CR>', { desc = '[Tab][N]ext' })
vim.keymap.set('n', '<Tab>c', '<CMD>tabclose<CR>', { desc = '[Tab][C]lose' })

vim.cmd 'command! Q qa'
