" vim:ts=8 sw=2:et sta
" $FreeBSD$

set modeline
set nocompatible
set ruler
set nowrap
set bs=2
set nobackup
set nowritebackup
set noswapfile
set tabstop=8
set shiftwidth=2
set sidescroll=1
set showmode
set autoindent
set ttyfast
set visualbell
set laststatus=2
set statusline=%F\ %m%r%h%w\ (%{&ff})\ [Line:%l\ (%p%%)\ /\ Column:%v]
"set nowrapscan
let Tlist_Ctags_Cmd="/usr/local/bin/exctags"
let Tlist_Inc_Winwidth = 0

map! <C-A> <C-O><S-^>
map <C-A> <S-^>
map! <C-E> <C-O><S-$>
map <C-E> <S-$>

map! <Esc>[H <C-O>^
map <Esc>[H ^
map! <Esc>[F <C-O>$
map <Esc>[F $
"screen
map! <Esc>[7~ <C-O>^
map <Esc>[7~ ^
map! <Esc>[8~ <C-O>$
map <Esc>[8~ $

map! <F1> <Esc>:q<CR>
map <F1> :q<CR>
map! <S-F1> <Esc>:q!<CR>
map <S-F1> :q!<CR>
map! <Esc>[23~ <Esc>:q!<CR>
map <Esc>[23~ :q!<CR>
map! <Esc>[Y <Esc>:q!<CR>
map <Esc>[Y :q!<CR>
"screen
map! <Esc>[11~ <Esc>:q<CR>
map <Esc>[11~ :q<CR>

map! <F2> <Esc>:w<CR>
map <F2> :w<CR>
map! <S-F2> <Esc>:w!<CR>
map <S-F2> :w!<CR>
map! <Esc>[24~ <Esc>:w!<CR>
map <Esc>[24~ :w!<CR>
map! <Esc>[Z <Esc>:w!<CR>
map <Esc>[Z :w!<CR>

map! <F3> <Esc>:wq<CR>
map <F3> :wq<CR>
map! <S-F3> <Esc>:wq!<CR>
map <S-F3> :wq!<CR>
map! <Esc>[25~ <Esc>:wq!<CR>
map <Esc>[25~ :wq!<CR>
map! <Esc>[a <Esc>:wq!<CR>
map <Esc>[a :wq!<CR>

if has("gui_running")
  set lines=30
  "set columns=90
  set columns=80
  "set guifont=LucidaTypeWriter:h10
  "set guifont=-*-lucidatypewriter-medium-r-normal-*-11-*-*-*-*-*-*
  "set guifont=Liberation\ Mono\ 9
  "set guifont=Monospace\ 8
  set guifont=DejaVu\ Sans\ Mono\ 8
  set mousehide
  be mswin
  set background=dark
  highlight Normal guibg=black guifg=wheat
  set guioptions-=T
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
else
  set background=dark
endif

if has("syntax")
  fun! ToggleSyntaxHi()
    if (g:synon)
      echo "Syntax: OFF"
      syntax off
      let g:synon = 0
    else
      echo "Syntax: ON"
      syntax on
      let g:synon = 1
    endif
  endfun
  map! <F4> <C-O>:call ToggleSyntaxHi()<CR>
  map <F4> :call ToggleSyntaxHi()<CR>
  syntax on
  let g:synon = 1
endif

"hi Comment gui=NONE
"hi Constant gui=NONE
"hi Special gui=NONE
"hi Identifier gui=NONE
"hi Statement gui=NONE
"hi Preproc gui=NONE
"hi Type gui=NONE
"hi Underlined gui=NONE
"hi Ignore gui=NONE
"hi Title gui=NONE

hi link rubyIdentifier Special

map! <F5> <C-O>:hide bn<CR><C-O>:echo "Next Buffer"<CR>
map <F5> :hide bn<CR>:echo "Next Buffer"<CR>
map! <S-F5> <C-O>:hide bp<CR><C-O>:echo "Previous Buffer"<CR>
map <S-F5> :hide bp<CR>:echo "Previous Buffer"<CR>
map! <Esc>[28~ <C-O>:hide bp<CR><C-O>:echo "Previous Buffer"<CR>
map <Esc>[28~ :hide bp<CR>:echo "Previous Buffer"<CR>
map! <Esc>[c <C-O>:hide bp<CR><C-O>:echo "Previous Buffer"<CR>
map <Esc>[c :hide bp<CR>:echo "Previous Buffer"<CR>

map! <F6> <C-O>:ls!<CR>
map <F6> :ls!<CR>
map! <S-F6> <C-O>:bw<CR><C-O>:echo "Buffer deleted..."<CR>
map <S-F6> :bw<CR>:echo "Buffer deleted..."<CR>
map! <Esc>[29~ <C-O>:bw<CR><C-O>:echo "Buffer deleted..."<CR>
map <Esc>[29~ :bw<CR>:echo "Buffer deleted..."<CR>
map! <Esc>[d <C-O>:bw<CR><C-O>:echo "Buffer deleted..."<CR>
map <Esc>[d :bw<CR>:echo "Buffer deleted..."<CR>

map! <Esc>[31~ <C-O>:let &modified=0<CR><C-O>:echo "Mark Unmodified"<CR>
map <Esc>[31~ :let &modified=0<CR>:echo "Mark Unmodified"<CR>
map! <Esc>[e <C-O>:let &modified=0<CR><C-O>:echo "Mark Unmodified"<CR>
map <Esc>[e :let &modified=0<CR>:echo "Mark Unmodified"<CR>

map! <F8> <C-O>n
map <F8> n
map! <S-F8> <C-O>N
map <S-F8> N
map! <Esc>[32~ <C-O>n
map <Esc>[32~ n
map! <Esc>[f <C-O>N
map <Esc>[f N

map! <C-K> <C-O>dd
map <C-K> dd

fun! ToggleWrapMargin()
  if (&wm)
    echo "Wrap Margin: OFF"
    let &wm = 0
    let &textwidth = 0
  else
    echo "Wrap Margin: ON"
    let &wm = 1
    let &textwidth = 75
  endif
endfun
map ,w :call ToggleWrapMargin()<CR>

fun! ToggleWrapLine()
  if (&wrap)
    echo "Line Wrap: OFF"
    let &wrap = 0
  else
    echo "Line Wrap: ON"
    let &wrap = 1
  endif
endfun
map ,l :call ToggleWrapLine()<CR>

fun! ToggleCase()
  if (&ignorecase)
    echo "Case: Sensitive"
    let &ignorecase = 0
  else
    echo "Case: Insensitive"
    let &ignorecase = 1
  endif
endfun
map ,i :call ToggleCase()<CR>

fun! ReloadCurrent()
  edit %
endfun
map ,r :call ReloadCurrent()<CR>

fun! ShowHelp()
  echo "\n"
  echo "  ************"
  echo "  * Key Map: *"
  echo "  ************"
  echo "      F1 : quit\nShift+F1 : force quit"
  echo "      F2 : save\nShift+F2 : force save"
  echo "      F3 : save/quit\nShift+F3 : force save/quit"
  echo "      F4 : syntax on/off"
  echo "      F5 : next buffer\nShift+F5 : previous buffer"
  echo "      F6 : list buffer\nShift+F6 : delete buffer"
  echo "      F7 : toggle [un]modified\nShift+F7 : toggle [un]modifiable"
  echo "      F8 : search next\nShift+F8 : search previous"
  echo "      F9 : tabstop switching (2/4/8)\nShift+F9 : shiftwidth switching (2/4/8)"
  echo "      F10: Expand Tab switching"
  echo "      ,w : wrap margin on/off"
  echo "      ,l : wrap line on/off"
  echo "      ,i : case sensitive/insensitive search"
  echo "      ,r : reload current file"
  echo "      ,h : show help"
  echo "\n"
endfun
map ,h :call ShowHelp()<CR>

fun! ReadManPages(...)
  if a:0 == 1 || a:0 == 2
    echo ""
    let section = 0
    let man = a:1
    if a:0 == 2
      let section = a:1
      let man = a:2
    endif
    exe 'silent hide e /dev/null/Manual\ Pages\ for\ \"' . man . '\"'
    if section == 0
      exe "silent r!man " . man . " 2> /dev/null | col -b"
    else
      exe "silent r!man " . section . " " . man . " 2> /dev/null | col -b"
    endif
    1
    setlocal filetype=man
    let &modified=0
    setlocal nomodifiable
  else
    echo "Usage: Man section.. entry.."
  endif
endfun
com! -nargs=* Man call ReadManPages(<f-args>)
" 
fun! ReadCompressedFile(...)
  if a:0 == 1
    if a:1 =~? '\.\(g\?z\|bz2\)$' && a:1 !~? '\.tar\.[^\.]\+$'
      let uncomp = "gzip"
      if a:1 =~? 'bz2$'
	let uncomp = "bzip2"
      endif
      exe 'silent hide e /dev/null/' . a:1
      exe "silent r!" . uncomp . " -dc " . a:1
      1
      let &modified=0
      setlocal nomodifiable
    else
      echo "Usage: Zr <compressed file...>"
    endif
  else
    echo "Usage: Zr <compressed file...>"
  endif
endfun

fun! ReadGroff(...)
  if a:0 == 1
    let groff="/usr/bin/groff -Wall -mtty-char -Tascii -man | col -b"
    let uncomp = ""
    if a:1 =~? '\.g\?z$'
      let uncomp = "gzip -dc"
    elseif a:1 =~? '\.bz2$'
      let uncomp = "bzip2 -dc"
    else
      let uncomp = "cat"
    endif
    exe "silent hide enew"
    exe "silent r!" . uncomp . " '" . a:1 . "'" . " | " . groff
    1
    setlocal filetype=man
    let &modified=0
    setlocal nomodifiable
  else
    echo "Usage: Rg <file....>"
  endif
endfun

fun! ToggleModified()
  if &modifiable == 1
    if &modified == 0
      let &modified = 1
      echo "Mark Modified"
    else
      let &modified = 0
      echo "Mark Unmodified"
    endif
  else
    echo "Error: Modifiable is off!"
  endif
endfun
map! <F7> <C-O>:call ToggleModified()<CR>
map <F7> :call ToggleModified()<CR>

fun! ToggleModifiable()
  if &modifiable == 0
    let &modifiable = 1
    echo "Modifiable"
  else
    let &modifiable = 0
    echo "Unmodifiable"
  endif
endfun
map! <S-F7> <C-O>:call ToggleModifiable()<CR>
map <S-F7> :call ToggleModifiable()<CR>
"rxvt
map! <ESC>[31~ <C-O>:call ToggleModifiable()<CR>
map <ESC>[31~ :call ToggleModifiable()<CR>
"cons25
map! <ESC>[e <C-O>:call ToggleModifiable()<CR>
map <ESC>[e :call ToggleModifiable()<CR>

fun! ToggleTabStop()
  if &ts < 2 || &ts >= 8
    silent let &ts = 2
  elseif &ts < 4
    silent let &ts = 4
  elseif &ts < 8
    silent let &ts = 8
  endif
  echo "Tabstop: " . &ts . ", Shiftwidth: " . &sw
endfun

fun! ToggleShiftWidth()
  if &sw < 2 || &sw >= 8
    silent let &sw = 2
  elseif &sw < 4
    silent let &sw = 4
  elseif &sw < 8
    silent let &sw = 8
  endif
  echo "Tabstop: " . &ts . ", Shiftwidth: " . &sw
endfun

map! <F9> <C-O>:call ToggleTabStop()<CR>
map <F9> :call ToggleTabStop()<CR>
map! <S-F9> <C-O>:call ToggleShiftWidth()<CR>
map <S-F9> :call ToggleShiftWidth()<CR>
"rxvt
map! <ESC>[33~ <C-O>:call ToggleShiftWidth()<CR>
map <ESC>[33~ :call ToggleShiftWidth()<CR>
"cons25
map! <ESC>[g <C-O>:call ToggleShiftWidth()<CR>
map <ESC>[g :call ToggleShiftWidth()<CR>

map <C-F9> :echo "Tabstop: " . &ts . ", Shiftwidth: " . &sw<CR>
map <ESC>[s :echo "Tabstop: " . &ts . ", Shiftwidth: " . &sw<CR>
map <ESC>[20^ :echo "Tabstop: " . &ts . ", Shiftwidth: " . &sw<CR>

fun! ToggleExpandTab(...)
  if a:0 == 0
    if &et == 0
      silent let &et = 1
    else
      silent let &et = 0
    endif
  endif
  if &et == 0
    echo "Expand Tab: NO"
  else
    echo "Expand Tab: Yes"
  endif
endfun

map! <F10> <C-O>:call ToggleExpandTab()<CR>
map <F10> :call ToggleExpandTab()<CR>
map! <S-F10> <C-O>:call ToggleExpandTab(0)<CR>
map <S-F10> :call ToggleExpandTab(0)<CR>
"rxvt
map! <ESC>[21~ <C-O>:call ToggleExpandTab()<CR>
map <ESC>[21~ :call ToggleExpandTab()<CR>
map! <ESC>[34~ <C-O>:call ToggleExpandTab(0)<CR>
map <ESC>[34~ :call ToggleExpandTab(0)<CR>
"cons25
map! <ESC>[V <C-O>:call ToggleExpandTab()<CR>
map <ESC>[V :call ToggleExpandTab()<CR>
map! <ESC>[h <C-O>:call ToggleExpandTab(0)<CR>
map <ESC>[h :call ToggleExpandTab(0)<CR>

com! -nargs=* -complete=file Zr call ReadCompressedFile(<f-args>)
com! -nargs=* -complete=file Rg call ReadGroff(<f-args>)

com! -nargs=0 Help :silent hide e $VIMRUNTIME/doc/help.txt

com! -nargs=1 -complete=file Edit :hide edit <args>
com! -nargs=1 -complete=file Open :hide edit <args>

com! Fcd :cd %:p:h
com! Html :ru syntax/2html.vim

"let loaded_gzip = 1

"fun! AlwaysCD()
"  if bufname("") !~ "^ftp://"
"    lcd %:p:h
"  endif
"endfun
"autocmd BufEnter * call AlwaysCD()
