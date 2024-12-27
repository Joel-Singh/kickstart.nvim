return {
  'renerocksai/telekasten.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  opts = {
    home = vim.fn.expand '~/Personal/note-graphs/Guiding-Principles/home',
    dailies = vim.fn.expand '~/Personal/note-graphs/Guiding-Principles/dailies',
    weeklies = vim.fn.expand '~/Personal/note-graphs/Guiding-Principles/weeklies',
    templates = vim.fn.expand '~/Personal/note-graphs/Guiding-Principles/weeklies',
  },
}
