"==========================================
"" General Settings 基础设置
"==========================================
" 检测文件类型
filetype on
" 针对不同类型的文件采用不同的缩进格式
filetype indent on
" 允许加载不同文件类型的插件
filetype plugin on
" 以下这个命令相当于前面三条命令
" filetype plugin indent on

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

" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}

" 代码折叠功能开启
set foldenable
" 按照缩进折叠
set foldmethod=indent
set foldlevel=99
" 空格键代替折叠命令
:nnoremap <space> za



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
""=========================================
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4 expandtab ai smartindent
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

" zz 命令把当前行设在屏幕中
nnoremap k kzz
nnoremap j jzz
nnoremap p pzz
nnoremap P Pzz
nnoremap G Gzz
nnoremap x xzz
" inoremap <ESC> <ESC>zz
nnoremap <ENTER> <ENTER>zz
" 以下三个命令破坏了 delimate 的 shift+tab 功能
" inoremap <ENTER> <ENTER><ESC>zza
" nnoremap o o<ESC>zza
" nnoremap O O<ESC>zza
nnoremap a a<ESC>zza

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

" 新建tab  Ctrl+b
nnoremap <C-b>     :tabnew<CR>
inoremap <C-b>     <Esc>:tabnew<CR>

" 快速添加空格
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>'


" ===========================================
" 积累命令
" ===========================================
" # 往上查找,* 往下查找,n,N分别往两个方向移动
" :set noh 关闭高亮
set hlsearch

" 格式化代码
" gg=G


"一键运行代码
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python3 %"
elseif &filetype == 'html'
            exec "!google-chrome % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc



"==========================================
"" Initial Plugin 加载插件
"==========================================
" 开启语法高亮
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
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
" 自动匹配括号,shift+tab 超好用
Plugin 'raimondi/delimitmate' 
" javascript
" Plugin 'pangloss/vim-javascript'
" 代码补全
Plugin 'SirVer/ultisnips'
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


"NERDTree
" =================================================
nnoremap <silent> <F3> :NERDTree<CR>
" 改变nerdtree的箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeWinSize=25
" vim 启动时自动打开 NERDTree
autocmd VimEnter * NERDTree
" =================================================


"tmhedberg/SimpylFold
" ==================================================
let g:SimpylFold_docstring_preview=1
" ==================================================


"delimitMate
" ==================================================
"for python docstring
au FileType python let b:delimitMate_nesting_quotes = ['"']
"关闭某些类型文件的补全
" au FileType mail let b:delimitMate_autoclose = 0
" ==================================================


"indentLine
" ==================================================
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
" ==================================================


" Youcompleteme
" ===================================================
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
" 跳转命令
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

" js 补全
function! MyTabFunction ()
    let line = getline('.')
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    if strlen(substr) == 0
	return "\<tab>"
    endif
    return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
endfunction
" inoremap <tab> <c-r>=MyTabFunction()<cr>
" ===================================================


" easy-motion
" ====================================================
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
" =====================================================


" scrooloose/nerdcommenter
" ====================================================
" 注释的时候自动加个空格
let g:NERDSpaceDelims=1
" <leader>cc   加注释
" <leader>cu   解开注释
" ===================================================



" 'mattn/emmet-vim'
" ====================================================
" <c-m>, 触发自动补全 
" 修改Emmet的触发键
let g:user_emmet_leader_key='<c-m>'
" 只在html和css文件中起作用
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstal
" =====================================================


" pangloss/vim-javascript
" =====================================================
" javascript 语法高亮
let g:javascript_plugin_jsdoc = 1
" 折叠
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
" ======================================================


"UltiSnips
" ======================================================
"插入模式下直接通过 kk 键来触发UltiSnips的代码块补全
let g:UltiSnipsExpandTrigger="kk"
"<C-f>跳转的到下一个代码块可编辑区
let g:UltiSnipsJumpForwardTrigger="<C-j>"
"<C-b>跳转到上一个代码块可编辑区
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" ======================================================



" " scrooloose/syntastic
" " ====================================================
" let g:syntastic_enable_signs = 1
" let g:syntastic_error_symbol='>>'
" let g:syntastic_warning_symbol='>'
" "总是打开LocationList（相当于QuickFix）窗口，
" "如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
" let g:syntastic_always_populate_loc_list = 1
" "自动打开LocatonList，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，
" "置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
" let g:syntastic_auto_loc_list = 1
" "修改Locaton List窗口高度
" let g:syntastic_loc_list_height = 5
" "打开文件时自动进行检查
" let g:syntastic_check_on_open = 1
" "自动跳转到发现的第一个错误或警告处
" let g:syntastic_auto_jump = 1
" "进行实时检查，如果觉得卡顿，将下面的选项置为1
" let g:syntastic_check_on_wq = 1
" "高亮错误
" let g:syntastic_enable_highlighting=1
" " 支持语言
" let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
" let g:syntastic_javascript_checkers = ['jsl', 'jshint']
" let g:syntastic_html_checkers=['tidy', 'jshint']


" "修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
" function! <SID>LocationPrevious()                       
  " try                                                   
    " lprev                                               
  " catch /^Vim\%((\a\+)\)\=:E553/                        
    " llast                                               
  " endtry                                                
" endfunction                                             
" function! <SID>LocationNext()                           
  " try                                                   
    " lnext                                               
  " catch /^Vim\%((\a\+)\)\=:E553/                        
    " lfirst                                              
  " endtry                                                
" endfunction                                             

" nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>                                      
" nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>

" nmap <silent> sp    <Plug>LocationPrevious              
" nmap <silent> sn    <Plug>LocationNext
" ===========================================================

