--[[
-- TODO: How does split gets saved? How is it that you can return Split as a variable in a local scope, and it will still refer to the same buffer? Refer to the old testing2 branch example for this. Is it that lua variables still get stored during neovim runtime? Maybe it is not a local function the variable is stored in but a file?
local Split = require("nui.split")
local Popup = require("nui.popup")
local Line = require("nui.text")

vim.g.h = false
vim.g.m = false


local popup = Popup({
  position = "50%",
  size = {
    width = "100%",
    height = "100%"
  },
  enter = true,
  focusable = true,
  zindex = 50,
  relative = "editor",
  border = {
    padding = {
      top = 2,
      bottom = 2,
      left = 3,
      right = 3,
    },
    style = "rounded",
    text = {
      top = " I am top title ",
      top_align = "center",
      bottom = "I am bottom title",
      bottom_align = "left",
    },
  },
  buf_options = {
    modifiable = true,
    readonly = false,
  },
  win_options = {
    winblend = 10,
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
  },
})

vim.g.n = popup.bufnr

local function list_files (dir)
	local result = {}
	for file in io.popen(string.format("ls -pa %s | grep -v /", dir)):lines() do 
		table.insert(result, dir .. file)
	end
	return result
end

local function random_item (tabl)
	return tabl[math.random(#tabl)]
end

local path = "/Users/rabbity/Documents/Images/EMILIATERM/"
local file = random_item(list_files(path))
local image = require('hologram.image'):new(file, {})

vim.keymap.set("n", ";", function()
	if not vim.g.m then
		popup:mount()
		popup:hide()
		vim.g.m = true
	end

	vim.g.h = not vim.g.h
	if vim.g.h then
		popup:hide()
		image:delete(vim.g.n, {})
	else
		popup:show()
		file = random_item(list_files(path))
		image = require('hologram.image'):new(file, {})
		image:display(1, 0, vim.g.n, {})
		-- image:display(vim.api.nvim_win_get_cursor(0)[1], 0, vim.api.nvim_get_current_buf(), {})
	end
end)


-- require('hologram.image'):new('/Users/rabbity/Documents/Wallpaper/973489.png', {}):display(1, 0, vim.api.nvim_get_current_buf(), {})<
]]
