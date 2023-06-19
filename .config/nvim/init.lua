-- =======================
--
--	phant80m's nvim
--
-- =======================


-- requires:

require('binds')
require('plugins')
require('import')

-- set colorscheme 
--
vim.cmd('colorscheme catppuccin')

-- set 
vim.o.hidden = true

-- show floating errors
vim.api.nvim_set_keymap('n', '<space>q', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', { noremap = true })

