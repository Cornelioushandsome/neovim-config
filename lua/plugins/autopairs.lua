return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,      -- integrate with Treesitter for smarter pairing
      fast_wrap = {fast_wrap = { map = '<M-e>' }},       -- optional: allows you to wrap selections quickly
    })   
    -- Optional: integrate with nvim-cmp for auto-completing brackets after selecting a function
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}

