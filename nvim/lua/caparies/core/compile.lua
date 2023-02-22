local status_ok = pcall(require, "toggleterm")
if not status_ok then return end

local Terminal = require("toggleterm.terminal").Terminal

function _PYTHON_TOGGLE()
  local python = Terminal:new({
    cmd = vim.fn.printf("%s %s\n", "python3", vim.fn.expand("%:p")),
    direction = "float",
  })
  python:toggle()
end
