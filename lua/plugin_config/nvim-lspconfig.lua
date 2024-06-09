local nvim_lsp = require("lspconfig")
local servers = {
  -- Add servers here!
  "lua_ls",
  "clangd",
  "rust_analyzer",
}

-- Setup each language servers
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {}
end

-- Diagnostics signs on the line number column
local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "I " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
