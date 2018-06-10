"==========================================
"" General Settings 基础设置
"==========================================

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn


"==========================================
"" Display Settings 展示/排版等界面格式设置
"==========================================

" 突出显示当前列
set cursorcolumn
" 突出显示当前行
set cursorline
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 空格键折叠
:nnoremap <space> za

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on
" autoindenting
set autoindent

" tab相关变更
" " 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop
" 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>


"==========================================
"" FileEncode Settings 文件编码,格式
"==========================================

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8
" 换行符是\n
set fileformat=unix


"==========================================
"" FileType Settings  文件类型设置
"=========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python3 set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai


"==========================================
"" HotKey Settings  自定义快捷键设置
"==========================================
 
" 修改leader键
let mapleader = ','
let g:mapleader = ','

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" 干掉方向键
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" 分屏窗口移动
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]

nnoremap ; :
xnoremap ; :
noremap H ^
noremap L $

inoremap jj <ESC>


" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


" 快速添加空格
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>'
"==========================================
"" Initial Plugin 加载插件
"==========================================


" 开启语法高亮
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
" 自动匹配括号,shift+tab 超好用
Plugin 'raimondi/delimitmate', {'for': ['html','xml']}
" 文件搜索
Plugin 'kien/ctrlp.vim'
" 美化状态栏
Plugin 'lokaltog/vim-powerline'
" 不折叠 docsting
Plugin 'tmhedberg/SimpylFold'
" 文件目录
Plugin 'scrooloose/nerdtree'
" python IDE开发
Plugin 'klen/python-mode'
" 自动补全 html 标签
Plugin 'docunext/closetag.vim', { 'for': ['html', 'xml'] }
" 缩进指示线
Plugin 'yggdroot/indentline'
" vim 多行注释
Plugin 'joom/vim-commentary'
" 自动补全
Plugin 'Valloric/YouCompleteMe'
" 快速移动
Plugin 'easymotion/vim-easymotion'
" 快速注释
Plugin 'scrooloose/nerdcommenter'
" 前端
Plugin 'mattn/emmet-vim'
" 语法检查
Plugin 'scrooloose/syntastic'
" 以缩进为对象
" Plugin 'kana/vim-textobj-indent'
call vundle#end()


"==========================================
"" Theme Settings  主题设置
"==========================================

" theme主题
set background=dark
set t_Co=256
" colorscheme solorrized 必须放在 plugin 之后
colorscheme solarized


"==========================================
"" 插件配置
"==========================================

" python-mode
" 开启警告
let g:pymode_warnings = 0
" 保存文件时自动删除无用空格
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
" 显示允许的最大长度的列
let g:pymode_options_colorcolumn = 1
" 设置QuickFix窗口的最大，最小高度
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
" 使用的是python3 
let g:pymode_python = 'python3'
" 使用PEP8风格的缩进
let g:pymode_indent = 1
" 代码折叠
let g:pymode_folding = 0
let g:pymode_virtualenv = 1
" 使用python-mode运行python代码
let g:pymode_run = 1
let g:pymode_run_bind = '<Leader>r'
" 启用python语法检查
let g:pymode_lint = 1
" 修改后保存时进行检查
let g:pymode_lint_on_write = 1
" 编辑时进行检查
" let g:pymode_lint_on_fly = 0
" let g:pymode_lint_checkers = ['pyflakes', 'pep8']
" Show error message if cursor placed at the error line
let g:pymode_lint_message = 1
" 发现错误时自动打开QuickFix窗口
let g:pymode_lint_cwindow = 1
" 侧边栏显示python-mode相关的标志
" 以下是标志设置
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'


"NERDTree
nnoremap <silent> <F9> :NERDTree<CR>
" 改变nerdtree的箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeWinSize=20
" vim 启动时自动打开 NERDTree
autocmd VimEnter * NERDTree


"tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview=1


"delimitMate
"for python docstring
au FileType python let b:delimitMate_nesting_quotes = ['"']
"关闭某些类型文件的补全
au FileType mail let b:delimitMate_autoclose = 0


"indentLine
let g:indentLine_char='┆'
let g:indentLine_enabled = 1


" Youcompleteme
let g:ycm_confirm_extra_conf=0 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
" ./install.py
let g:ycm_server_python_interpreter = '/usr/bin/python3'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<c-j>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<c-k>']
" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_register_as_syntastic_checker = 0
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter
"GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>


" easy-motion
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)


" scrooloose/nerdcommenter
" 注释的时候自动加个空格
let g:NERDSpaceDelims=1
" <leader>cc   加注释
" <leader>cu   解开注释



" 'mattn/emmet-vim'
" <c-m>, 自动补全,<c-m> 是触发键
" 修改Emmet的触发键
let g:user_emmet_leader_key='<c-m>'
" 只在html和css文件中起作用
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstal



" 'docunext/closetag.vim'
let g:closetag_html_style=1


" scrooloose/syntastic
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
" highlight SyntasticErrorSign guifg=white guibg=black
"
" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
" nnoremap <Leader>sn :lnext<cr>
" nnoremap <Leader>sp :lprevious<cr>"
