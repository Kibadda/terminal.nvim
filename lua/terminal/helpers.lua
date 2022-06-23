local M = {}

function M.open_terminal(opts)
  opts = opts or {}
  opts = vim.tbl_extend("keep", opts, {
    vertical = true,
    height = 12,
    program = nil,
  })

  if opts.vertical then
    vim.cmd [[
      vnew
      wincmd L
      set winfixwidth
    ]]
  else
    vim.cmd [[
      new
      wincmd J
      set winfixheight
    ]]
    vim.api.nvim_win_set_height(0, opts.height)
  end

  if opts.program == nil then
    vim.cmd [[term]]
  elseif vim.fn.executable(opts.program) == 1 then
    vim.cmd(string.format("term %s", opts.program))
  else
    vim.notify(string.format("[TermApp] %s is not an executable", opts.program))
  end
end

return M
