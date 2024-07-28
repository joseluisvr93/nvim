-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.swapfile = false
opt.shell = "pwsh.exe"
opt.shellxquote = ""
opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
opt.shellquote = ""
opt.shellpipe = "| Out-File -Encoding UTF8 %s"
opt.shellredir = "| Out-File -Encoding UTF8 %s"

--opt.mouse = ""

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
