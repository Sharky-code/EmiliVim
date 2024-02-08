vim.g.split_tog = true
vim.g.buffer_status = 0

-- In actuality this would be put in a mappings file, but since this is still just a lightweight program, it is omitted and put here instead
vim.keymap.set('n', ';', ":lua require(require('custom.window_opts').render).toggle() <CR>")
vim.keymap.set('n', '<Leader>;', ":lua require(require('custom.window_opts').render).toggle() <CR>")

local o = require("custom.window_opts")
local r = require(o.render)

r.mount()
r.hide()
