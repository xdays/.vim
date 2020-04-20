" === Vundle section ===
set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim/
" plugin list
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree' " file browser
Plugin 'scrooloose/nerdcommenter' " comment code quickly
Plugin 'vim-scripts/taglist.vim' " generate from tag
Plugin 'Yggdroot/indentLine' " visual indent
Plugin 'sjl/gundo.vim' " visual edit history
Plugin 'junegunn/fzf' " fuzzy search file by keyword
Plugin 'junegunn/fzf.vim' " fuzzy search file by keyword
Plugin 'Valloric/YouCompleteMe' " auto complete
Plugin 'chiel92/vim-autoformat' " auto format
Plugin 'vim-scripts/DrawIt' " draw text flow chart
Plugin 'Raimondi/delimitMate' " auto complete paired char
Plugin 'vim-airline/vim-airline' " status line
Plugin 'vim-airline/vim-airline-themes' " airline themes
Plugin 'vim-scripts/ZoomWin' " Zoom in window and restore layout
Plugin 'tpope/vim-sleuth' "automatically adjusts shiftwidth and expandtab
Plugin 'dense-analysis/ale' " Language server client
Plugin 'vim-syntastic/syntastic' " syntax check
Plugin 'elixir-editors/vim-elixir' " syntax of elixir
Plugin 'pangloss/vim-javascript' " syntax of javascript
Plugin 'elzr/vim-json' " syntax of json
Plugin 'hashivim/vim-terraform' " syntax of terraform
Plugin 'chr4/nginx.vim' " syntax of nginx
call vundle#end()
filetype plugin on     " required!

" Functions
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
    call setline(1, "---")
    call append(1, "title: " . expand("%:t:r"))
    call append(2, "date: ". strftime("%Y-%m-%d"))
    call append(3, "author: admin")
    call append(4, "category: ")
    call append(5, "tags: ")
    call append(6, "slug: " . expand("%:t:r"))
    call append(7, "---")
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
set colorcolumn=101
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" folding
set foldmethod=indent
set foldlevel=99

" disable auto comment
autocmd FileType * set formatoptions-=cro

" mapping keys
nnoremap <Leader>t :term<CR>
nnoremap <Leader>tl :TlistToggle<CR>
nnoremap <Leader>gu :GundoToggle<CR>
nnoremap <Leader>ad a<C-R>=strftime("%c")<CR><Esc>
nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>

" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
vmap <C-c> "+y

" === language setting ===
" filetype plugin indent on
" autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" autocmd FileType ruby setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" === pugin setting section ===
" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf as CtrlP replacement
nmap <C-p> :Files<CR>
nmap <C-g> :Ag<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'vsplit' }

" autoformat
let g:autoformat_autoindent = 0
noremap <Leader>af :Autoformat<CR>
autocmd BufWrite * :Autoformat

" vim-json
let g:vim_json_syntax_conceal = 0

" Nerd Comment
let g:NERDSpaceDelims = 1

" zoomwin
nnoremap <silent> <Leader>f :ZoomWin<CR>

" elixir settings
let g:ale_elixir_elixir_ls_release = '~/.lsp/elixir-ls/rel'
let g:ale_linters = { 'elixir': ['elixir-ls'] }

" terraform setting
let g:terraform_fmt_on_save=1
