syntax enable 

set background=dark
set t_Co=265
colorscheme solarized

" Change colour of all columns past 79
let &colorcolumn=join(range(80,999),",")

" Set <F8> key to toggle between light and dark backgrounds
map <F8> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
