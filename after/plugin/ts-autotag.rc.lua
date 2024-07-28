local status, autotag = pcall(require, 'nvim-autopairs')
if (not status) then return end

autotag.setup {}
