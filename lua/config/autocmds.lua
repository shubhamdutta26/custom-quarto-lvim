-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufLeave", {
  group = vim.api.nvim_create_augroup("quarto_cleanup", { clear = true }),
  callback = function()
    if vim.bo.buftype == "" and vim.fn.expand("%") == "" and vim.api.nvim_buf_is_loaded(0) then
      if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
        vim.api.nvim_buf_delete(0, { force = true })
      end
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "quarto", "markdown" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})