local M = {}

function M.setup(opts)
  opts = opts or {}
  opts = vim.tbl_deep_extend("keep", opts, {
    leader = "<Leader>",
    keymaps = {
      jump_down = "<C-j>",
      jump_up = "<C-k>",
      jump_left = "<C-h>",
      jump_right = "<C-l>",
    },
  })
end

return M
