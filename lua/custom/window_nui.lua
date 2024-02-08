local Split = require("nui.split")

local split = Split({
  relative = "editor",
  position = "bottom",
  size = "20%",
  enter = false
})

return split
