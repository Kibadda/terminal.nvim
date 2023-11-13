local M = {}

--- setup plugin with provided options or defaults
---
---@param opts? TerminalConfig
function M.setup(opts)
  require("terminal.config").set(opts)
end

return M
