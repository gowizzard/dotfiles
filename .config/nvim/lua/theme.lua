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
