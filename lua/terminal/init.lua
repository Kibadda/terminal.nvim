local helpers = require "terminal.helpers"
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
      escape = "*<ESC>",
    },
    termials = {},
  })

  for _, terminal in ipairs(opts.terminals) do
    vim.keymap.set("n", terminal.lhs, helpers.open_terminal(terminal))
  end
end

function M.keymaps(opts)
  if opts.keymaps.jump_down ~= nil then
    vim.keymap.set({ "t", "n" }, opts.keymaps.jump_down, "<C-\\><C-n><C-w>j")
  end

  if opts.keymaps.jump_up ~= nil then
    vim.keymap.set({ "t", "n" }, opts.keymaps.jump_up, "<C-\\><C-n><C-w>k")
  end

  if opts.keymaps.jump_left ~= nil then
    vim.keymap.set({ "t", "n" }, opts.keymaps.jump_left, "<C-\\><C-n><C-w>h")
  end

  if opts.keymaps.jump_right ~= nil then
    vim.keymap.set({ "t", "n" }, opts.keymaps.jump_right, "<C-\\><C-n><C-w>l")
  end

  if opts.keymaps.escape ~= nil then
    vim.keymap.set("t", opts.keymaps.escape, "*<ESC>")
  end
end

return M
