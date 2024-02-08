local M = {}

local o = require("custom.window_opts")

M.mount = function()
	require(o.nui):mount()
end

M.show = function()
	-- TODO: Need to add rendering/ updating features here
	require(o.nui):show()
end

M.hide = function()
	require(o.nui):hide()
end

M.toggle = function()
	if vim.g.split_tog then
		M.show()
	else
		M.hide()
	end
	vim.g.split_tog = not vim.g.split_tog
end

return M
