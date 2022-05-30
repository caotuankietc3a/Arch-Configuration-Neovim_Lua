local status_ok = pcall(require, "toggleterm")
if not status_ok then
	return
end

local Terminal = require("toggleterm.terminal").Terminal

local command_cpp = vim.api.nvim_exec(
	[[
  let s:cmd = printf("%s %s %s %s\n", "g++ -std=c++11", expand('%'),  "&& ./a.out", "&& rm -f ./a.out")
  function! s:My_Command_Cpp(cmd)
    echo a:cmd
  endfunction

  call s:My_Command_Cpp(s:cmd)
]],
	true
)

function _CPP_TOGGLE()
	local cpp = Terminal:new({
		cmd = command_cpp,
		direction = "float",
	})
	cpp:toggle()
end

local get_user_input = function(arg_val)
	local cmd = vim.fn.printf(
		"%s %s %s %s %s\n",
		"g++ -std=c++11",
		vim.fn.expand("%"),
		"&& ./a.out",
		arg_val,
		"&& rm -rf a.out"
	)
	return cmd
end

function _CPP_FILE_TOGGLE()
	local arg_val = vim.fn.input("Enter value of argv[1] = ")
	vim.fn.printf("\n %s", get_user_input(arg_val))
	local cpp_with_file = Terminal:new({
		cmd = get_user_input(arg_val),
		direction = "float",
	})
	cpp_with_file:toggle()
end
