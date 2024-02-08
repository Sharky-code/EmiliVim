local M

local o = require("custom.window_opts")

M.buffer_content = function ()
	-- TODO: Update this to become a legimate way of displaying content
	local lines = {}
	lines.insert("Buffer Status: " .. vim.g.buffer_status % 3)
	return lines
end

return M
