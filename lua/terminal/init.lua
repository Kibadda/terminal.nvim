local M = {}

---@param opts? TerminalConfig
function M.setup(opts)
  local config = require("terminal.config")
  config.set(opts)
end

return M
