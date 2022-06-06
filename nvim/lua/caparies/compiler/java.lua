local status_ok = pcall(require, "toggleterm")
if not status_ok then
	return
end

local Terminal = require("toggleterm.terminal").Terminal

local split_string = function(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
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

function _JAVA_COMPILER()
	vim.cmd("!javac *.java")
	vim.cmd("w!")
	print("Compile Java files sucessfully!!!")
end

function _JAVA_TOGGLE()
	local cur_dir = vim.fn.expand("%:p")
	local new_table = split_string(cur_dir, "//")
	local cur_file = split_string(new_table[get_table_length(new_table)], ".")[1]
	local java = Terminal:new({
		cmd = vim.fn.printf("%s %s %s %s\n", "javac", cur_dir, "&& java " .. cur_file, "&& rm -rf *.class"),
		direction = "float",
	})
	java:toggle()
end
