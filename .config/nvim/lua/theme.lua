-- Set terminal colors and transparent highlights for neovim
local hl = vim.api.nvim_set_hl

vim.cmd.colorscheme('vim')
vim.opt.fillchars = { eob = ' ' }

hl(0, 'Normal', { bg = 'none' })
hl(0, 'LineNr', { ctermfg = 8 })
hl(0, 'Statement', { ctermfg = 4 })
hl(0, 'StatusLine', { ctermfg = 7, ctermbg = 'none', cterm = { bold = true } })
hl(0, 'StatusLineNC', { ctermfg = 8, ctermbg = 'none' })
hl(0, 'WinSeparator', { ctermfg = 8 })
hl(0, 'SignColumn', { ctermbg = 'none' })
hl(0, 'Pmenu', { ctermfg = 7, ctermbg = 'none' })
hl(0, 'PmenuSel', { ctermfg = 15, ctermbg = 8, cterm = { bold = true } })
hl(0, 'PmenuSbar', { ctermbg = 'none' })
hl(0, 'PmenuThumb', { ctermbg = 8 })
hl(0, 'NormalFloat', { ctermbg = 'none' })
hl(0, 'FloatBorder', { ctermfg = 8, ctermbg = 'none' })
hl(0, 'BlinkCmpMenuBorder', { link = 'FloatBorder' })
hl(0, 'BlinkCmpDocBorder', { link = 'FloatBorder' })
hl(0, 'BlinkCmpSignatureHelpBorder', { link = 'FloatBorder' })
hl(0, 'BlinkCmpLabelMatch', { ctermfg = 4, cterm = { bold = true } })
