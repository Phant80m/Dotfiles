map! <S-Insert> <C-V>

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>


vim.cmd([[
  cnoremap <Down> <Nop>
    cnoremap <Left> <Nop>
      cnoremap <Right> <Nop>
        cnoremap <Up> <Nop>
	]])

-- Remove newbie crutches in Insert Mode
vim.cmd([[
  inoremap <Down> <Nop>
    inoremap <Left> <Nop>
      inoremap <Right> <Nop>
        inoremap <Up> <Nop>
	]])

-- Remove newbie crutches in Normal Mode
vim.cmd([[
  nnoremap <Down> <Nop>
    nnoremap <Left> <Nop>
      nnoremap <Right> <Nop>
        nnoremap <Up> <Nop>
	]])

-- Remove newbie crutches in Visual Mode
vim.cmd([[
  vnoremap <Down> <Nop>
    vnoremap <Left> <Nop>
      vnoremap <Right> <Nop>
        vnoremap <Up> <Nop>
	]])
