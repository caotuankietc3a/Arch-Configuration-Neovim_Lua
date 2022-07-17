local status_ok = pcall(require, "toggleterm")
if not status_ok then
	return
end

local Terminal = require("toggleterm.terminal").Terminal

function _CPP_TOGGLE()
	local cpp = Terminal:new({
		cmd = vim.fn.printf("%s %s %s %s\n", "g++", vim.fn.expand("%:p"), "&& ./a.out", "&& rm -rf a.out"),
		direction = "float",
	})
	cpp:toggle()
end

local get_user_input = function(arg_val)
	local cmd = vim.fn.printf("%s %s %s %s %s\n", "g++", vim.fn.expand("%:p"), "&& ./a.out", arg_val, "&& rm -rf a.out")
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
