" === Vundle section ===
set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim/
" plugin list
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree' " file browser
Plugin 'vim-scripts/taglist.vim' " generate from tag
Plugin 'nicoraffo/conque' " run shell in vim
Plugin 'Yggdroot/indentLine' " visual indent
Plugin 'sjl/gundo.vim' " visual edit history
Plugin 'kien/ctrlp.vim' " fuzzy search file
Plugin 'Valloric/YouCompleteMe' " auto complete
Plugin 'vim-scripts/DrawIt' " draw text flow chart
Plugin 'vim-syntastic/syntastic' " syntax check
Plugin 'elixir-editors/vim-elixir' " syntax of elixir
Plugin 'pangloss/vim-javascript' " syntax of javascript
Plugin 'elzr/vim-json' " syntax color of json
Plugin 'Raimondi/delimitMate' " auto complete paired char
Plugin 'scrooloose/nerdcommenter' " comment code quickly
call vundle#end()
filetype plugin on     " required!

" === function section ===
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

" === general setting ===
" common setting
syntax on
set noai nosi
set number
set cursorline
set incsearch
set hlsearch
set wildmenu
set nobackup
set nowb
set noswapfile
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" fold
set foldmethod=indent
set foldlevel=99

" disable auto comment
autocmd FileType * set formatoptions-=cro

" mapping keys
nnoremap t :TlistToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <C-d> a<C-R>=strftime("%c")<CR><Esc>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" === language setting ===
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab 
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" === pugin setting section ===
" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'find %s -type f'

" vim-json
let g:vim_json_syntax_conceal = 0

" Nerd Comment
let g:NERDSpaceDelims = 1
