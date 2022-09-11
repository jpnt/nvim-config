-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Language servers
local nvim_lsp = require('lspconfig')
local servers = {
  -- Add servers here
  'sumneko_lua',
  'rust_analyzer',
  'gopls'
  }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {}
end

-- Fix `Undefined global x` error
require('lspconfig').sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'bufnr',
          'use'
        }
      }
    }
  }
}

-- Diagnostics signs on the line number column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
