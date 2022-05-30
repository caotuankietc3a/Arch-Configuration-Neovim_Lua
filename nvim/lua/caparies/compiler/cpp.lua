local status_ok = pcall(require, "toggleterm")
if not status_ok then
	return
end

local Terminal = require("toggleterm.terminal").Terminal

local command_cpp = vim.api.nvim_exec(
	[[
  " let s:fname = input("File: ", "", "file")
  let s:file = printf("%s %s %s %s\n", "g++ -std=c++11", expand('%'),  "&& ./a.out", "&& rm -f ./a.out")
  function! s:My_Command_Cpp(file_path)
    echo a:file_path
  endfunction

  call s:My_Command_Cpp(s:file)
]],
	true
)

local cpp = Terminal:new({
	cmd = command_cpp,
	direction = "float",
})

function _CPP_TOGGLE()
	cpp:toggle()
end

-- vim.api.nvim_create_user_command("CompileCppWithFile", function(opts)
-- 	print(string.upper(opts.args))
-- end, { nargs = 1 })
-- vim.cmd("CompileCppWithFile hello world") -- prints "HELLO WORLD"
--
-- local cpp_with_file = Terminal:new({
-- 	cmd = vim.cmd("CompileCppWithFile hello world"),
-- 	direction = "float",
-- })
--
-- function _CPP_FILE_TOGGLE()
-- 	cpp_with_file:toggle()
-- end
