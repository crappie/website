"n for Tabline "
" =============================

" backward delete
set backspace=indent,eol,start

" arrow key
set nocompatible

" =============================
" Function for Stautsline
" =============================
function MyStatusLine()
    let filename = fnamemodify(bufname(''), ':t')
    let ret =' ['. filename .']%m%r%h%w [FORMAT=%{&ff}] [TYPE=%Y] [ASCII=%03.3b] [HEX=%02.2B] [POS=%04l,%04v][%p%%] [LEN=%L]'
    return ret
endfunction

"colors evening

"Color scheme
"
"set t_Co=256
"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm

set background=dark
if has("terminfo")
 set t_Co=16
 set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
 set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable

hi Folded     term=standout ctermbg=black     ctermfg=darkgray gui=bold     guibg=Black    guifg=Yellow 
hi FoldColumn term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey   guifg=DarkBlue
hi Visual     gui=reverse   guifg=#6e4287     guibg=#ffffff    term=reverse ctermfg=red    ctermbg=white

" colors cheme fo diff
hi DiffAdd    cterm=none      ctermfg=10    ctermbg=8         gui=none guifg=black guibg=Green  
hi DiffDelete cterm=none      ctermfg=black ctermbg=8         gui=none guifg=black guibg=Red    
hi DiffChange cterm=none      ctermfg=black ctermbg=LightGrey gui=none guifg=black guibg=Yellow 
hi DiffText   cterm=none      ctermfg=black ctermbg=yellow    gui=none guifg=black guibg=Magenta

highlight Pmenu      cterm=none      ctermfg=black ctermbg=magenta   gui=none guifg=black guibg=Magenta
highlight Search     cterm=underline ctermfg=white ctermbg=blue     gui=none guifg=black guibg=Magenta
highlight IncSearch  cterm=none      ctermfg=black ctermbg=magenta   gui=none guifg=black guibg=Magenta
highlight PmenuSel   cterm=none      ctermfg=black ctermbg=lightgray gui=none guifg=black guibg=Magenta

" highlight statusline cterm=none ctermfg=blue ctermbg=none gui=none guifg=black guibg=Magenta
hi statusline gui=reverse guifg=#6e4287   guibg=#eeeeee term=reverse ctermfg=black ctermbg=white

"au BufNewFile,BufRead *.log set filetype=log
"au BufNewFile,BufRead *.txt set filetype=txt
"au BufNewFile,BufRead *.mac set filetype=sas
"au BufNewFile,BufRead *.toc set filetype=toc
"au BufNewFile,BufRead *.R set filetype=r


" Position the window
if has('gui_running')
        set lines=43 columns=100
        winp 0 0
endif

"set informative statusline;
set statusline=\ [%t%m%r%h%w]\ [FORMAT=\%{&ff}]\[TYPE=\%Y]\[ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=\%04l,\%04v][\%p%%]\ [LEN=\%L]
"set statusline=%!MyStatusLine()
set laststatus=2


"Font Setting
set gfn=-misc-fixed-medium-r-normal-*-15-*-*-*-c-*-iso8859-1
" set gfn=-misc-fixed-medium-r-semicondensed--0-0-75-75-c-0-iso8859-1
" set gfn=9x18

"set tabline

"set spellcheck
"set spell
highlight clear SpellBad
highlight clear SpellCap
highlight SpellBad term=standout cterm=standout ctermbg=red ctermfg=white


"Misc
"set title
set ignorecase
set smartcase
set ruler
set hls
set virtualedit=all

set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

set nocompatible
set number
set showmatch
set incsearch
set mouse-=a
set selection=exclusive

set autoread

"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview
" autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif

"Fold setting
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1


"color printing
function PrintFile(fname)
  call system("lp -d tl13h11 -o job-sheets=standard " . a:fname)
  call delete(a:fname)
  return v:shell_error
endfunc

set printoptions=paper:letter,duplex:off
set printexpr=PrintFile(v:fname_in)

"=========================================================
"================== Key Mapping  =========================
"=========================================================

"mapping clear
imapclear
nmapclear


"Indent whole file
nmap gW mz<CR>gg=G'z

map <S-B> :Re<CR>

"imap <C-H> <Del>
imap <C-F> <ESC>lli
imap <C-B> <ESC>i
imap <C-J> <ESC>ji
imap <C-K> <ESC>ki


"long line
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji

"scroll another window
nmap <F2> <C-W>W<C-e><C-W>W
nmap <F3> <C-W>W<C-y><C-W>W


"misc
map <C-P> "*p
"map <C-K> :set paste<RETURN>i<S-Insert><ESC>:set nopaste<RETURN>

map  <F6> :tabn<RETURN>

vmap <tab> >gv
vmap <C-tab> <gv
vmap <C-C> "*y

nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

noremap <silent> .ind :!~/tools/indsas<CR>
noremap <silent> .bcm :!~/tools/comment<CR>



"use dictionary for auto complete
set complete +=k
set complete -=i
"set dict+=/cygdrive/q/Modeling2/E943960/DOCUMENTATION/dict.txt

"au FileType * exe('setl dict+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')

filetype plugin on

map * :let @/=expand("<cword>")<CR> 
"au BufRead,BufNewFile * execute 'syn case ignore' 
"au BufNewFile,BufRead * execute 'syn match Search "'.@/.'"' 

" paste toggle
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

