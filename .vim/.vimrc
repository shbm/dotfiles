set nocp  "nocompatible mode
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set sw=4 sts=4 et  "Use 4 spaces for indentation & replace tabs with spaces
set errorbells
set shortmess+=A  "auto OK for swap file exists
set backupdir=$HOME/.vim/.backup
set list
set listchars=tab:··,trail:·,nbsp:· "For white space show ·
set mouse=a  "Enable mouse support
syntax on  "Syntax highlighting ON
set cursorline  "hightlight current line
set gcr=n:blinkon0  "no blinking cursor in normal mode
filetype off
set go-=T  "hide Toolbar
set go-=m  "hide Menu Bar
set go-=r  "hide right scroll bar
set ruler
set showmatch
set undofile
set undodir=$HOME/.vim/undo
set go-=L  "hide left scroll bar
set wildmenu  "bash style command support
set autowrite   "save buffer automatically
set clipboard=unnamed
set linespace=6
set laststatus=2
set relativenumber
set number
set bg=dark
set encoding=utf-8
set bs=indent,eol,start  "proper backspace
set hls is ic scs  "much better search
set incsearch
nmap <silent> <C-n> :noh<CR>

"pathogen
execute pathogen#infect()


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"""""""""""""""""""""""""""""""""""""""""""""'

" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'fatih/vim-go'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-jade'
Plugin 'fugitive.vim'
Plugin 'bling/vim-airline'
Plugin 'junegunn/seoul256.vim'
Plugin 'ervandew/supertab'

call vundle#end()            " required

"VUNDLE END
filetype plugin indent on    " required


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType python nmap <leader>r :!python %<CR>
au FileType c nmap <leader>r :!gcc % && ./a.out && rm a.out<CR>
au FileType cpp nmap <leader>r :!g++ % && ./a.out && rm a.out<CR>

"Font setting
let g:airline_powerline_fonts = 1
set guifont =Monaco\ for\ Powerline\ for\ Powerline\ 11


let g:vim_json_syntax_conceal = 0


"set the default colomn size of NERDTree window
let g:NERDTreeWinSize = 25

"Syntastic shit
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let @/ = ''
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"custom keymapings

"Shift-<Arrow> for VISUAL selection
inoremap <S-Left> <Esc>vh
inoremap <S-Right> <Esc>lvl

let mapleader=","
"j and k are really the next down and up line for long lines
nmap j gj
nmap k gk

"Easy resizing
nmap <C-v> :vertical resize +5<CR>
nmap <C-c> :vertical resize -5<CR>

"\er to reminders.txt & \ev for .vimrc
nmap <silent> <Leader>ev :e /home/shbm/.vimrc<CR>
nmap <Leader>er :e /home/shbm/Documents/reminders.txt<CR>

"C-w in INSERT mode
inoremap <C-w> <Esc><C-w>

"Multiple tab options
nmap <Leader>p :tabp<CR>
nmap <Leader>n :tabn<CR>
nmap <Leader>o :tabnew<CR>
nmap <Leader>q :q<CR>

"Easy saving of buffers
nmap <C-s> :w<CR>
nmap <Leader>q :wq<CR>
imap <C-s> <Esc><C-s>a
vmap <C-s> <Esc>:w<CR>

"C-a to Select all
inoremap <c-a> <Esc>ggVG
nnoremap <c-a> ggVG

"Better use for Right and Left keys moves to begining and end of word
nnoremap <Right> w
nnoremap <Left> b

"one less key for NORMAL commands
nnoremap ; :

"NERDTree shit
"C-b for toggling NERDTree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
inoremap <silent> <C-b> <Esc>:NERDTreeToggle<CR>

"Easy C-v pasting
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-c> "+y

"shift whole lines like in Atom
"bug#01: starts deleting line when reaches top
"bug#02: when at last line moves two lines up
imap <C-Up> <Esc>ddkPi
imap <C-Down> <Esc>ddpi
nmap <C-Up> ddkP
nmap <C-Down> ddp

noremap <F5> <Esc>:source $MYVIMRC<CR>



"Custom functions

"jump to last position in file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \     exe "normal g`\"" |
  \ endif

if has("gui_running")
    set lines=999 columns=999
    set bg=light
    colorscheme solarized
else
    colorscheme seoul256
    let g:seoul256_background = 239
    set bg=dark
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


"Highlight all instances of word under cursor, when idle.
"Useful when studying strange source code.
"Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=100
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
        au!
        au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=100
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

"RemoveWhitespace to delete all white space
function! s:RemoveWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

"Run :RemoveWhitespace to remove end of line white space
command! -range=% RemoveWhitespace call <SID>RemoveWhitespace(<line1>,<line2>)
