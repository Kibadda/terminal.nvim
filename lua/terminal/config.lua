local M = {}

---@class TerminalConfig
M.options = {}

---@param opts? TerminalConfig
function M.set(opts)
  M.options = vim.tbl_deep_extend("force", opts or {})
end

return M
