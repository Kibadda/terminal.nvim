# terminal.nvim

simple terminal buffer plugin

## 💡 Installation

install with your favorite plugin manager, e.g. [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "Kibadda/terminal.nvim",
  opts = {},
}
```

## 🔧 Configuration

```lua
{
  ---@type vim.opt
  options = {
    filetype = "term",
    winbar = "",
    statuscolumn = "",
    statusline = "",
    relativenumber = false,
    number = false,
    signcolumn = "no",
    cursorline = false,
  },
  keymaps = {
    ["<C-h>"] = "<C-\\><C-n><C-w>h",
    ["<C-j>"] = "<C-\\><C-n><C-w>j",
    ["<C-k>"] = "<C-\\><C-n><C-w>k",
    ["<C-l>"] = "<C-\\><C-n><C-w>l",
  },
  hooks = {
    termopen = function()
      return true
    end,
    termclose = function()
      return true
    end,
    bufenter = function()
      return true
    end,
  },
  startinsert = true,
  autoclose = true,
  ---@type "split"|"vsplit"
  bang_opens = "split",
}
```

## 🎮 Api

```lua
require("terminal").setup()
```

## 📝 License

MIT License
