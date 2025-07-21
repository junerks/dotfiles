local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local gdproject = io.open(vim.fn.getcwd() .. "/project.godot", "r")
if gdproject then
	io.close(gdproject)
	local socket_path = "./godothost"
	if vim.loop.fs_stat(socket_path) then
		os.remove(socket_path)
	end
	vim.fn.serverstart("./godothost")
end

require("settings")
require("keymaps")
require("lazy").setup("plugins")
