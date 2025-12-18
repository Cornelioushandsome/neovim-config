return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls"},
      handlers = {
        function(server)
          require("lspconfig")[server].setup({})
        end,
      },
    })

    -- Basic LSP keymaps
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gr", vim.lsp.buf.references)
  end,
}

