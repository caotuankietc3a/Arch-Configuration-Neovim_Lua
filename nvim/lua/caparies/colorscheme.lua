vim.cmd([[
  try
    " tokyonight
    " tokyodark
    " darkplus
  colorscheme tokyonight
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
