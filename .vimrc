set nocompatible
filetype off

" Plugins

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'ycm-core/YouCompleteMe'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

filetype plugin on
filetype indent on
set modifiable

" Colors

colorscheme purify

set background=dark

let g:Hexokinase_highlighters = [ 'backgroundfull' ]

syntax on
syntax enable

" Airline

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='purify'

" Lightline

let g:lightline = {
      \ 'colorscheme': 'purify',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gap' ], [ 'fugitive', 'filename' ], [ 'gap' ], [ 'readonly', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'gap' ], [ 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gap' ], [ 'fugitive', 'filename' ], [ 'gap' ], [ 'readonly', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'gap' ], [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'RO',
      \   'modified': 'Mod',
      \   'filetype': 'LightlineFileType',
      \   'filename': 'LightlineFileName',
      \   'mode': 'LightlineMode',
      \ },
      \ 'component': {
      \   'absolutepath': '%f',
      \   'lineinfo': '%P  %l/%L:%c',
      \   'paste': '%{&paste?"PASTE":""}',
      \   'gap': '',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ [ 'close' ] ],
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },

"      \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
"      \ 'subseparator': { 'left': '▒', 'right': '░' },

"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },

"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },

"      \ 'separator': { 'left': '▓░', 'right': '░▓'  },
"      \ 'subseparator': { 'left': '▓░', 'right': '░▓'  },

"      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"  },
"      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"  },

function! Mod()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '[+] ' : &modifiable ? '' : ''
endfunction

function! RO()
  return &ft !~? 'help\|vimfiler' && &readonly ? ' ' : ''
endfunction

function! LightlineFugitive()
  try
	if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
	  let mark = ' '
	  let branch = FugitiveHead()
	  return branch !=# '' ? mark.branch : ''
	endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileName()
let l:filePath = expand('%')
    if winwidth(0) > 25
        return l:filePath
    else
        return pathshorten(l:filePath)
    endif
endfunction

function! LightlineFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction"

let g:Powerline_symbols = 'fancy'
let g:webdevicons_enable_lightline_statusline = 1
let g:lightline#bufferline#show_number = 0
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unnamed = '[New File]'
let g:lightline#bufferline#number_separator = ' '
let g:lightline#bufferline#more_buffers = '...'
let g:lightline#bufferline#modified = ' [+]'
let g:lightline#bufferline#read_only = ' '
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#shorten_path = 0

" Remaps

let mapleader = " "

vnoremap <silent><leader>y y:call ClipboardYank()<CR>
vnoremap <silent><leader>d d:call ClipboardYank()<CR>
nnoremap <silent><leader>p :call ClipboardPaste()<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

map <leader>cd :cd %:p:h<cr>:pwd<CR>
imap jj <Esc>
map <leader>ww :wq!<CR>
map <leader>pp :setlocal paste!<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-u> :UndotreeToggle<CR>
map <C-f> :Files!<CR>


" Basic Settings

set clipboard=unnamedplus

set number
set relativenumber

set display+=lastline
set modeline
set modelines=5

set confirm

set matchpairs+=<:>

set gdefault

set laststatus=2
set showtabline=2
set guioptions-=e

set viminfo='100,<9999,s100

set cursorline
set cursorcolumn
"set signcolumn=yes

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4
set softtabstop=4

set linebreak
set tw=500

set autoindent
set smartindent
set wrap
set nostartofline

set nobackup
set nowb
set noswapfile
set undofile
set undodir=~/.vim/undodir

set encoding=utf-8
set fileencoding=utf-8

set ffs=unix,dos,mac

set noshowmode

set t_Co=256
set termguicolors

set scrolloff=10
set sidescrolloff=5

set splitright
set splitbelow

set mouse=a

let $LANG='en'
set langmenu=en

set path+=,,**

set wildmenu
set wildmode=longest,list,full
set wildchar=<TAB>

set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set noruler
set noshowcmd
set cmdheight=1

set hidden

set backspace=eol,start,indent
set whichwrap+=<,>

set ignorecase
set smartcase

set incsearch

set title
set titlestring=%F

set lazyredraw

set magic

set noshowmatch
set mat=2

set noerrorbells
set visualbell
set t_vb=
set tm=500

set formatoptions-=cro

set history=1000

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 25
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

" Miscellaneous

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window %")

augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdlineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

set autoread
au FocusGained,BufEnter * checktime

let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! <SID>StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun

autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre * :call <SID>StripTrailingWhitespaces()

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
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

function! ClipboardYank()
	call system('xclip -i -selection clipboard', @@)
endfunction

function! ClipboardPaste()
	let @@ = system('xclip -o -selection clipboard')
endfunction

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
