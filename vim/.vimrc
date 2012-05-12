

set nocompatible 		" must be first line


" Windows Compatible {
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier. 
if has('win32') || has('win64')
  set runtimepath=$HOME/dotfiles/vim/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
" }

" Source the vimrc file after saving it
"if has("autocmd")
"  autocmd bufwritepost .vimrc source $MYVIMRC
"endif








" Setup Leader Mappings
let mapleader = ","
let maplocalleader = "\\"


" MAPS Setup 
" quickly load myvimrc configuation file
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" mappings: steve losh book
" move current line down
:nnoremap <leader>- ddp
" move current line up
:nnoremap <leader>_ ddkP
" uppercase word in normal mode
:nnoremap <leader><c-u> gUiw

:inoremap jk <esc>

"surround word with double quotes
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

"Shortcut for Ack: :Ack [options] {pattern} [{directory}]
nnoremap <leader>a :Ack

"Wipe trailing white space
nnoremap <leader>W :%s/\s\+$//<cr>

"Set Current Working Directory
:nnoremap <leader>sd :cd %:p:h<cr>

"abbreviations
:abbreviate newday ------------------------------------------------------------------------------------------------------<CR>
:ab meetingnotes --------------------<CR>Meeting Notes<CR>--------------------<CR><CR>A:

:iabbrev ccopy Copyright 2012 Chris Stansbury, all rights reserved.

"common typos
:iab adn and
:iabbrev waht what
:iabbrev tehn then




" TAB Setup for VIM
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


" auto sytax on
syn on

"turn on auto indent
set autoindent

"set case insensiive search
set ignorecase



"SETUP for OS Specific Options in GUI VIM: 
"  listchars:  showing non-printables like space, tab, and line ending
"  fonts
"  screen size when opening 
"url to feature list: http://vimdoc.sourceforge.net/htmldoc/eval.html#feature-list
if has("gui_running")
    if has("win32") || has("win64")
        "windows version
        set listchars=tab:»\ ,eol:¬,trail:•
        " only for windows platform
        set guifont=Lucida_Console:h10:cDEFAULT

        "maximiaze gvim window on startup
        au GUIEnter * simalt ~x

    elseif has("unix") || has("macunix")

        " Use the same symbols as TextMate for tabstops and EOLs
        set listchars=tab:â–¸\ ,eol:Â¬
        "set MAC font
        "set guifont=Monaco:h12
        set guifont=Courier\ New:h16
        
        "set full screen mode, url: http://amix.dk/blog/post/19403
        set fuoptions=maxvert,maxhorz
        au GUIEnter * set fullscreen
    end
end


"set default Netrw view to Tree Listing
let g:netrw_liststyle= 3




"required for pathogen
call pathogen#infect()
syntax on
filetype plugin indent on

"require for Align plugin for vim
set nocp
filetype plugin on

color wombat        "Set color scheme wombat, located on colors directory

set secure

