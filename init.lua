require("plugin_setup")

local custom_plugin_options = {
    plugins = {
        "dashboard"
    },
    lsp = {
        "lsp",
        "cmp",
        "dap",
        "snips"
    },
	settings = {
		"mappings",
		"option"
	},
	custom = {
		"window_init",
		--"image"
	}
}

for key, value in pairs(custom_plugin_options) do
    for _, v in pairs(value) do
        require(key ..  "." .. v)
    end
end

vim.cmd("TransparentDisable")
vim.cmd("color tokyonight")

