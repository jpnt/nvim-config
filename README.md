# nvim-config

Personal neovim configuration

## Goals
- Beautiful coding interface
- Simple and easy to configure
- One language for configuration and plugins
- Minimal use of plugins
- Straight forward plugin management
- Run really fast

## Features
- Organized configuration structure
- Commented configuration files
- Modern plugin manager
- 100% lua configuration and plugins
- Code highlighting
- Fuzzy finder
- Autocompletion and LSP
- Code snippets
- Git features (changes, blame, etc)

## Install
Neovim configuration files are generally placed under the directory:

`$HOME/.config/nvim`

To clone the contents of this repository to that directory use the following command:

```bash
git clone https://github.com/jpnt/nvim-config.git $HOME/.config/nvim --depth=1
```

## Configuration structure
The following UML diagram represents how the configuration is arranged:

```mermaid
graph TD;
    neovim-->init.lua;

    init.lua-->plugins;
    init.lua--->plugin_config;
    init.lua-->options;
    init.lua-->keymaps;

    plugin_config-->lualine;
    plugin_config-->nvim-autopairs;
    plugin_config-->nvim-tree;
    plugin_config-->treesitter;
    plugin_config-->telescope;
    plugin_config-->completion;
    plugin_config-->nvim-lspconfig;
    plugin_config-->neogit;
    plugin_config-->gitsigns;
```

## Plugin list

#### Plugin manager
- lazy

#### Code highlighting
- treesitter

#### Fuzzy finder
- telescope
- plenary (dependency)

#### Autocomplete and LSP
- nvim-lspconfig
- lspkind
- cmp-nvim-lsp
- cmp-buffer
- cmp-path
- cmp-cmdline
- nvim-cmp

#### Code snippets
- LuaSnip
- friendly-snippets

#### Git features
- neogit
- gitsigns

#### QoL improvements
- nvim-tree
- nvim-autopairs
- indent-o-matic

#### Editor appearance
- gruvbox
- nvim-web-devicons
- lualine
