local status, wk = pcall(require, 'which-key')
if (not status) then return end

wk.register(mappings, opts)
