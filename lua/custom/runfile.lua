local M = {}

M.main = function()
	local ft = vim.bo.filetype
	local opts = "-mode=term -pos=bottom -rows=10 -raw -save=1"

	if ft == "python" then
		vim.cmd(":AsyncRun " .. opts .. " /usr/bin/python3 '$(VIM_FILEPATH)'")
	elseif ft == "cpp" then
		vim.cmd(":AsyncRun " .. opts .. " g++ -std=c++20 '$(VIM_FILEPATH)' -o '$(VIM_PATHNOEXT)'; ./'$(VIM_FILENOEXT)'")
	elseif ft == "rust" then
		vim.cmd(":AsyncRun " .. opts .. " rustc '$(VIM_FILEPATH)'; ./'$(VIM_FILENOEXT)'")
	elseif ft == "lua" then
		vim.cmd(":AsyncRun" .. opts .. " lua '$(VIM_FILEPATH)' ")
	elseif ft == "ruby" then
		vim.cmd(":AsyncRun" .. opts .. " ruby '$(VIM_FILEPATH)' ")
	elseif ft == "c" then
		vim.cmd(":AsyncRun " .. opts .. " cc '$(VIM_FILEPATH)' -o '$(VIM_PATHNOEXT)'; ./'$(VIM_FILENOEXT)'")
	elseif ft == "asm" then
		vim.cmd(":AsyncRun " .. opts .. " nasm -fmacho64 '$(VIM_FILEPATH)'; ld -v -macos_version_min 10.13 -e _start -static '$(VIM_PATHNOEXT).o' -o '$(VIM_PATHNOEXT)'; repeat 5 echo; ./'$(VIM_FILENOEXT)'")
	elseif ft == "java" then
		vim.cmd(":AsyncRun" .. opts .. " java '$(VIM_FILEPATH)' ")
	end
end

return M
