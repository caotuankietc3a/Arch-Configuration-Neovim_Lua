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

function GetPWD()
	local array_split = split_string(vim.fn.expand("%:p"), "/")
	local pwd = "/"
	for index, value in pairs(array_split) do
		if index ~= #array_split then
			pwd = pwd .. value
		end
		if index < #array_split - 1 then
			pwd = pwd .. "/"
		end
	end
	return pwd
end

function _JAVA_TOGGLE()
	-- vim.cmd("!mkdir src")
	-- vim.cmd("!mv ./* src 2>/dev/null")
	local cur_dir = vim.fn.expand("%:p")
	local pwd = GetPWD()
	-- vim.cmd("!javac -d ./bin " .. pwd .. "/*.java")
	local command = vim.fn.printf("javac -d ./bin " .. pwd .. "/*.java ")
	local new_table = split_string(cur_dir, "//")
	local cur_file = split_string(new_table[get_table_length(new_table)], ".")[1]
	print(cur_file)
	local java = Terminal:new({
		cmd = vim.fn.printf("%s %s %s %s\n", command, "&& java -cp ./bin/ ", cur_file, "&& rm -rf ./bin"),
		direction = "float",
	})
	java:toggle()
end

function _JAVA_PACKAGE_TOGGLE()
	local cur_dir = vim.fn.expand("%:p")
	local pwd = GetPWD()
	local package = '`grep "package" ' .. cur_dir .. " | awk '{print $2}' | sed \"s/;//\"`"
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
