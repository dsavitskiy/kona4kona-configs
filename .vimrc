set runtimepath+=$HOME/.vim

set nocompatible


filetype indent on		" Enable loading filetype and indentation plugins
filetype plugin on		" Enable loading filetype and indentation plugins

set ruler
set nu
set showcmd				" показывать незавершенные команды
set showmode				" показывать текущий режим
set shortmess+=tToOI			" убираем заставку при старте
set stal=2				" постоянно выводим строку с табами
set tpm=100				" максимальное количество открытых табов

" Status line format
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set rulerformat=%(%l,%c\ %p%%%)		" формат строки состояния строка х столбец, сколько прочитано файла в %


set autochdir				"текущий каталог всегда совпадает с содержимым активного окна
"set dir=/tmp				" Write all tmp files to /tmp
"set dir=~/.vim/swapfiles		"каталог для сохранения своп-файлов
set noswapfile
set nobackup
set history=50				" сохранять 50 строк в истории командной строки
"set mouse=a				" используем мышку
set noex				" не читаем файл конфигурации из текущей директории
set novisualbell
set t_vb=   
set termencoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r
"set ttyfast				"коннект с терминалом быстрый
set t_Co=256				"включаем поддержку 256 цветов
set wildmenu				"красивое автодополнение


set backspace=indent,eol,start		" Allow backspacing over everything in insert mode
set hidden				" Do NOT unload buffer when switch to another
set autoindent
set smartindent				" Auto indent after a {
set ai					" при начале новой строки, отступ копируется из предыдущей
set nowrap				" не разрывать строку при подходе к краю экрана
set linebreak				" переносы между видимыми на экране строками только между словами
set ignorecase				" игнорируем регистр символов при поиске
set incsearch				" показывать первое совпадение при наборе шаблона
set nohlsearch				" подсветка найденного
syntax on				" Switch on syntax highlighting if it wasn't on yet.

" White spaces
set tabstop=8				" размер табуляции
set shiftwidth=4			" число пробелов, используемых при автоотступе
set softtabstop=4			"
"set expandtab				" Expand tab to spaces ?
set list				" Отображаем табуляции и конечные пробелы...
set listchars=tab:→\ ,trail:⋅

set wcm=<Tab>				" WTF? but all work
"set whichwrap=<,>,[,],h,l		" не останавливаться курсору на конце строки
"set autowrite				" автоматом записывать изменения в файл при переходе к другому файлу
set splitbelow				" новое окно появляется снизу
set wak=yes				" используем ALT как обычно, а не для вызова пункта мени
set sessionoptions+=resize,winpos,winsize,blank,buffers,curdir,folds,help,options,tabpages



"-------------------------------------------------------------------------
" :Man man
"-------------------------------------------------------------------------
" Local mappings:
" CTRL-] Jump to the manual page for the word under the cursor.
" CTRL-T Jump back to the previous manual page.

":runtime! ftplugin/man.vim

"-------------------------------------------------------------------------------------------------------
colorscheme kona4kona
if has ("gui_running")
    set antialias
    set noguipty
    set guifont=DejaVu\ Sans\ Mono\ 9
    winpos 200 20
    set lines=60
    set columns=160
endif

"Don't use Ex mode, use Q for formatting
"map Q gq

"---------------------------------------------------------------------------------------------------

"autocmd FileType text setlocal textwidth=80 "устанавливаем ширину в 80 знаков для текстовых файлов
"au FileType c,cc,h,sh au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1) "Подсвечиваем 81 символ и т.д.

"При редактировании файла всегда переходить на последнюю известную
"позицию курсора. Если позиция ошибочная - не переходим.
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


"----------------------------------------------------------------------------

" Некоторые настройки для плагина TagList
let g:Tlist_Show_One_File=1                         " показывать информацию только по одному файлу
let g:Tlist_GainFocus_On_ToggleOpen=1               " получать фокус при открытии
let g:Tlist_Compact_Format=1
let g:Tlist_Close_On_Select=0                       " не закрывать окно после выбора тега
let g:Tlist_Auto_Highlight_Tag=1                    " подсвечивать тег, на котором сейчас находимся

"-----------------------------------------------------------------------------

" Несколько удобных биндингов для С
"au FileType c,cc,h inoremap {<CR> {<CR>}<Esc>O
"au FileType c,cc,h inoremap #m int main(int argc, char * argv[]) {<CR>return 0;<CR>}<CR><Esc>2kO
"au FileType c,cc,h inoremap #d #define 
"au FileType c,cc,h inoremap #e #endif /*  */<Esc>hhi
"au FileType c,cc,h inoremap #" #include ""<Esc>i
"au FileType c,cc,h inoremap #< #include <><Esc>i
"au FileType c,cc,h inoremap #f /* FIXME:  */<Esc>hhi
"au FileType c,cc,h inoremap #t /*TODO:  */<Esc>hhi
"au FileType c,cc,h inoremap ;; <END>;<CR>
"au FileType c,cc,h inoremap " ""<Left>
"au FileType c,cc,h inoremap ' ''<Left>
"au FileType c,cc,h inoremap ( ()<Left>
"au FileType c,cc,h inoremap [ []<Left>
"au FileType c,cc,h inoremap (; ();<CR>
"au FileType c,cc,h inoremap ({ () {<CR>}<Esc>O
"au FileType c,cc,h inoremap /*<Space> /*  */<Esc>3ha

"----------------------------------------------------------------------------------------------"

" Close buffer without saving
"map <Esc><Esc> :q!<CR>

" Auto adding by Tab (use Shift-TAB unstead)
"imap <Tab> <C-N>

" Так получим более полную информацию, чем просто <C-g>
"map <C-g> g<C-g>

" Открытие\закрытие новой вкладки
"imap <C-t>t <Esc>:tabnew<CR>a
"nmap <C-t>t :tabnew<CR>

" Выводим красиво оформленную man-страницу прямо в Vim
" в отдельном окне (см. начало этого файла)
"nmap <S-k> :exe ":Man " expand("<cword>")<CR>


" Запуск проверки правописания
"menu Spl.next ]s
"menu Spl.prev [s
"menu Spl.word_good zg
"menu Spl.word_wrong zw
"menu Spl.word_ignore zG
"imap <C-c>s <Esc>:setlocal spell spelllang=ru,en<CR>a
"nmap <C-c>s :setlocal spell spelllang=ru,en<CR>
"imap <C-c>ss <Esc>:setlocal spell spelllang=<CR>a
"nmap <C-c>ss :setlocal spell spelllang=<CR>
"map  <C-c>sm :emenu Spl.<TAB>


" List of errors
"imap <C-c>l <Esc>:copen<CR>
"nmap <C-c>l :copen<CR>

" Work with vim-projects
"nmap <silent> <C-c>p <Plug>ToggleProject

" work with taglist
"imap <C-c>t <Esc>:TlistToggle<CR>:TlistUpdate<CR>
"nmap <C-c>t :TlistToggle<CR>:TlistUpdate<CR>

" Create new project
"menu NewProj.C++ :!cp -r ~/.vim/mproj/c++/* .<CR>:e ./src/main.cpp<CR>
"menu NewProj.C :!cp -r ~/.vim/mproj/c/* .<CR>:e ./main.c<CR>
"menu NewProj.LaTeX :!cp -r ~/.vim/mproj/latex/* .<CR>:e ./report.tex<CR>
"map <C-c>np :emenu NewProj.<TAB>

"Add existing project to project tree
function! ProjectAdd()
    let s:pproj_name=inputdialog('Enter the name of new project: ')
    if strlen(s:pproj_name) == 0
        return
    endif
    let s:pproject_str_wcwd=s:pproj_name . "=" . getcwd() . " CD=. filter=\"*\" {"
    "for calc this variable now
    silent echo s:pproject_str_wcwd
    Project
    let s:pendln=line("$")
    call setline(s:pendln+1, s:pproject_str_wcwd)
    call setline(s:pendln+2, "}")
    unlet s:pendln
    unlet s:pproject_str_wcwd
    unlet s:pproj_name
endfunction
map <C-c>add :execute ProjectAdd()<CR>

"переключаемся между соответствующими *.c и *.h файлами
"в текущем каталоге (a.vim)
"imap <C-c>sw <Esc>:AT<CR>
"nmap <C-c>sw :AT<CR>

"Генерируем tags файл
"map <C-c>gt :!ctags -a *.c *.h<CR>
"map <C-c>gT :!ctags -Ra *.c *.h<CR>

