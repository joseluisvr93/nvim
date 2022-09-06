local has = function(x)
  return vim.fn.has(x) == 1
end

-- local is_mac = has "macunix"
local is_win = has "win32"
if is_win then
  vim.cmd "set spellfile=~/AppData/Local/nvim/spell/en.utf-8.add"
else
  vim.cmd "set spellfile=~/.config/nvim/spell/en.utf-8.add"
end
