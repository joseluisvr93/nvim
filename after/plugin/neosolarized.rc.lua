local status, n = pcall(require, 'neosolarized')
if (not status) then return end

n.setup({
  comment_italics = true })

local cb = require('colorbuddy.init')

cb.Color.new('black', '#000000')
cb.Group.new('CursorLine', cb.colors.none, cb.colors.base03, cb.styles.NONE, cb.colors.base1)
cb.Group.new('CursorLineNr', cb.colors.yellow, cb.colors.black, cb.styles.NONE, cb.colors.base1)
cb.Group.new('Visual', cb.colors.none, cb.colors.base03, cb.styles.reverse)

local cError = cb.groups.Error.fg
local cInfo = cb.groups.Information.fg
local cWarn = cb.groups.Warning.fg
local cHint = cb.groups.Hint.fg

cb.Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), cb.styles.NONE)
cb.Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), cb.styles.NONE)
cb.Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), cb.styles.NONE)
cb.Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), cb.styles.NONE)
cb.Group.new("DiagnosticUnderlineError", cb.colors.none, cb.colors.none, cb.styles.undercurl, cError)
cb.Group.new("DiagnosticUnderlineWarn", cb.colors.none, cb.colors.none, cb.styles.undercurl, cWarn)
cb.Group.new("DiagnosticUnderlineInfo", cb.colors.none, cb.colors.none, cb.styles.undercurl, cInfo)
cb.Group.new("DiagnosticUnderlineHint", cb.colors.none, cb.colors.none, cb.styles.undercurl, cHint)
