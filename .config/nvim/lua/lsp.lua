require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'basedpyright',
    'gopls',
    'intelephense',
    'lua_ls',
    'terraformls',
    'ts_ls',
    'zls',
  },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = { library = { vim.env.VIMRUNTIME } },
    },
  },
})

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      gofumpt = false,
      staticcheck = true,
      usePlaceholders = true,
    },
  },
})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = { border = 'rounded' },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local map = function(keys, fn, desc)
      vim.keymap.set('n', keys, fn, { buffer = event.buf, desc = desc })
    end

    map('gd', vim.lsp.buf.definition, 'Go to definition')
    map('gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('gy', vim.lsp.buf.type_definition, 'Go to type definition')
    map('<leader>e', vim.diagnostic.open_float, 'Show diagnostic')
  end,
})
