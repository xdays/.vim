set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim/

" plugin list
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'Yggdroot/indentLine'
call vundle#end()

filetype plugin on     " required!

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
    call append(1, "// -*- coding: utf-8 -*-") 
    normal G 
    normal o 
    normal o 
endfunction 

autocmd bufnewfile *.sh call HeaderShell()
" add generic header to python files
function HeaderShell() 
call setline(1, "#!/bin/sh") 
    call append(1, "# -*- coding: utf-8 -*-") 
    normal G 
    normal o 
    normal o 
endfunction 

autocmd bufnewfile *.js call HeaderJavaScript()
" add generic header to python files
function HeaderJavaScript() 
call setline(1, "#!/usr/bin/env node") 
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

" syntax
syntax on

" nobackup
set nobackup
set nowb
set noswapfile

" code python
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noai
set number
set cursorline

" fold
set foldmethod=indent
set foldlevel=99

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
