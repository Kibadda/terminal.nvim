local M = {}

---@class TerminalConfig
M.options = {
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
  ---@type table<"termopen"|"termclose"|"bufenter", (fun(): boolean)?>
  hooks = {
    termopen = nil,
    termclose = nil,
    bufenter = nil,
  },
  startinsert = true,
  autoclose = true,
  ---@type "split"|"vsplit"
  bang_opens = "split",
}

--- update options
---
---@param opts? TerminalConfig
function M.set(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
