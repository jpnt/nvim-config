local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local bufopts = { noremap = true, silent = true, buffer = bufnr }

-- General mappings
map('i', 'jk', '<ESC>', opts)
map('n', '<C-e>', ':NvimTreeToggle<CR>', opts) -- Sorry Vim users

-- Telescope mappings
map('n', 'ff', ':Telescope find_files<CR>', opts)
map('n', 'fg', ':Telescope live_grep<CR>', opts)
map('n', 'fb', ':Telescope buffers<CR>', opts)
map('n', 'fh', ':Telescope help_tags<CR>', opts)
map('n', 'fo', ':Telescope oldfiles<CR>', opts)

-- LSP mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)
-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gD', vim.lsp.buf.declaration, bufopts)
map('n', 'gd', vim.lsp.buf.definition, bufopts)
map('n', 'K', vim.lsp.buf.hover, bufopts)
map('n', 'gi', vim.lsp.buf.implementation, bufopts)
map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
map('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
map('n', 'gr', vim.lsp.buf.references, bufopts)
map('n', '<space>f', vim.lsp.buf.formatting, bufopts)

-- DAP mappings
map('n', '<F5>', ":lua require('dap').continue()<CR>", opts)
map('n', '<F10>', ":lua require('dap').step_over()<CR>", opts)
map('n', '<F11>', ":lua require('dap').step_into()<CR>", opts)
map('n', '<F12>', ":lua require('dap').step_out()<CR>", opts)
map('n', '<space>b', ":lua require('dap').toggle_breakpoint()<CR>", opts)
map('n', '<space>B', ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map('n', '<space>lp', ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
map('n', '<space>dr', ":lua require('dap').repl.open()<CR>", opts)
map('n', '<space>dl', ":lua require('dap').run_last()<CR>", opts)
