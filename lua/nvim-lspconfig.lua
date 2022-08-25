-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Language servers
local nvim_lsp = require('lspconfig')
local servers = { 'rust_analyzer' } -- Add servers here

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {}
end
