vim.keymap.set('n', '<Leader>W', '<CMD>w<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<Leader>sy', '<CMD>Telescope symbols<CR>', { desc = '[S]earch S[y]mbols' })

vim.keymap.set('n', '<Leader>cc', '<CMD>CodeCompanionChat<CR>', { desc = '[C]ode [C]hat' })

vim.keymap.set('n', '<A-n>', '<CMD>tabnew<CR>', { desc = 'Tab new' })
vim.keymap.set('n', '<A-]>', '<CMD>tabnext<CR>', { desc = 'Tab Next' })
vim.keymap.set('n', '<A-[>', '<CMD>tabprevious<CR>', { desc = 'Tab Previous' })
vim.keymap.set('n', '<A-c>', '<CMD>tabclose<CR>', { desc = 'Tab Close' })

vim.cmd 'command! Q qa'
