set nocompatible " be iMproved

filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim/
" plugin list
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'nicoraffo/conque'
Plugin 'Yggdroot/indentLine'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'elzr/vim-json'
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
    call append(1, "# -*- coding: utf-8 -*-") 
    normal G 
    normal o 
    normal o 
endfunction 

autocmd bufnewfile *.sh call HeaderShell()
" add generic header to bash files
function HeaderShell() 
    call setline(1, "#!/bin/bash") 
    call append(1, "# -*- coding: utf-8 -*-") 
    normal G 
    normal o 
    normal o 
endfunction 


nnoremap <C-m> :call HeaderBlog()<CR>i
" add generic header to markdown files
function HeaderBlog() 
    call setline(1, "Title: " . expand("%:t:r")) 
    call append(1, "Date: ". strftime("%Y-%m-%d %H:%M")) 
    call append(2, "Author: admin") 
    call append(3, "Category: ") 
    call append(4, "Tags: ") 
    call append(5, "Slug: " . expand("%:t:r")) 
    normal G 
    normal o 
    normal o 
endfunction 

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * wincmd l

" mapping keys
nnoremap t :TlistToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <C-d> a<C-R>=strftime("%c")<CR><Esc>

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

" general setting
set noai nosi
set number
set cursorline
set incsearch
set hlsearch
set wildmenu
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
let g:vim_json_syntax_conceal = 0

" fold
set foldmethod=indent
set foldlevel=99

" disable auto comment
autocmd FileType * set formatoptions-=cro

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" === pugin setting section ===
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'find %s -type f'
