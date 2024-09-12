local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
map("i", "kj", "<ESC>", opts)                   -- Quickly get into normal mode
map("i", "jk", "<ESC>", opts)                   -- ""
map("n", "<ESC>", ":nohlsearch<CR>", opts)      -- Disable highlighted search results
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>") -- Change to current directory

-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Oil: File system explorer
map("n", "<C-n>", ":Oil<CR>", opts)

-- Neogit
map("n", "<C-g>", ":Neogit<CR>", opts)

-- Toggleterm
map("n", "<leader>tt", ":ToggleTerm<CR>", opts)
map("n", "<leader>ts", ":ToggleTermSendVisualLines<CR>", opts)

-- Compile mode
map("n", "<leader>cc", ":Compile<CR>", opts)

-- Nvim Ripgrep
map("n", "<leader>rg", ":Rg<CR>", opts)

-- Snap: Fuzzy finder
local snap = require("snap")
map("n", "<leader><leader>", snap.config.file { producer = "ripgrep.file" }, {})

-- LSP
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings
    opts = { buffer = ev.buf }
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gs", vim.lsp.buf.hover, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "gS", vim.lsp.buf.signature_help, opts)
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    map("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "<leader>f", function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
