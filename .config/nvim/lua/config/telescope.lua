local builtin = require('telescope.builtin')

-- basic mapping for telescope, ( space + p ) for explorer
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- search directory for string  |  requires ripgrep
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Search  :  ") });
end)

require("telescope").setup {
	defaults = {
		layout_config = {
			center = {
				preview_cutoff = 120,
			},
		},
	},
	extensions = {
		file_browser = {
			-- theme = "",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
}
require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap(
  "n",
  "<space>e",
  ":Telescope file_browser<Cr>",
  { noremap = true }
)
