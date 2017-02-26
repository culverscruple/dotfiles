set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" " Put your non-Plugin stuff after this line

syntax enable 

set background=dark
set t_Co=265
colorscheme solarized

" Change colour of all columns past 79
let &colorcolumn=join(range(80,999),",")

" Set <F8> key to toggle between light and dark backgrounds
map <F8> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Enable <F5> hotkey to run python code when FileType = python
autocmd FileType python nnoremap <buffer> <F5> :exec '!python3' shellescape(@%, 1)<CR>

" Enable filetype-based indenting
" filetype plugin indent on

let g:SuperTabDefaultCompletionType = "context"
let g:jedi#force_py_version = 3
" get rid of the jedi docstring preview window
autocmd FileType python setlocal completeopt-=preview

