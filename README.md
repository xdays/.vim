# Overview

This repo details how I config my vim as IDE

# Features

- tree explorer
- file search
- keyward search
- auto format
- undo history
- auto complete
- syntax check
- terminal
- lsp(language server protocol)

# Install

```
git clone https://github.com/xdays/.vim.git ~/.vim
# install vundle plugin manager
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~
ln -s .vim/vimrc .
vim +PluginInstall +qall
```

# Plugin Setup

## External Command

```
brew install fzf the_silver_searcher ctags
```

## YouCompleteMe

```
# install python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

## ALE (Optional)

```
# elixir
git clone https://github.com/elixir-lsp/elixir-ls.git ~/.lsp/elixir-ls/
cd ~/.lsp/elixr-ls/
mix compile
mix elixir_ls.release -o rel
```

# Usage

- `ctrl-p` search file
- `ctrl-g` search keywoard
- `ctrl-e` list buffer
- `ctrl-n` open nerdtree
- `ctrl-c` in visual mode to copy select text into clipboard
- `\t` open terminal in vim window
- `\gu` open gundo
- `\tl` open tag list
- `\f` toggle zoom current window
