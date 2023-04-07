-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
--Load NvimTree on startup
vim.cmd("autocmd VimEnter * NvimTreeOpen")

-- Map :Ex to open NvimTree
vim.cmd("nnoremap <silent> <leader>e :NvimTreeToggle<CR>")


-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
