local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false
  },
}
-- Use this for C/C++/Rust
--dap.configurations.c = dap.configurations.cpp
--dap.configurations.rust = dap.configurations.cpp

dap.configurations.rust = {
  lldb
}
