require("mason-lspconfig").setup({
  ensure_installed = {
    -- "bashls",
    -- "dockerls",
    "gopls",
    -- "pyright",
    -- "solargraph",
    "lua_ls",
    -- "terraformls",
    "tsserver",
    "ruby_ls",
    "rust_analyzer",

    -- "vimls",
    -- "yamlls",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspsaga').setup({
    ui = {
      kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
  },
  code_action_icon = "💡",
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' ',
    show_file = true,
    file_formatter = ""
  },
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga finder<CR>", { silent = true })
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", {silent = true })
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set({"n", "t"}, "<M-d>", "<cmd>Lspsaga term_toggle<CR>")


require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

-- require("lspconfig").ruby_ls.setup {
--   capabilities = capabilities,
-- }

require("lspconfig").pyright.setup {
  capabilities = capabilities,
}

require("lspconfig").tsserver.setup {
  capabilities = capabilities,
}
require("lspconfig").svelte.setup {
  capabilities = capabilities,
}
require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities,
}
require("lspconfig").sorbet.setup({
  capabilities = capabilities,
})
