local nvim_lsp = require('lspconfig')
local servers = {
  -- Add servers here
  'lua_ls',
  'rust_analyzer',
  'gopls'
  }

-- Setup each language servers
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {}
end

-- Configuration for lua
require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim', 'bufnr', 'use' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true)
      },
      telemetry = { enable = false, },
    },
  },
}

-- Diagnostics signs on the line number column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
