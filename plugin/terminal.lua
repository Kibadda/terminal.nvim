if vim.g.loaded_terminal == 1 then
  return
end

vim.g.loaded_terminal = 1

local group = vim.api.nvim_create_augroup("TerminalAutocmdGroup", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  callback = function(args)
    local config = require "terminal.config"

    if not config.options.hooks.termopen or config.options.hooks.termopen() then
      if config.options.options then
        for option, value in pairs(config.options.options) do
          vim.opt_local[option] = value
        end
      end

      if config.options.keymaps then
        for lhs, rhs in pairs(config.options.keymaps) do
          if rhs then
            vim.keymap.set("t", lhs, rhs, { buffer = args.buf })
          end
        end
      end

      if config.options.startinsert then
        vim.cmd.startinsert()
      end
    end
  end,
})

vim.api.nvim_create_autocmd("TermClose", {
  group = group,
  callback = function(args)
    local config = require "terminal.config"

    if vim.bo[args.buf].filetype == (config.options.options.filetype or "term") then
      if not config.options.hooks.termclose or config.options.hooks.termclose() then
        if config.options.autoclose then
          if not vim.api.nvim_buf_is_valid(args.buf) then
            return
          end

          local split = vim.split(args.file, ":")
          if split[#split] == vim.opt.shell:get() then
            vim.cmd.bdelete { bang = true }
          end
        end
      end
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  callback = function()
    local config = require "terminal.config"

    if not config.options.hooks.bufenter or config.options.hooks.bufenter() then
      if config.options.startinsert then
        vim.cmd.startinsert()
      end
    end
  end,
})

vim.api.nvim_create_user_command("TerminalOpen", function(args)
  local config = require "terminal.config"

  local cmd
  if config.options.bang_opens == "vsplit" then
    cmd = args.bang and "vsplit" or "split"
  else
    cmd = args.bang and "split" or "vsplit"
  end
  vim.cmd(("%s | terminal %s"):format(cmd, args.args))
end, {
  nargs = "*",
  complete = "shellcmd",
  bang = true,
  desc = "Opens terminal in (v)split. Use ! to split in other direction",
})
