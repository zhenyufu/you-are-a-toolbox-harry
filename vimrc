"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => What's up
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim is the text editor 
" 
" Based on:
"   https://github.com/amix/vimrc
"   
" TO DO:
"   https://github.com/lifepillar/vim-mucomplete
"   https://github.com/mbrochh/vim-as-a-python-ide
"   https://www.youtube.com/watch?v=YhqsjUUHj6g
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Getting help
" `:help command`
"
"""" Moving around 
" `h j k l` basic navigation  
" `0` go to the start of the line 
" `$` go to the end of the line 
" `gg` go to the start of the file 
" `:$` go to the end of the file 
"
"""" editing 
" `u` undo
" `<C-r>` redo 
" `<C-p>` auto complete the current word 
"
"""" multi line commenting 
" `<C-v` using visual block mode for selecting 
" `I #` capital I and comment character 
" `esc esc`
"
"""" Page navigation
" <C-b> <C-f>
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic source .vimrc on save
autocmd! bufwritepost .vimrc source %

" map leader key , you have only 1000ms (by default) to enter the command following this: ,w does a force write 
let mapleader = ","

" remap to escape `<C-[>` works out of box
imap <leader><leader> <Esc>

" Quickly open a buffer for scribble
map <leader><leader> :e ~/temp.md<cr>

" disable the arrow keys for learning - this also disables scrolling on mac terminal vim 
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

" Indentation with > and < and maintains selection until you're happy with it
vnoremap < <gv 
vnoremap > >gv

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside - this does not always work, use :e
set autoread
" Force write overriding read-only
nmap <leader>w :w!<cr>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set writebackup
set noswapfile

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remap VIM 0 to first non-blank character
map 0 ^

" Toggle paste mode on and off

map <leader>p :setlocal paste!<cr>

" Move visual selected block using ctrl+[jk] 
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on line numbers
set number

" Show the command being typed in the bottom right corner: try gg 
set showcmd

" Keep 10 lines below the cursor when scrolling
set scrolloff=10

" command completion with tab
set wildmenu

" Ignore case when searching lower case, check case when having upper case 
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Visual mode pressing * or # searches for the current selection by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Always show the status line - You don't need `set ruler` with status line 
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ %{''.(&fenc!=''?&fenc:&enc).''}\ \ 
set statusline+=CWD:\ %r%{getcwd()}%h\ \ 
set statusline+=%= "Right Side
set statusline+=Row:\ %l/%L\ (%03p%%)\ Column:\ %c\ 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab, indent, EOL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set autoindent
set smartindent
set wrap "Wrap lines

" Sets the EOL
set fileformats=unix,dos,mac

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigating tabs (a collection of windows acting like a workspace)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" `:tabs` to list all tabsi
" `:tabn` go to next tab
" `:tabp` go to previous tab

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigating windows (way to view a buffer)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Window splits 
" `:split` `:vsplit` create a split 
" `<C-w> directon` to switch windows 
" `<C-w>_`  `<C-w>|` maximise the split 
" `<C-w>+` `<C-w>-` grow or reduce the split 
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigating buffers (file buffer)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Moving to next previous buffers 
map <leader>j :bnext<cr>
map <leader>k :bprevious<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" go to next and previous 
map <leader>sn ]s 
map <leader>sp [s

"whitelist marked misspelling
"map <leader>sa zg

" get suggestions
map <leader>s? z=

" set to underline instead of highlighting
hi clear SpellBad                                                
hi SpellBad cterm=underline                                      
hi clear SpellRare                                               
hi SpellRare cterm=underline                                     
hi clear SpellCap                                                
hi SpellCap cterm=underline                                      
hi clear SpellLocal
hi SpellLocal cterm=underline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


