local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then return end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = false,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 20,
    highlights = {
      border = "curved",
      background = "Normal",
    },
  },
})

-- function _G.set_terminal_keymaps()
--   local opts = {noremap = true}
-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
-- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
-- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
-- vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
-- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
-- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
-- end
--
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

function _LAZYGIT_TOGGLE()
  local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
  lazygit:toggle()
end

function _NODE_TOGGLE()
  local node = Terminal:new({ cmd = "node", hidden = true })
  node:toggle()
end

function _NCDU_TOGGLE()
  local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
  ncdu:toggle()
end

function _HTOP_TOGGLE()
  local htop = Terminal:new({ cmd = "htop", hidden = true })
  htop:toggle()
end

function _PYTHON_TOGGLE()
  local python = Terminal:new({
    cmd = vim.fn.printf("%s %s\n", "python3", vim.fn.expand("%:p")),
    direction = "float",
    hidden = true,
  })
  python:toggle()
end

local split_string = function(inputstr, sep)
  if sep == nil then sep = "%s" end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local get_table_length = function(T)
  local count = 0
  for _ in pairs(T) do
    count = count + 1
  end
  return count
end

function GetPWD()
  local array_split = split_string(vim.fn.expand("%:p"), "/")
  local pwd = "/"
  for index, value in pairs(array_split) do
    if index ~= #array_split then pwd = pwd .. value end
    if index < #array_split - 1 then pwd = pwd .. "/" end
  end
  return pwd
end

function _JAVA_TOGGLE()
  local cur_dir = vim.fn.expand("%:p")
  local pwd = GetPWD()
  local command = vim.fn.printf("javac -d ./bin " .. pwd .. "/*.java ")
  local new_table = split_string(cur_dir, "//")
  local cur_file = split_string(new_table[get_table_length(new_table)], ".")[1]
  local java = Terminal:new({
    cmd = vim.fn.printf(
      "%s %s %s %s\n",
      command,
      "&& java -cp ./bin/ ",
      cur_file,
      "&& rm -rf ./bin"
    ),
    direction = "float",
  })
  java:toggle()
end

function _JAVA_PACKAGE_TOGGLE()
  local cur_dir = vim.fn.expand("%:p")
  local pwd = GetPWD()
  local package = '`grep "package" '
      .. cur_dir
      .. " | awk '{print $2}' | sed \"s/;//\"`"
  local command = vim.fn.printf("javac -d ./bin " .. pwd .. "/*.java ")
  local new_table = split_string(cur_dir, "//")
  local cur_file = split_string(new_table[get_table_length(new_table)], ".")[1]
  print(cur_file)
  local java = Terminal:new({
    cmd = vim.fn.printf(
      "%s %s %s %s\n",
      command,
      "&& java -cp ./bin/ ",
      package .. "." .. cur_file,
      "&& rm -rf ./bin"
    ),
    direction = "float",
  })
  java:toggle()
end

function _CPP_TOGGLE()
  local cpp = Terminal:new({
    cmd = vim.fn.printf(
      "%s %s %s %s\n",
      "g++",
      vim.fn.expand("%:p"),
      "&& ./a.out",
      "&& rm -rf a.out"
    ),
    direction = "float",
  })
  cpp:toggle()
end

local get_user_input = function(arg_val)
  local cmd = vim.fn.printf(
    "%s %s %s %s %s\n",
    "g++",
    vim.fn.expand("%:p"),
    "&& ./a.out",
    arg_val,
    "&& rm -rf a.out"
  )
  return cmd
end

function _CPP_FILEs_TOGGLE()
  local arg_array = {}
  local no_arg = vim.fn.input("Enter the number of arguments: ")
  for i = 1, tonumber(no_arg), 1 do
    arg_array[i] = vim.fn.input("argv[" .. i .. "] = ")
  end

  local arg_val = ""
  for i = 1, tonumber(no_arg), 1 do
    arg_val = arg_val .. " " .. arg_array[i]
  end
  local cpp_with_files = Terminal:new({
    cmd = get_user_input(arg_val),
    direction = "float",
  })
  cpp_with_files:toggle()
end
