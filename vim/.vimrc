" Source the vimrc file after saving it
"if has("autocmd")
"  autocmd bufwritepost .vimrc source $MYVIMRC
"endif
"let mapleader = ","
"nmap <leader>v :tabedit $MYVIMRC<CR>




" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"windows version
"set listchars=tab:»\ ,eol:¬,trail:



" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
 
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"turn on hidden buffers, allows movement between buffers w/o saving
set hidden

"turn on line numbers
set number

" setup a custom status line, from VIM 7.2 book
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
" set laststatus=0 to disable


"cursor highlighting
set cursorline
" set cursorcolumn


"map over Ctrl-V as clipboard paste and Ctrl-C
"nmap <C-v> "+p
"nmap <C-c> "+y
"nmap <C-x> "+d


" auto sytax on
syn on
set autoindent

"set MAC font
set guifont=Lucida_Console:h10:cDEFAULT


" only for windows platform
"set guifont=Lucida_Console:h10:cDEFAULT

"maximiaze gvim window on startup
"au GUIEnter * simalt ~x

set secure
