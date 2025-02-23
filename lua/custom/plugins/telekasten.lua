return {
  'renerocksai/telekasten.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  opts = {
    home = vim.fn.expand '~/Personal/Guiding-Principles/home',
    dailies = vim.fn.expand '~/Personal/Guiding-Principles/dailies',
    weeklies = vim.fn.expand '~/Personal/Guiding-Principles/weeklies',
    templates = vim.fn.expand '~/Personal/Guiding-Principles/weeklies',
  },
}
