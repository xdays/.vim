set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" plugin list
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/taglist.vim'

"filetype plugin indent on     " required!
"filetype plugin on     " required!

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
  "                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
autocmd VimEnter * NERDTree
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
