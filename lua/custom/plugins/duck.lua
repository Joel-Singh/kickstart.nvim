return {
  'tamton-aquib/duck.nvim',
  config = function()
    vim.cmd 'command! DuckHatch :lua require("duck").hatch()'
    vim.cmd 'command! DuckCook :lua require("duck").cook()'
    vim.cmd 'command! DuckCookAll :lua require("duck").cook_all()'
  end,
}
