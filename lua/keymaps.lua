local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
map("i", "kj", "<ESC>", opts)              -- Quickly get into normal mode
map("i", "jk", "<ESC>", opts)              -- ""
map("n", "<ESC>", ":nohlsearch<CR>", opts) -- Disable highlighted search results
map("i", "<C-u>", "<ESC>viwUea")           -- Turn the word under cursor to upper case
map("i", "<C-t>", "<ESC>b~lea")            -- Turn the current word into title case
map("n", "<leader>cd", ":cd %:p:h<CR>")    -- Change to current directory

-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Neogit
map("n", "<C-g>", ":Neogit<CR>", opts)

-- Hop
map("n", "\\", ":HopAnywhere<CR>", opts)
map("n", "<leader>\\", ":HopWord<CR>", opts)

-- Toggleterm
map("n", "<leader>tt", ":ToggleTerm<CR>", opts)

-- Compile mode
map("n", "<leader>cc", ":Compile<CR>", opts)

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})

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

-- Harpoon
local harpoon = require("harpoon")

harpoon:setup()

map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "<C-h>", function() harpoon:list():select(1) end)
map("n", "<C-j>", function() harpoon:list():select(2) end)
map("n", "<C-k>", function() harpoon:list():select(3) end)
map("n", "<C-l>", function() harpoon:list():select(4) end)
