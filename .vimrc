set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" plugin list
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Yggdroot/indentLine'

"filetype plugin indent on     " required!
"filetype plugin on     " required!

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

autocmd bufnewfile *.py call HeaderPython()
" add generic header to python files
function HeaderPython() 
call setline(1, "#!/usr/bin/env python") 
    call append(1, "# -*- coding: utf-8 -*-") 
    normal G 
    normal o 
    normal o 
endfunction 

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * wincmd l

" mapping keys
map t :TlistToggle<CR>

" code python
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noai
set number
set cursorline
syntax on
