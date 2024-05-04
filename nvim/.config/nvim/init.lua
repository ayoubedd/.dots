Config = {
	modules = {
		"bootstrap",
		"neovim",
		"keybinds",
		"plugins",
	},
	paths = {
		config = vim.fn.stdpath("config"),
	},
}

package.path = package.path .. ";" .. Config.paths.config .. "/?.lua"

require("utils")

for _, name in pairs(Config.modules) do
	SafeRequire(name)
end
