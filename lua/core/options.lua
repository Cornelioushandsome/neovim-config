vim.g.mapleader = " " 
vim.g.maplocalleader = " "
vim.opt.number = true         
vim.opt.relativenumber = true  
vim.opt.tabstop = 2          
vim.opt.shiftwidth = 2         
vim.opt.expandtab = true       
vim.opt.smartindent = true    


vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { silent = true })

vim.keymap.set("n", "<leader>t", ":split | terminal<CR>", { silent = true })

