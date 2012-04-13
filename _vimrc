set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set cursorline
hi CursorLine cterm=bold ctermbg=DarkBlue
set nobackup
let Tlist_Ctags_Cmd = 'ctags'
set autochdir
set tags=./tags
set tags+=tags;/
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
set nowrap
set guioptions+=b
set ts=4
set sw=4
colorscheme blackboard "desert
autocmd FileType python set et
map <c-w><c-t> :WMToggle<cr>
let g:fencview_autodetect = 1   "打开文件时自动识别编码
let g:fencview_checklines = 10 "检查前后10行来判断编码
nnoremap tt :NERDTree<CR>
nnoremap be :BufExplorer<CR>
nnoremap bs :BufExplorerHorizontalSplit<CR>
nnoremap bv :BufExplorerVerticalSplit<CR>
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1
set langmenu=zh_CN.utf-8
if has('win32')
  set gfn=DejaVu_Sans_Mono:h10
else
  set gfn=Deja\ Vu\ Sans\ Mono\ 10
endif

" tab navigation  
nnoremap tl :tabnext<CR>  
nnoremap th :tabprev<CR>  
nnoremap tn :tabnew<CR>  
nnoremap tc :tabclose<CR>  

nnoremap Tl :Tlist<CR>  
map <c-w>tn :tabnew<CR>:WMToggle<cr><c-w><c-w>

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
