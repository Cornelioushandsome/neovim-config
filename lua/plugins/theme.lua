return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",           -- options: latte, frappe, macchiato, mocha
      transparent_background = true,
      term_colors = true,
      integrations = {
        treesitter = true,
        lsp_trouble = true,
        cmp = true,
        gitsigns = true,
        telescope = true,
        notify = true,
        mini = true,
      },
    })

    vim.cmd("colorscheme catppuccin")
    vim.cmd([[
      highlight TelescopeNormal guibg=none
      highlight TelescopePromptNormal guibg=none
      highlight TelescopeResultsNormal guibg=none
]])
    vim.cmd([[
      highlight Normal guibg=none
      highlight NormalFloat guibg=none
      highlight SignColumn guibg=none
]])
    vim.cmd([[
      highlight Pmenu guibg=none
      highlight PmenuSel guibg=none
]])
    vim.cmd([[ highlight LineNr guifg=#f5e0dc ]])
    vim.cmd([[ highlight CursorLineNr guifg=#f5e0dc ]])
    vim.cmd([[
      highlight LineNr guibg=none
      highlight CursorLineNr guibg=none
]])


  end,
}



