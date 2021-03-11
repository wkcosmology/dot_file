set termguicolors
lua << EOF
require 'colorizer'.setup {
  'vim';
  'css';
  'lua';
  'javascript';
  html = {
    mode = 'foreground';
  }
}
EOF
