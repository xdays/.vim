# 简介

这是我的.vim目录，记录我使用vim的过程

# 插件列表

* vundle 插件管理器
* nerdtree 文件浏览器
* taglist 代码查看器
* indentLine 显示缩进对齐线
* conque 在窗口编辑器里运行Shell
* gundo 修改历史管理
* ctrlp 文件模糊查找
* YouCompletEme 自动补全
* vim-json json高亮显示
* DrawIt 画文本流程图
* syntastic 代码语法检查工具
* vim-javascript JS语法支持
* vim-elixir Elixir语法支持
* delimitMate 自动补全成对字符
* nerdcommenter 快速注释代码

# 使用方法

获取配置文件

    git clone https://github.com/xdays/.vim.git ~/.vim

克隆插件管理

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

建立链接

    cd ~
    ln -s .vim/.vimrc .

更新插件

    vim +PluginInstall +qall

插件配置

    # install python-dev
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
