execute 'source ~/.config/nvim/vimplug.vim'
execute 'source ~/.config/nvim/keymapping.vim'
" loading vim files after
for file in split(glob('~/.config/nvim/plugin/*.vim'), '\n')
  execute 'source ' file
endfor
" loading lua files after
for file in split(glob('~/.config/nvim/lua/*.lua'), '\n')
  execute 'luafile ' file
endfor
colorscheme moonfly
