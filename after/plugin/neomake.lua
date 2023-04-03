vim.g.neomake_javascript_enabled_makers = {'prettierd'}
vim.g.neomake_typescript_enabled_makers = {'prettierd'}
vim.g.neomake_json_enabled_makers = {'prettierd'}
vim.g.neomake_enable_textmate = 1

vim.api.nvim_exec([[
   augroup NeomakeFormatOnSave
      autocmd!
      autocmd BufWritePre * Neomake
   augroup end
]], true)

  vim.g.neomake_open_list = 2
vim.g.neomake_auto_close = 1

