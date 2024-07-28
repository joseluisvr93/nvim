local opt = vim.opt

vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.number = true
opt.relativenumber = true

opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.incsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.sidescroll = 10
opt.backupskip = '/tmp/*,/private/tmp/*'
opt.inccommand = 'split'
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.ai = true            -- Auto indent
opt.si = true            -- Smart indent
opt.wrap = false         -- No wrap lines
opt.backspace = 'start,eol,indent'
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }
opt.swapfile = false
vim.g.mapleader = " "

opt.ignorecase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = 'yes'
opt.list = true

opt.mouse = 'a'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m]"]])
vim.cmd([[let &t_Ce = "\e[4:0m]"]])

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

opt.formatoptions:append { 'r' }


local has = function(x)
  return vim.fn.has(x) == 1
end

local is_win = has "win32"
local is_mac = has "macunix"
if is_win then
  vim.cmd([[let &shell = 'pwsh']])
  vim.cmd(
    [[let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;']])
  vim.cmd([[let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode']])
  vim.cmd([[let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode']])
  vim.cmd([[set shellquote= shellxquote= ]])
elseif is_mac then
  opt.shell = 'fish'
else
  opt.shell = 'bash'
end


vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'incsearch',
      timeout = 300
    })
  end
})
