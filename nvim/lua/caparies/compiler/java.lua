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

function _JAVA_TOGGLE()
	-- vim.cmd("!mkdir src")
	-- vim.cmd("!mv ./* src 2>/dev/null")
	local cur_dir = vim.fn.expand("%:p")
	vim.cmd("!javac -d ../bin " .. cur_dir)
	local new_table = split_string(cur_dir, "//")
	local cur_file = split_string(new_table[get_table_length(new_table)], ".")[1]
	local java = Terminal:new({
		cmd = vim.fn.printf("%s %s %s\n", "java -cp ../bin/ ", cur_file, "&& rm -rf ../bin"),
		direction = "float",
	})
	java:toggle()
end
