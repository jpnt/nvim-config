require("nvim-treesitter.configs").setup {
  -- A list of parser names
  ensure_installed = { "lua", "vim", "c", "rust" },

  -- Install parsers synchronously
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
