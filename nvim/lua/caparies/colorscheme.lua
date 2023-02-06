vim.cmd([[
  try
    " tokyonight
    " tokyodark
    " darkplus
    " dracula
    " catppuccin
  colorscheme tokyodark
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
