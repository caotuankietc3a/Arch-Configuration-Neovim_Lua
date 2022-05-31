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

function _CPP_FILEs_TOGGLE()
	local arg_array = {}
	local no_arg = vim.fn.input("Enter the number of arguments: ")
	for i = 1, tonumber(no_arg), 1 do
		arg_array[i] = vim.fn.input("argv[" .. i .. "] = ")
	end
	local arg_val = ""
	for i = 1, tonumber(no_arg) - 1, 1 do
		arg_val = arg_array[i] .. " " .. arg_array[i + 1]
	end

	local cpp_with_files = Terminal:new({
		cmd = get_user_input(arg_val),
		direction = "float",
	})
	cpp_with_files:toggle()
end
