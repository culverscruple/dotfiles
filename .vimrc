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
Plugin 'tpope/vim-repeat'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" " Put your non-Plugin stuff after this line


syntax enable 
set incsearch
" Indents
set autoindent
" Indents = 4 characters
set shiftwidth=4

" Tabs
" Tab = 4 characters
set tabstop=4
" On pressing tab, insert space characters
set expandtab

set modeline

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Folding
set foldmethod=indent
"In normal mode, press Space to toggle the current fold open/closed.
"However, if the cursor is not in a fold, move to the right (the default
"behavior)
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"set foldtext=v:folddashes
"set foldtext=substitute(getline(v:foldstart),'\\/\\*\\*.*','\\/\\/','g'
set foldtext='\ '
"function! FoldText()
"  let l:lpadding = &fdc
"  redir => l:signs
"    execute 'silent sign place buffer='.bufnr('%')
"  redir End
"  let l:lpadding += l:signs =~ 'id=' ? 2 : 0
"
"  if exists("+relativenumber")
"    if (&number)
"      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
"    elseif (&relativenumber)
"      let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
"    endif
"  else
"    if (&number)
"      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
"    endif
"  endif
"
"  " expand tabs
"  let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
"  let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')
" 
"  let l:info = ' (' . (v:foldend - v:foldstart) . ')'
"  let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
"  let l:width = winwidth(0) - l:lpadding - l:infolen
"   
"  let l:separator = ' … '
"  let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
"  let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
"  let l:text = l:start . ' … ' . l:end
"  
"  return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
"endfunction

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

