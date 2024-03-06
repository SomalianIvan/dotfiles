require("neotest").setup({
  adapters = {
    require("neotest-minitest"),
  },
})

require("neotest-minitest")({
  test_cmd = function()
    return vim.tbl_flatten({
      "bundle",
      "exec",
      "rails",
      "test",
    })
  end
})

-- key bindings
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { noremap = true, silent = true })
