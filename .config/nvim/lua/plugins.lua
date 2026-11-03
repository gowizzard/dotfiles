vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    local data = event.data
    if data.spec.name == 'nvim-treesitter' and data.kind ~= 'delete' then
      if not data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end,
})

vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1') },
}, { confirm = false })

local parsers = {
  'bash', 'css', 'fish', 'go', 'gomod', 'gosum', 'html', 'java', 'javascript', 'json',
  'kotlin', 'liquid', 'lua', 'markdown', 'php', 'python', 'sql', 'terraform', 'toml',
  'tsx', 'typescript', 'vim', 'vimdoc', 'yaml', 'zig',
}

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    if pcall(vim.treesitter.start, event.buf) then
      vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

require('blink.cmp').setup({
  keymap = { preset = 'enter' },
  completion = {
    menu = { border = 'rounded' },
    documentation = { auto_show = true, window = { border = 'rounded' } },
  },
  signature = { enabled = true, window = { border = 'rounded' } },
})

require('conform').setup({
  format_on_save = { timeout_ms = 1000, lsp_format = 'fallback' },
  formatters_by_ft = {
    go = { 'gofmt' },
    zig = { 'zigfmt' },
  },
})

require('gitsigns').setup()

local fzf = require('fzf-lua')
fzf.setup()

local map = vim.keymap.set

map('n', '<leader>f', fzf.files, { desc = 'Find files' })
map('n', '<leader>g', fzf.live_grep, { desc = 'Search in project' })
map('n', '<leader>b', fzf.buffers, { desc = 'Open buffers' })
map('n', '<leader>s', fzf.lsp_document_symbols, { desc = 'Symbols in file' })
map('n', '<leader>d', fzf.diagnostics_workspace, { desc = 'Diagnostics' })
map('n', '<leader>r', fzf.resume, { desc = 'Resume last search' })
map('n', '<leader>l', function() vim.cmd('tab terminal lazygit') end, { desc = 'Lazygit' })
