-- TODO: How does split gets saved? How is it that you can return Split as a variable in a local scope, and it will still refer to the same buffer? Refer to the old testing2 branch example for this. Is it that lua variables still get stored during neovim runtime? Maybe it is not a local function the variable is stored in but a file?
local Split = require("nui.split")
local Popup = require("nui.popup")
local Line = require("nui.text")
vim.g.h = false

local popup = Popup({
  position = "50%",
  size = {
    width = "50%",
    height = "50%"
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

popup:mount()
vim.g.n = popup.bufnr

local file = "/Users/rabbity/Documents/Images/EMILIA/EMILIA27.png"
local image = require('hologram.image'):new(file, {})
vim.keymap.set("n", ";", function()
	vim.g.h = not vim.g.h
	if vim.g.h then
		popup:hide()
		image:delete(vim.g.n, {})
	else
		popup:show()
		image = require('hologram.image'):new(file, {})
		image:display(1, 0, vim.g.n, {})
	end
end)

-- require('hologram.image'):new('/Users/rabbity/Documents/Wallpaper/973489.png', {}):display(1, 0, vim.api.nvim_get_current_buf(), {})<
