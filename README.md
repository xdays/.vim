#简介

这是我的.vim目录，记录我使用vim的过程

#插件列表

* vundle插件管理器
* nerdtree文件浏览器
* taglist代码查看器
* indentLine显示缩进对齐线
* conque 在窗口编辑器里运行Shell
* gundo 修改历史管理
* typescript-vim typescript语法高亮

#使用方法

获取配置文件

    git clone https://github.com/xdays/.vim.git ~/.vim

克隆插件管理

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

建立链接

    cd ~
    ln -s .vim/.vimrc .

更新插件

    vim +PluginInstall +qall
