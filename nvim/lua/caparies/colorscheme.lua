vim.cmd([[
  try
    " tokyonight
    " tokyodark
  colorscheme tokyodark
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
