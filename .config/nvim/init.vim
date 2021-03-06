set langmenu=en_US.UTF-8
let maplocalleader=","
" time Vim waits until it writes swapfile to disk if nothing typed 
set updatetime=250
if has("wind32")
  set diffexpr=MyDiff()
endif
" time wait for mapped key sequence to complete
" time wait for key code to complete
set timeoutlen=450
augroup R_Specials
    au!
    au FileType R setlocal timeoutlen=600
augroup END
" time wait for mapped key code to complete if different from timeoutlen,
" normally -1 and then equals to timeoutlen
" set ttimeoutlen=-1
set hidden
if has("mac")
  set backspace=indent,eol,start
endif
"the ttymouse option, for example, was removed from Nvim
"(mouse support should work without it). If you use the same vimrc
"for aim and nvim, consider guarding ttymouse in your config file like below:
""if !has('nvim')
""  set ttymouse=xterm2
""endif
"nvim specific configurations{"
""if has('nvim')
""endif
"}
let g:netrw_liststyle = 3
if has("nvim")
else
    set term=screen-256color
endif

"inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
"inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
"inoremap <expr> [ strpart(getline('.'), col('.')-1, 1) == "\]" ? "\<Right>" : "\[\]\<Left>"
"inoremap <expr> { strpart(getline('.'), col('.')-1, 1) == "\}" ? "\<Right>" : "\{\}\<Left>"

nnoremap '. '.zz10<C-E>
" inoremap <C-k> ()<ESC>i  #available key imap
inoremap <C-b> (<Esc>$a)
" correct spelling errors automatically
inoremap <C-l> <Esc>:set spell<CR>a<c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <C-a> <Esc>0i
inoremap <C-e> <Esc>A

" nnoremap <C-L> :nohl<CR>
" :nohl works with searchant in same window; if not same window, need to go the original window
" nnoremap <C-L> :nohl<CR>:windo call feedkeys("\<lt>C-C>\<lt>CR>")<CR>
" repeat 6 times to return to initial window with 2 or 3 splits
" nnoremap <silent> <C-L> :nohl<CR>:call feedkeys("\<lt>C-C>\<lt>C-W>W\<lt>C-C>\<lt>C-W>W\<lt>C-C>\<lt>C-W>W\<lt>C-C>\<lt>C-W>W\<lt>C-C>\<lt>C-W>W\<lt>C-C>\<lt>C-W>W\<lt>C-C>")<CR>
nnoremap <silent> <C-L> :nohl<CR>:call feedkeys("\<lt>C-C>")<CR>:call feedkeys(repeat("\<lt>C-W>W\<lt>C-C>", winnr('$')))<CR>

" space before; . to repeat
nnoremap <LocalLeader>a i<Space><Esc>l
" empty row above; . to repeat
nnoremap <LocalLeader>h O<Esc>j

" nnoremap <LocalLeader>z :FZF<CR> #available key for imap
nnoremap <C-F> :GFiles<CR>
" full screen mode
nnoremap <M-f> :Files<CR>

inoremap <C-F> <Esc>T<Space>hxA
inoremap <C-p> <C-R>=getcwd()<CR>
imap <C-u> <C-x><C-o>
" imap <C-e> <C-x><C-a>
nnoremap <right> gt
nnoremap <left> gT
nmap <down> ]c
nmap <up> [c
nmap n nzz
nmap gg ggzz
"key press interval lt timeoutlen
nnoremap <LocalLeader>t :NERDTreeTabsToggle<CR>11l :set nocursorline<CR>
nnoremap ;s :Startify<CR>
nnoremap ;sv :vspl<CR> :Startify<CR>
nnoremap ;sh :spl<CR> :Startify<CR>
" nnoremap <Tab> <C-W><C-W>

" nnoremap H 0
" nnoremap L $

nnoremap <Space>w :w<CR>
nnoremap <Space>wq :wq<CR>
nnoremap <Space>q :q!<CR>

nnoremap <Space>gs :Gstatus<CR>
nnoremap <Space>gl :Glog<CR>

nnoremap ;;q :qa!<CR>

" don't close the last window
nnoremap <C-w>q <C-w>c
" nnoremap n nzz

" <C-B> mapped in ~/.vim/plugin/increment.vim for increase number 

" auto center{{{
    " set scrolloff{{{
        " option1 - global setting, works also in insert mode {{{
            " set scrolloff=999 
        " }}}
        " option2 - enable in insert mode only {{{
            " autocmd insertenter * :set so=999
            " autocmd insertleave * :set so=0
        " }}}
        " option3 - map key to toggle {{{
            nnoremap <leader>zz :let &scrolloff=999-&scrolloff<cr>
        " }}}
    " }}}
    " alternativly by mapping j and k {{{
        " nnoremap j jzz
        " nnoremap k kzz
    " }}}
" }}}
" " center in insert mode
" inoremap <C-c> <Esc>zza

" delete word before cursor(closed autocompletion popup)
inoremap <C-w> <Esc>bdwi
" close popup and enter
" inoremap <C-w> <Esc>o # use Right Arrow to close popup first then enter
" Del
inoremap <C-x> <DEL>

"scrolljump, minimum number of lines to scroll when cursor gets off the screen
" set scrolljump=20
" set scrolloff=20
"
"available keys for imap
"inoremap <c-_> something
"inoremap <c-g> {<cr>}<esc>o<space><space>

"works properly when syntax auto indent is functioning
inoremap <c-g> {<cr> <cr>}<esc>kllxa

inoremap ;j =
" inoremap kk ;
inoremap ;h +

" visual select cursor word and enter select mode, <CR> or <BS> to delete the
" selected word
nnoremap c *``gn<C-g>

" inoremap qq <esc>
nnoremap <C-j> <PageDown>

" change cwd to open file dir
cmap <C-d> lcd %:p:h <bar> pwd<CR>

"$MYVIMRC
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" open/close quickfix+location window
nnoremap <silent> <leader>qo  :copen<CR>:lopen<CR>
nnoremap <silent> <leader>qc  :cclose<CR>:lclose<CR>

"Vim R Plugin
syntax enable
filetype plugin on
syntax on
filetype indent on

" " meta key mapping
" " NOTE! in Tmux, <M-h/j/k/l> has been mapped to resize pane
" " Terminal mode:
" " tnoremap <Esc> <C-\><C-n> (<Esc> is used in many places, so this mapping is bad)
" " tnoremap <C-v><Esc> <C-\><C-n>
" tnoremap <C-a><Esc> <C-\><C-n>

tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
" Visual mode:
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
" Normal mode:
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

" search within visual selection(no need to cancel selection)
vnoremap <M-/> <Esc>/\%V

"==================================================================================================================================================
"|                                                                    VIM-PLUG   begin >>>>>>                                                     |
"==================================================================================================================================================

" helper function for CONDITIONAL ACTIVATION {{{

" usage eg 1:: Plug 'benekastah/neomake', Cond(has('nvim'))
" usage eg 2:: Plug 'benekastah/neomake', Cond(has('nvim'), { 'on': 'Neomake' })

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"}}}

call plug#begin('~/.local/share/nvim/plugged')
    " if has('nvim')
    "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " else
    "   Plug 'Shougo/deoplete.nvim'
    "   Plug 'roxma/vim-hug-neovim-rpc'
    " endif
    Plug 'ncm2/ncm2-ultisnips'
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'gaalcaras/ncm-R'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-match-highlight'
    Plug 'yuki-ycino/ncm2-dictionary'
    Plug 'w0rp/ale', { 'for' : ['r', 'sh'] }
    Plug 'AndrewRadev/linediff.vim'

    Plug 'morhetz/gruvbox'
    Plug 'w0ng/vim-hybrid'
    Plug 'jalvesaq/Nvim-R'
    Plug 'Yggdroot/indentLine'
    Plug 'scrooloose/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'airblade/vim-gitgutter'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
    Plug 'vim-utils/vim-man'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-ctrlspace/vim-ctrlspace'
    Plug 'vim-latex/vim-latex'
    " Plug 'xuhdev/vim-latex-live-preview'
    Plug 'JamshedVesuna/vim-markdown-preview'
    Plug 'mbbill/undotree'
    Plug 'simnalamburt/vim-mundo'
    Plug 'mileszs/ack.vim'
    Plug 'xuyangy/nerdtree-ag-ack'
    Plug 'davidhalter/jedi-vim'
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    Plug 'majutsushi/tagbar' "requires ctags : http://ctags.sourceforge.net
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'godlygeek/tabular'
    Plug 'tpope/vim-markdown'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'Shougo/vimshell.vim'
    Plug 'szw/vim-maximizer'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'vim-syntastic/syntastic'
    Plug 'easymotion/vim-easymotion'
    Plug 'edkolev/tmuxline.vim', {'branch': 'master'}
    Plug 'tpope/vim-repeat'
    Plug 'xuyangy/vim-quickhl'
    Plug 'chrisbra/vim-diff-enhanced'
    Plug 'Konfekt/FastFold'
    Plug 'xolox/vim-misc'
    Plug 'xuyangy/vim-notes'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'mattn/emmet-vim'
    Plug 'chrisbra/NrrwRgn'
    Plug 'sbdchd/neoformat'
    Plug 'pangloss/vim-javascript'
    Plug 'ternjs/tern_for_vim'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'othree/html5.vim'
    Plug 'rakr/vim-one'
    Plug 'rizzatti/dash.vim'
    Plug 'KeitaNakamura/tex-conceal.vim'
    Plug 'lervag/vimtex'
    Plug '907th/vim-auto-save'
    Plug 'tpope/vim-vinegar'
    Plug 'vim-scripts/genutils'
    Plug 'vim-scripts/multiselect'
    Plug 'junegunn/vim-easy-align'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'timakro/vim-searchant'
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/gv.vim'
    Plug 'junegunn/vim-peekaboo'
    Plug 't9md/vim-choosewin'
    Plug 'weilbith/nerdtree_choosewin-plugin'
    Plug 'liuchengxu/vim-which-key'
    Plug 'mg979/vim-visual-multi'
    Plug 'mox-mox/vim-localsearch'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'luochen1990/rainbow'
    Plug 'rhysd/accelerated-jk'
    Plug 'vim-scripts/CmdlineComplete'
    Plug 'machakann/vim-highlightedyank'

call plug#end()

"==================================================================================================================================================
"|                                                                    VIM-PLUG   end<<<<<<                                                        |
"==================================================================================================================================================

" slow neovim startup due to python provider check {{{
let g:loaded_python_provider = 1
let g:python_host_skip_check=1
let g:python_host_prog = '/Users/xuyangy/.pyenv/shims/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/Users/xuyangy/.pyenv/shims/python3'
" }}}
" deoplete settings  {{{
" let g:ale_emit_conflict_warnings = 0
" let g:deoplete#enable_at_startup = 0
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#auto_completion_start_length = 2
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
" set priority
" call deoplete#custom#source('ultisnips', 'rank', 1000)
" call deoplete#custom#source('_', 'sorters', ['sorter_word'])
" call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
"}}}
"ncm-r settings {{{
let g:cm_completeopt='menu,menuone,noinsert'
"}}}
" ale settings {{{
let g:ale_enabled = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
augroup ALE_R_Mapping
    autocmd!
    " ALEToggle
    autocmd FileType R nnoremap <Leader>a :ALEToggle<CR>
augroup END
" python
let g:ale_python_pylint_options='--argument-naming-style any --variable-naming-style any'
" manual lint by :ALELint
"}}}

" enter to select, close window and insear spaces
" neocomplete and nvim-completion-manager both work
" inoremap <silent> <expr> <CR> <SID>my_cr_function()
function! s:my_cr_function()
  return (pumvisible() ? "\<C-Y>" : "\<CR>")
endfunction

" inoremap <c-u> <c-y> #available key for imap

"curosr shape
if $TERM_PROGRAM =~ "iTerm"
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\""
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_SR = "\<Esc>]50;CursorShape=2\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
endif
" cursor change shape slow
" so1: upon hitting escape to change modes, send successive move-left and move-right
" commands to immediately redraw the cursor
" inoremap <special> <Esc> <Esc>hl "arrow keys becomes ABCD and also function
" keys?
" so2: set noesckeys
" set noesckeys "not working for nvim
set ttimeoutlen=0

set noswapfile
"do not match parenthesis
"by stopping the plugin from loading by making it think that it is already loaded
" let loaded_matchparen = 1

"smartcase for * and #(same as * but reverse)
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>``
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>``

" dict{{{
" set dictionary+=/usr/share/dict/words " too large
" set dictionary+=$HOME/.local/share/nvim/dict/common-words-10000
" set dictionary+=$HOME/.local/share/nvim/dict/common-words
" set dictionary+=$HOME/.local/share/nvim/dict/common-words-ings
set dictionary+=$HOME/.local/share/nvim/dict/common-words-ings-xxl
" }}}

set magic
set foldmethod=marker
set nocompatible
"better command-line completion
set wildmenu
"don't show partial commands in the last line of the screen for smoother
"movement
set noshowcmd
"use case insensitive search, except when susing capital letters
set ignorecase
set smartcase " for search /
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=1
"how many columns a tab counts for, e.g. linux kernel code: 8; Visual Studio: 4
"set tabstop =4
"# of columns to indent with the reindent operation << and >> and automatic
"C-style indentation
set shiftwidth=4
set noshiftround
"columns to use when press Tab in insert mode if softtabstop is less than
"tabstop and expandtab is not set, vim will use a combination of tabs and
"spaces to make up the desired spacing. When tabstop dadf equals softtabstop
"and expandeab is not set, vim always use tab. When expandtab is set, vim
"always use spaces.
set softtabstop=4
set expandtab

"Tab settings according to filetype
augroup FiletypeTabStepAndShiftWidth
    autocmd!
    autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd Filetype json setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd Filetype r setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype tex setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype sh setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
augroup END

"filetype detection
augroup RareFileTypeDetection
    au!
    au BufNewFile,BufRead *.tex set filetype=tex
    au BufNewFile,BufRead *.nf set filetype=nextflow
    " au BufNewFile,BufRead *.nf set syntax=groovy
augroup END
"vertical line for indent with spaces
"nnoremap <Leader>in :set list lcs=tab:\\|\ <CR>


function! LineNumToggle0()
    if(&relativenumber == 1)
        set norelativenumber
        return
    endif
    if(&number == 1)
        set nonumber
    else
        set number
    endif
endfun

function! LineNumToggle()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set nonumber "comment out if want current line number instead of 0
        set relativenumber
    endif
endfunc

nnoremap <Leader>id :IndentLinesToggle<CR>
nnoremap <Leader>ig :IndentGuidesToggle<CR>
nnoremap <Leader>p :set invpaste<CR>
nnoremap <silent> ;u :TagbarClose<CR> :MundoHide<CR> :UndotreeShow<CR><C-W>b:set wrap<CR><C-W>p
nnoremap <silent> ;m :TagbarClose<CR> :UndotreeHide<CR> :MundoShow<CR><C-W>h<C-W>j:set wrap<CR><C-W>k<C-w>l
nnoremap <silent> ;g :GitGutterToggle<CR>

nnoremap ;n :windo call LineNumToggle0()<CR>
" nnoremap ;r :call LineNumToggle()<CR> #available key for nmap; use vim-unimpaired `yor` to toggle
" vnoremap ;r :call LineNumToggle()<CR>gv #available key for vmap;
" nnoremap <Leader>l :set invlist<CR> #available key for nmap; use vim-unimpaired `yol` to toggle
nnoremap ;w :Windo set invwrap<CR>
" nnoremap <silent> ;c :set cursorline<CR> :set lazyredraw<CR> #available key for nmap; use vim-unimpaired `[oc` to turn on; `yoc` to toggle
" nnoremap <silent> ;nc :set nocursorline<CR> :set no lazy redraw<CR> #available key for nmap; use vim-unimpaired `]oc` to turn off; `yoc` to toggle
" nnoremap <silent> ;m :set cursorcolumn<CR> :set lazyredraw<CR> #available key for nmap; use vim-unimpaired `[ou` to turn on; `you` to toggle
" nnoremap <silent> ;nm :set nocursorcolumn<CR> :set nolazyredraw<CR> #available key for nmap; use vim-unimpaired `]ou` to turn off; `you` to toggle
"                                                                                                                           `yox` to toggle both

" when cursor on empty space list all
nnoremap <LocalLeader>l :echo system('ls -l '.expand('<cfile>'))<CR>

" preview html file
" nnoremap ;p :!open -a Safari %<CR><CR>

"whole line to camel case (capital initial char)
nmap <LocalLeader>c :s/\<\(\w\)\(\S*\)/\u\1\L\2/g<CR><C-L>
"selection to camel case (capital initial char)
vmap <LocalLeader>c :s/\%V\<\(\w\)\(\S*\)/\u\1\L\2/g<CR><C-L>
"capitalize initial letter of word
inoremap <C-c> <Esc>b~gi

" replace word under cursor
nnoremap <Space>r :.,$s/<C-R><C-W>/<C-R><C-W>/gc<Left><Left><Left>
vnoremap <Space>r "hy:.,$s/<C-R>h/<C-R>h/gc<Left><Left><Left>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
"highlight search"
set hlsearch
"Highlight search while typing search pattern"
set incsearch
"toggle highlight search, turn of by :set hlsearch
nnoremap <F4> :set hlsearch!<CR>
nnoremap m q
nnoremap q m
nnoremap Q <NOP>
" Use visual bell instead of beeping when doing something wrong
set visualbell
" Display the cursor position on the last line of the screen or in the status
" line of a window
set history=50
" augroup CursorLineColumn
" au WinLeave * set nocursorline "nocursorcolumn
" au WinEnter * set cursorline "cursorcolumn
" set cursorline "cursorcolumn
" augroup END
function! MyDiff()
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



filetype plugin indent on

" colorscheme
" colorscheme sublimemonokai
let g:gruvbox_italic=1
let g:gruvbox_bold=1
" let g:gruvbox_improved_strings=1
colorscheme gruvbox | set background=dark
" colorscheme dracula
" colorscheme oceanic_material
set termguicolors
" dark version
" :colorscheme <scheme_name> to use ad hoc colorscheme
" set filetype specific colorscheme in ~/.vim/ftplugin/<filetype>.vim

" manual change colorscheme (:AirlineToggle twice to fix airline; 
" better to use fzf :Colors command)
cnoremap c0 colorscheme gruvbox<CR>
cnoremap c1 colorscheme sublimemonokai<CR>
cnoremap c2 colorscheme Tomorrow-Night-Eighties<CR>
cnoremap c3 colorscheme dracula<CR>:set termguicolors<CR>
cnoremap c4 colorscheme smyck<CR>
cnoremap c5 colorscheme smyck<CR>:set termguicolors<CR>
cnoremap c6 colorscheme abstract<CR>
cnoremap c7 colorscheme abstract<CR>:set termguicolors<CR>
cnoremap c8 colorscheme srcery<CR>
cnoremap c9 colorscheme edar<CR>:set termguicolors<CR>

cnoremap <c-o> only<CR>


" path for backup files
set backupdir=$HOME/.local/share/nvim/backup
" disable backup
set nobackup

"path for swap files
set directory=$HOME/.local/share/nvim/backup

set listchars=eol:⏎,tab:▸█,trail:␠,extends:>,precedes:<,space:␣,nbsp:⎵
" set listchar color
hi NonText ctermfg=lightcyan guifg=lightcyan
"show space, end-of-line characters ...
"set list
"set spell checking
"set spell
"disable spell checking
"set nospell
"default language for spell checking is US English
"set spelllang=en_us
"set to British English
"set spelllang=en_gb
"turn spell check on for Git commit message"
augroup RareSpellCheckOn
    au!
    autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal spell spelllang=en_us
    "turn spell check on for markdown file"
    autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set spell spelllang=en_us
augroup END
"vertical split, new on right"
set splitright
"horizontal split, new on bottom"
set splitbelow
"status line{
  " Always display the status line, even if only one window is displayed
  set laststatus=2
  " Show full path
  ""set statusline=
  ""set statusline+=%n\ \ 
  ""set statusline+=%F\ \  
  ""set statusline+=%h%m%r%w..
  ""set statusline+=%p
"}
" nerdtree {{{
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeMinimalUI=1
let NERDTreeHighlightCursorline = 0
let NERDTreeWinSize=35
let NERDTreeWinSizeMax=70
let NERDTreeChDirMode=2
" }}}
" vim-nerdtree-syntax-highlight {{{

" " Diable highlighting{
" let g:NERDTreeDisableFileExtensionHighlight = 1

let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

" " Highlight full name(not only icons)
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Highlight folders using exact match
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" Disable uncommon file extensions highlighting
let g:NERDTreeLimitedSyntax = 1

" Customize which file extension to enable
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['nf'] = "CB6F6F"
let g:NERDTreeExtensionHighlightColor['tex'] = "AE403F"
let g:NERDTreeExtensionHighlightColor['py'] = "00AF5F"
let g:NERDTreeExtensionHighlightColor['pyc'] = "9E9E9E"
let g:NERDTreeExtensionHighlightColor['sh'] = "3AFFDB"
let g:NERDTreeExtensionHighlightColor['bash'] = "3AFFDB"
let g:NERDTreeExtensionHighlightColor['vim'] = "8FAA54"
let g:NERDTreeExtensionHighlightColor['json'] = "834F79"
let g:NERDTreeExtensionHighlightColor['R'] = "AE403F"
let g:NERDTreeExtensionHighlightColor['gz'] = "87FFFF"
let g:NERDTreeExtensionHighlightColor['md'] = "D7FF00"
let g:NERDTreeExtensionHighlightColor['txt'] = "808000"
let g:NERDTreeExtensionHighlightColor['csv'] = "d75fff"
let g:NERDTreeExtensionHighlightColor['log'] = "AFAFAF"

" Do not replace netrw when open path
let g:NERDTreeHijackNetrw=0


"}
"}}}
"vim-devicons"{{{
" change the default character when no match found
" let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol ='ƛ'
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol =''
" let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol =''
" let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol =''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" Force extra padding in NERDTree so that the filetype icons line up vertically align
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1 

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderPatternMatching = 1
" enable file extension pattern matching glyphs on folder/directory (disabled
" by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0
" hide brackets around icon
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsOS = 'Darwin'
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_Startify = 1
" custom icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/tests/utf8-markus-kuhn-plus-webdevicon-glyphs.txt
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tex'] =''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nf'] =''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] =''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['csv'] =''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['log'] =''

"}}}
"nerdtree-git-plugin{
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "⎓",
    \ "Staged"    : "➚",
    \ "Untracked" : "✚",
    \ "Renamed"   : "⥀",
    \ "Unmerged"  : "⇪",
    \ "Deleted"   : "♳",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "↻"
    \ }
" not work when vim's current working (cd) path is not Nerdtree root path
" (change by u), CD to solve (or cd first then CD)
"}
"vim-nerdtree-tabs{
let g:nerdtre_tabs_open_on_console=1
"}
"vim-airline{{{
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=2
""let g:airline_section_b='%{strftime("%c")}'
let g:airline_section_y='BN: %{bufnr("%")}'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s|'
let g:airline#extensions#tabline#fnamemod = ':t'
" vim-airline has a tmuxline extension which by default sets airline's color theme onto tmuxline, disable this
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#ctrlspace#enabled = 1
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

"}}}
"vim-airline-themes{
" let g:airline_theme='powerlineish'
let g:airline_theme='alduin'
" let g:airline_theme='papercolor'
" let g:airline_theme='dracula'

" integration with syntastic
let g:airline#extensions#syntastic#enabled = 1
"}
"ctrlp.vim{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"}
"latex <C-J> to delete empty placeholders
"disable placeholders <++>
let g:Imap_UsePlaceHolders=1
let g:Imap_DeleteEmptyPlaceHolders=1

"xml {{{
let g:xml_syntax_folding=1
augroup RareFoldMethodXml
    au!
    au FileType xml setlocal foldmethod=syntax
    "}}}
    "html {{{
    au Filetype html setlocal foldmethod=syntax | highlight link htmlTag htmlTagName  | highlight link htmlEndTag htmlTagName | colorscheme sublimemonokai | AirlineRefresh 
augroup END
"}}}
"refresh NERDTree and CtrlP{{{
nmap <Leader><Leader>r :NERDTreeFocus<CR>R<C-W><C-P>:CtrlPClearCache<CR>
"}}}
" fold on matches
nnoremap \fe :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>
nnoremap \fs :setlocal foldmethod=syntax foldcolumn=2<CR>
nnoremap \fm :setlocal foldmethod=marker foldcolumn=2<CR>

" XML formatter {{{
function! DoFormatXML() range
    " Save the file type
    let l:origft = &ft

    " Clean the file type
    set ft=

    " Add fake initial tag (so we can process multiple top-level elements)
    exe ":let l:beforeFirstLine=" . a:firstline . "-1"
    if l:beforeFirstLine < 0
        let l:beforeFirstLine=0
    endif
    exe a:lastline . "put ='</PrettyXML>'"
    exe l:beforeFirstLine . "put ='<PrettyXML>'"
    exe ":let l:newLastLine=" . a:lastline . "+2"
    if l:newLastLine > line('$')
        let l:newLastLine=line('$')
    endif

    " Remove XML header
    exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

    " Recalculate last line of the edited code
    let l:newLastLine=search('</PrettyXML>')

    " Execute external formatter
    exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --encode UTF-8 --noblanks --format --recover -"

    " Recalculate first and last lines of the edited code
    let l:newFirstLine=search('<PrettyXML>')
    let l:newLastLine=search('</PrettyXML>')
    
    " Get inner range
    let l:innerFirstLine=l:newFirstLine+1
    let l:innerLastLine=l:newLastLine-1

    " Remove extra unnecessary indentation
    exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

    " Remove fake tag
    exe l:newLastLine . "d"
    exe l:newFirstLine . "d"

    " Put the cursor at the first line of the edited code
    exe ":" . l:newFirstLine

    " Restore the file type
    exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

nmap <silent> <leader>x :%FormatXML<CR>
vmap <silent> <leader>x :FormatXML<CR>
" }}}

"Nvim-R"{{{
" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
 inoremap <C-Space> <C-x><C-o>
else
 inoremap <Nul> <C-x><C-o>
endif

" Press the space bar to send lines and selection to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" imap <C-L> <Esc><Plug>RDSendLine<CR>`^a
imap <C-L> <Esc><Plug>RDSendLine`^i
au Filetype R nnoremap <CR> <LocalLeader>rp

let R_in_buffer=0
let R_applescript=0
let R_source = '~/tmux_split.vim'
"}}}
"latex"{{{
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*"
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'"
"use bold text and blue text for Latex Conceal"
augroup TexSpecials
    au!
    au FileType tex nmap ;l :hi Conceal cterm=bold ctermfg=blue<CR>:set concealcursor=vnc<CR>
    au FileType tex setl updatetime=500
    au Filetype tex hi Conceal cterm=bold ctermfg=blue guifg=blue
    au FileType tex set concealcursor=c cole=2
    " ,r to forward search
    au FileType tex map ,r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
augroup END
"}}}
"vim-latex-live-preview"{{{
" let g:livepreview_previewer = 'open -a preview'
let g:livepreview_previewer = 'open -a Skim'
"}}}
"vim-markdown-preview{{{
"GitHub flavoured markdown using Grip
let vim_markdown_preview_github=1
"To display images automatically on buffer write"
let vim_markdown_preview_toggle=2
"change default mapping <C-p> to <C-k> to activate the preview,when above _toggle=0/1"
""let vim_markdown_preview_hotkey='<C-k>'
"remove the rendered .html file after opening it in a brower"
""let vim_markdown_preview_temp_file=1
"}}}
"
"Conceal Latex"{{{
"}}}
"use Ag instead of Ack for ack.vim{{{
""let g:ackprg = 'ag --nogroup --nocolor --column'
"same effect as above settings but will report every match on a single line
let g:ackprg = 'ag --vimgrep'
"}}}
"hi CursorLine cterm=bold
"ctrlspace{{{
if executable("ag")
  let g:CtrlSpaceGlodCommand = 'ag -l --nocolor -g ""'
  " neovim compatibility
  let g:CtrlSpaceDefaultMappingKey = "<C-space> "
endif
let g:CtrlSpaceUseUnicode = 1
hi link CtrlSpaceSearch IncSearch
"}}}
"ack.vim{{{
"prevent grep results to be printed on shell stdout
set shellpipe=>
let g:ack_mappings = {
  \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
  \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }
"}}}
let g:Tex_CompileRule_pdf='pdflatex -shell-escape -interaction=nonstopmode $*'

" netrw copy [absolute path of cursor file] to clipboard
" similar as vinegar's `y.` which yank to register " but not to system clipboard
augroup NetrwSpecials
    au!
    autocmd FileType netrw nnoremap ,f :let @a=expand('<cfile>')<CR>:exe "norm 3G5\|\"by$\<C-o>"<CR>:let @*=@b.'/'.@a<CR> 
augroup END
let g:netrw_sort_by = 'time'
" let g:netrw_sort_direction = 'reverse'
" clear empty NetrwTreeListing after sort
autocmd FileType netrw setl bufhidden=delete

"fugitive{{{
"map .. to go up to parent tree but only for buffers containing a git blob or
"tree"
autocmd User fugitive 
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
"auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}
"jedi-vim{{{
autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"use jedi omni, may be slow, all other neocomplet features are disabled
" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"jedi completion display Doc or not"
set completeopt-=preview
"disalbe auto-select first
let g:jedi#popup_select_first = 1
"disable popup on dot
" let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>d"     " previous definition; use `,g` g:pymode_rope_goto_definition_bind to go to initial definition
let g:jedi#goto_definitions_command = "<leader>g"     " recursive lookups until upper most definition
let g:jedi#usages_command = "<leader>n"
"}}}
"{{{ python-mode
"do not use rope for completion
let g:pymode_rope = 1 " !!need to be enabled for <LocalLeader>r map renaming to work
let g:pymode_rope_completion = 0
let g:pymode_doc = 1
let g:pymode_doc_bind = 'H'

"Linting
let g:pymode_lint = 1
" let g:pymode_lint_checkers = ['pyflakes','pep8','mccabe', 'pylint']
" Auto check on every save
" let g:pymode_lint_unmodified= 1
" Show error message if cursor placed at the error line
let g:pymode_lint_message = 1

let g:pymode_lint_on_write = 1  " lint only when modifiled save
let g:pymode_lint_unmodified = 0  " lint on every save
let g:pymode_lint_on_fly = 0  " lint on leaving insert mode

"support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 0
let g:pymode_syntax_all = 0
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Space error
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = 0

" Don't autofold code
let g:pymode_folding = 0

" skip errors and warnings
" pep8, E501        line too long
" pyflakes, W0401   imort wildcard, i.e. from abc import * 
" E203 whitespace before ':'
let g:pymode_lint_ignore = ["W0401", "E203"]
nnoremap ;ii :let g:pymode_lint_ignore = ["E203", "E221", "C0326", "W0401", "E203", "W0611", "W0612", "W0614", "R0914", "R0912", "C901", "E0401", "C0302", "C0111","C0103","C0413", "E402"]<CR> :w<CR>
nnoremap ;i :let g:pymode_lint_ignore = ["W0401","E203"]<CR> :w<CR>
cnoremap dp let g:pymode_lint_ignore = ["W0401","E203"]<C-E><Left>,

"sort errors by relevance
" let g:pymode_lint_sort = []

"Auto open cwindow (quickfix) if any errors have been found
let g:pymode_lint_cwindow = 1

"symbols
let g:pymode_lint_error_symbol = "✗"
let g:pymode_lint_comment_symbol = "⚠"

" max line length
let g:pymode_options_max_line_length = 99 

" run code
let g:pymode_run = 1
" overwrite jedi-vim <Leader>r for renaming
let g:pymode_run_bind = '<LocalLeader>e' 

" rope refactoring
let g:pymode_rope_rename_bind = '<LocalLeader>r'
" python-mode find definition
let g:pymode_rope_goto_definition_bind = '<LocalLeader>g'
"Command for open window when definition has been found['e', 'new', 'vnew']
let g:pymode_rope_goto_definition_bind_cmd = 'vnew'
" Init Rope project freeze/take long time:
" If rope finds ``.ropeproject`` not in curren dir but in a parent dir, it
" sets the project for all child dirs and the scan may be slow for so many
" dirs and filesystem
" Avoid *.py files in high level dirs e.g $HOME or mounted filesystems
" Run :let pymode_rope=0 locally
" Exit Local List window(error window) first
let g:pymode_rope_lookup_project = 0 " do not scan parent dir for .ropeproject dir

" let g:pymode_python = 'python3'
" python-mode }}}
"indentLine{{{
"diable indentLine by default
let g:indentLine_enabled=0
"when opening these types of files, indentLine is enabled by default
let g:indentLine_fileType = ['c', 'cpp', 'r', 'python', 'tex']
let g:indentLine_showFirstIndentLevel=1
" for indentline color
let g:indentLine_setColors=0
let g:indentLine_faster=1
let g:indentLine_first_char='│'
let g:indentLine_char='┆'
" let g:indentLine_concealcursor=''
hi Conceal ctermfg=165
"}}}
"startify{{{
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
    \ { 'type': 'sessions',  'header': ['   Sessions']        },
    \ ]
let g:startify_bookmarks = [ {'n': '~/.config/nvim/init.vim'}, {'c': '~/.zshrc'},  ]
let g:startify_skiplist = [
            \ '^/tmp',
            \ '^/dev',
            \ escape(fnamemodify($HOME, ':p'), '\').'trash',
            \ escape(fnamemodify($HOME, ':p'), '\').'wkdir/trash',
            \ '^/usr/local/',
            \ 'work/',
            \]
let g:startify_update_oldfiles = 1
let g:startify_custom_header = []
let g:startify_files_number = 70
autocmd User Startified setlocal cursorline
"}}}

"==================================================================================================================================================
"|                                                                    undo history  >>>>>>                                                        |
"==================================================================================================================================================

" undotree config {{{
    let g:undotree_WindowLayout=3
    let g:undotree_DiffpanelHeight=6
    let g:undotree_ShortIndicators=1
    let g:undotree_RelativeTimestamp = 1
    let g:undotree_SetFocusWhenToggle = 1
    let g:undotree_DiffpanelHeight = 20 
    let g:undotree_SplitWidth = 40
    " use persistent undo
    if has("persistent_undo")
        set undodir=~/.local/share/nvim/undodir
        set undofile
    endif
" }}}

" vim-mundo config {{{
    let g:mundo_right = 1
    let g:mundo_preview_bottom = 1
    let g:mundo_preview_height = 10
    let g:mundo_width = 40
    " use persistent undo
    set undofile
    set undodir=~/.local/share/nvim/undodir
" }}}

"==================================================================================================================================================
"|                                                                    undo history  <<<<<<                                                        |
"==================================================================================================================================================
" vimshell{{{
let g:vimshell_interactive_update_time = 10
" open vimshell in a split window
nnoremap <silent> vsp :VimShellPop<CR> 
" open vimshell in current window
nnoremap <silent> vss :VimShell<CR>
"VimShellCreate does not jump to an existing vimshell, but create a new one
nnoremap <silent> vsc :VimShellCreate<CR> 
let g:vimshell_split_command = "vsplit"
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" let g:vimshell_prompt = $USER."% "
" }}}
" vim-maximizer{{{
let g:maximizer_set_default_mapping = 1
let g:maximizer_set_mapping_with_bang = 1
let g:maximizer_default_mapping_key = '<C-T>'
" nnoremap <silent><C-T> :MaximizerToggle<CR>
" vnoremap <silent><C-T> :MaximizerToggle<CR>gv
" inoremap <silent><C-T> <C-o>:MaximizerToggle<CR>
" }}}
"UltiSnips{{{
" let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsExpandTrigger="<C-d>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" let :UltiSnipsEdit to split window
let g:UltiSnipsEditSplit="vertical" 
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
"}}}
" syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" syntax check on open
let g:syntastic_check_on_open = 0
" syntax check on save
let g:syntastic_check_on_wq = 0
" jump to first detected issue when saving or opening a file
let g:syntastic_auto_jump = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_ignore_files = ['\.py$','\m^/usr/include/', '\m\c\.h$']
let g:syntastic_loc_list_height = 5
" checkers
" R
" let g:syntastic_enable_r_lintr_checker = 1
" let g:syntastic_enable_r_svtools_checker = 1
" let g:syntastic_r_checkers = ['lint', 'lintr', 'svtools']
" json
let g:syntastic_json_checkers = ['jsonlint']

" " always dislay the sign column so syntastic/gitgutter will not 'jump'{{{
" autocmd BufEnter * sign define dummy
" autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" " }}}

" }}}
" easymotion{{{
map ;; <Plug>(easymotion-prefix)

nmap w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap e 0<Plug>(easymotion-e)
nmap ;l <Plug>(easymotion-bd-jk)
nmap ;;l <Plug>(easymotion-overwin-line)

nmap s <Plug>(easymotion-s)
xmap s <Plug>(easymotion-s)
nmap <Leader>z <Plug>(easymotion-s2)
xmap <Leader>z <Plug>(easymotion-s2)
nmap <Leader>n <Plug>(easymotion-sn)
xmap <Leader>n <Plug>(easymotion-sn)

nmap ;;s <Plug>(easymotion-s2)
" nmap ;;w <Plug>(easymotion-overwin-w)
nmap ;;f <Plug>(easymotion-bd-f)
vmap ;;f <Plug>(easymotion-bd-f)
" keep vim t: forward stop at left, and T: backwards, stop at right
" use upper case for marking but still small case to jump
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_landing_highlight = 0
let g:EasyMotion_add_search_history = 0
" fix Paste
augroup EMPasteFix
    au!
    au VimEnter * :EMCommandLineNoreMap <C-v> <C-r>+
augroup END

" }}}
" ctrlp{{{
" let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'
" }}}
" tagbar {{{
" nnoremap <silent> ;t :UndotreeHide<CR> :TagbarToggle<CR> :set nocursorline<CR>
" nnoremap <silent> ;t :UndotreeHide<CR> :MundoHide<CR> :TagbarToggle<CR> :set nocursorline<CR>
nnoremap <silent> ;t :UndotreeHide<CR> :MundoHide<CR> :TagbarToggle<CR>
" R support
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }
" curosr in tagbar window when opened
let g:tagbar_autofocus = 1
" close tagbar window after jumping
let g:tagbar_autoclose = 1
" collapse level when open
let g:tagbar_foldlevel = 0
" colors
" variables
highlight TagbarKind  cterm=bold ctermfg=218
" variables inside class function
highlight TagbarNestedKind  cterm=bold ctermfg=125
" function args
highlight TagbarSignature ctermfg=240
highlight TagbarScope  cterm=bold ctermfg=117
" public access/visibility + sign
highlight TagbarVisibilityPublic  cterm=bold ctermfg=118
" " protected access/visibility # sign 
" highlight TagbarVisibilityProtected cterm=bold ctermfg=67
highlight TagbarHighlight ctermbg=125
" 125 "166 "202 "214

" nextflow
let g:tagbar_type_nextflow = {
    \ 'ctagstype' : 'nextflow',
    \ 'kinds'     : [
        \ 'p:Process',
        \ 'c:classes',
        \ 'i:interfaces',
        \ 't:traits',
        \ 'e:enums',
        \ 'm:methods',
        \ 'f:fields:1',
        \ 'g:GlobalVars:1',
        \ 'v:ConditionalVars:1'
    \ ]
\ }

let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0
\ }
let g:tagbar_width = 34
let g:tagbar_autoshowtag = 1
" }}}
" gutter{{{
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
nnoremap ;dd :let g:gitgutter_diff_base='-w --ignore-blank-lines'<CR> :GitGutter<CR>
nnoremap ;d :let g:gitgutter_diff_base=''<CR> :GitGutter<CR>
" }}}
" tmuxline {{{
" let g:tmuxline_theme = 'powerline'
let g:tmuxline_theme = 'vim_statusline_2'
" For g:tmuxline_theme setting to take effect, execute :Tmuxline
nnoremap <LocalLeader>m :Tmuxline<CR>

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#P',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : ["#(cd #{pane_current_path}; basename `git rev-parse --show-toplevel`)", "#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)"],
      \'y'    : "",
      \'z'    : "#{PVENV}"}
" }}}
" quickhl{{{
" respect word boundaries
nmap ;j <Plug>(quickhl-manual-this-whole-word)
" respect WORD boundaries TODO: not working when quoted, e.g. foo="bar" foo='bar'
nmap ;h <Plug>(quickhl-manual-this-whole-bigword)
" dot connected(e.g. person.name); '$' connected(R, e.g. df$col1)
nmap ;q <Plug>(quickhl-manual-this-classish-bigword)
" dot connected(e.g. person.name); '$' connected(R, e.g. df$col1); respect
" WORD boundaries
nmap ;a <Plug>(quickhl-manual-this-whole-classish-bigword)
" don't respect word boundaries
nmap ;k <Plug>(quickhl-manual-this)
" don't respect WORD boundaries
nmap ;H <Plug>(quickhl-manual-this-bigword)
xmap ;j <Plug>(quickhl-manual-this)
nmap ;J <Plug>(quickhl-manual-reset)
xmap ;J <Plug>(quickhl-manual-reset)
let g:quickhl_manual_colors = [
        \ "ctermfg=7   ctermbg=56  guibg=#5f00d7 guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=21  guibg=#0000ff guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=22  guibg=#005f00 guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=2   guibg=#008000 guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=1   guibg=#800000 guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=4   guibg=#000080 guifg=#c0c0c0",
        \ "ctermfg=16  ctermbg=153 guifg=#afd7ff guibg=#000000",
        \ "ctermfg=7   ctermbg=3   guibg=#808000 guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=6   guibg=#008080 guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=50  guibg=#00ffd7 guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=45  guibg=#00d7ff guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=5   guibg=#800080 guifg=#c0c0c0",
        \ "ctermfg=7   ctermbg=16  guibg=#000000 guifg=#c0c0c0",
        \ ]
" }}}
" vim-notes{{{
let g:notes_directories = ['~/MyFile/MyRepos/Notes']
let g:notes_suffix = '.note'
let g:AutoPairsShortcutToggle = '<M-a>'
augroup NotesSpecials
    au!
    au FileType notes setlocal concealcursor=nc
    au FileType notes inoremap <C-p>s ‘’<Left>
    au FileType notes inoremap <C-p>d “”<Left>
    au Filetype notes set completeopt=menu,noinsert,menuone
augroup END
hi notesSingleQuoted ctermfg=69
hi notesDoubleQuoted ctermfg=21
hi notesDoneMarker cterm=bold ctermfg=22
hi notesTodo cterm=bold ctermfg=124
hi notesItalic cterm=italic ctermfg=112
hi notesBold cterm=bold ctermfg=192
hi link notesRealURL Underlined
" }}}
" gruvbox scheme {{{
" fix italic font
set t_ZH=[3m
set t_ZR=[23m
" }}}
" vim-indent-guides{{{
" default mappings <Leader>ig: IndentLinesToggle
" set guide width
let g:indent_guides_guide_size = 0
let g:indent_guides_start_level = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']
" }}}
" NrrwRgn{{{
let g:nrrw_rgn_wdth=30
let g:nrrw_rgn_incr=20
" }}}
" javascript-libraries-syntax{{{
let g:used_javascript_libs = 'underscore,backbone,d3'
" }}}
" neoformat {{{
" nnoremap <Leader>nf :Neoformat<CR>
" }}}
" auto-pairs {{{
" conflict with neocomplete, empty line is added above
let g:AutoPairsMapCR = 0
" for tex file, disable some auto-pairs
augroup AutoPairsSpecials
    au!
    au FileType tex let b:AutoPairs = {'(':')', '[':']', '{':'}'}
augroup END
let g:AutoPairsMapBS = 0  " then <M-;> to re-insert a single if needed
let g:AutoPairsMapCh = 1  " alternative of <BS> 
" fast wrap (insert mode only, keep <c-e> normal mode func)
let g:AutoPairsShortcutFastWrap='<C-e>'
" jump to the next closed pair(<c-p> is used by completion previous)
let g:AutoPairsShortcutJump='<C-p>'
let g:AutoPairsShortcutBackInsert = '<M-;>'
" delete brackets, quotes in pair
let g:AutoPairsMapCh = 1
let g:AutoPairsFlyMode = 0
"}}}
" dash.vim {{{
augroup DashDotVimSpecials
    au!
    autocmd FileType R nmap <silent> <LocalLeader>d <Plug>DashSearch
augroup END
" }}}
" fzf.vim {{{
" set rtp+=/usr/local/opt/fzf
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'right': '~60%' }
let g:fzf_nvim_statusline = 0
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" " match whole words only
" command! -bang -nargs=* Wag call fzf#vim#ag(<q-args>, '--word-regexp', <bang>0)

" :Ag  - Start fzf with hidden preview window and wrap that can be enabled with "?" key
" :Ag! - Start fzf in fullscreen and display the preview window above
" :Ag this|that<CR> will search for whole word this or 'that'
"   Hit Enter to see results
"   Narrow results further with fuzzy by typing more
"   ? to toggle preview
"   Extended Regex, foo.*bar, foo|bar 
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('up:60%:hidden:wrap', '?'),
  \                 <bang>0)

" no filename match
command! -bang -nargs=* Dag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Ag with preview :Rag Basic Regex, so escape like: foo.\*bar, this\|that; ../dirup
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%:wrap'), <bang>0)

" Ag with preview :Pag git root; Basic Regex, so escape like: foo.\*bar, this\|that; add any args, e.g. :Pag --ignore tags foo
command! -bang -nargs=* Pag call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0], 'options': '--delimiter : --nth 4..'}, 'up:60%:wrap'), <bang>0)

" wider for commits
command! -bang Wcommits call fzf#vim#commits({'right': '75%'}, <bang>0)

"Tags {{{
let g:fzf_tags_command = 'ctags -R'
"}}}

" floating fzf window
let $FZF_DEFAULT_OPTS .= ' --layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }
  let win = nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&winhl', 'NormalFloat:Pmenu')
endfunction

" }}}
" vimtex {{{
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_skim_activate = 0
" }}}
" vim-latex {{{
" Change default target to pdf, if not dvi is used
" let g:Tex_DefaultTargetFormat = 'pdf'
 
" Setup the compile rule for pdf to use pdflatex with synctex enabled
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*' 
 
" PDF display rule
let g:Tex_ViewRule_pdf = 'open -a Skim'
 
let g:vimtex_latexmk_progname = 'nvr'
" }}}
" vim-auto-save{{{
let g:auto_save_events=["InsertLeave", "TextChanged"]
autocmd FileType tex let g:auto_save = 1
autocmd FileType tex let g:auto_save_silent = 1

" " Pre/Post save Hooks
" " This will run :TagsGenerate after each save
" let g:auto_save_postsave_hook = 'TagsGenerate'

" This will run AbortIfNewFile function before each save
let g:auto_save_presave_hook = 'call AbortIfNewFile()'
function! AbortIfNewFile()
  if filereadable("%")
    let g:auto_save_abort = 0
  else
    let g:auto_save_abort = 1
  endif
endfunction

" }}}
" vimtex deoplete {{{
" new style
" call deoplete#custom#var('omni', 'input_patterns', {
"           \ 'tex': g:vimtex#re#deoplete
"           \})
" old style
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#omni#input_patterns.tex ='\\(?:'
"       \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
"       \ . '|(text|block)cquote\*?(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
"       \ . '|(for|hy)\w*cquote\*?{[^}]*}(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
"       \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
"       \ . '|hyperref\s*\[[^]]*'
"       \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"       \ . '|(?:include(?:only)?|input|subfile)\s*\{[^}]*'
"       \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"       \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|begin(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|end(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|\w*'
"       \ .')'
" let g:deoplete#omni#input_patterns.tex =g:vimtex#re#deoplete
" }}}
" linediff{{{
" stop the linediff with a `q` # exit multiple diff, move cursor to 2nd buffer
autocmd User LinediffBufferReady nnoremap <buffer> q :LinediffReset<cr><Paste>
" mappings
vnoremap <C-F> :Linediff<CR>
vnoremap <C-A> :LinediffAdd<CR>
vnoremap <C-L> :LinediffLast<CR>
vnoremap <C-S> :LinediffShow<CR>
nnoremap <C-S> :LinediffShow<CR>
" }}}
"vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"}}}
" tex-conceal {{{
let g:tex_conceal="abdmgs"
" }}}
" ncm2{{{

" Use <Tab>/<S-Tab> to select the popup menu:
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use also <Down>/<Up> to select the popup menu:
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"

" vimtex completion
au User Ncm2Plugin call ncm2#register_source({                                
        \ 'name' : 'vimtex',                                                      
        \ 'priority': 9,                                                          
        \ 'subscope_enable': 1,                                                   
        \ 'complete_length': 1,                                                   
        \ 'scope': ['tex'],                                                       
        \ 'mark': 'tex',                                                          
        \ 'word_pattern': '\w+',                                                  
        \ 'complete_pattern': g:vimtex#re#ncm,                                    
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],   
        \ })                        
autocmd BufEnter * call ncm2#enable_for_buffer()
" let g:ncm2#matcher = {
"                 \ 'name': 'combine',
"                 \ 'matchers': [
"                 \     {'name': 'abbrfuzzy', 'key': 'menu'},
"                 \     {'name': 'abbrfuzzy', 'key': 'abbr'},
"                 \     {'name': 'prefix', 'key': 'word'}, 
"                 \ ]}
let g:ncm2#matcher="abbrfuzzy"
let g:cm_matcher = {'module': 'cm_matchers.abbrev_matcher'}
set completeopt+=noinsert,menuone
let g:ncm2#complete_delay = 0
let g:ncm2#popup_delay = 0
call ncm2#override_source('bufword', {'priority': 5})
call ncm2#override_source('dictionary', {'priority': 4})
call ncm2#override_source('ultisnips', {'priority': 8})
call ncm2#override_source('path', {'priority': 1})
call ncm2#override_source('vimtex', {'priority': 3})
call ncm2#override_source('jedi', {'priority': 9})
" let g:ncm2#filter="same_word" " avoid the annoying popup after finish completion

let g:ncm2#complete_length = [[1,2],[5,2]] " sources with priority between 1 and 5 will have the value of 2, and sources with priority >= 5 will have the value of 3
let g:ncm2#popup_limit = 12

" }}}
" ncm2-ultisnips {{{
" use <CR> to expand snippet even if used Up/Donw keys to scroll(without
" selection); if use <C-N>, <C-P> to scroll(with selection)
" g:UltiSnipsExpandTrigger="<C-d>" will expand; if really want to change line,
" press space or <Right> first, then <Enter>
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" function! CleverCR()"{{{
"     call UltiSnips#ExpandSnippetOrJump()
"     if g:ulti_expand_or_jump_res
"         return ""
"     else
"         if pumvisible()
"             return "\<C-Y>"
"         else
"             call feedkeys('')
"             return "\<CR>"
"         endif
"     endif
" endfunction"}}}

" inoremap <silent> <C-B> <C-R>=CleverCR()<CR>

" }}}
" ncm2-match-highlight{{{
let g:ncm2#match_highlight = 'double-struck'
" }}}
" searchant{{{
function! SetSearchCurrent(group, term)
   " store group highlight to variable
   let l:output = execute('hi ' . a:group)
   " store the term value to variable
   let l:termcolor = matchstr(l:output, a:term.'=\zs\S*')
   " if not matching
   if empty(l:termcolor)
       let l:termcolor = "208"
   endif
   " highlight SearchCurrent
   exe 'highlight SearchCurrent ctermbg=' . l:termcolor . ' ctermfg=black'
endfunction
call SetSearchCurrent('IncSearch', 'ctermfg')
" exe 'highlight SearchCurrent ctermbg=' . ReturnHighlightTerm('IncSearch', 'ctermfg') . 'ctermfg=black'
"}}}
" vim-vinegar {{{
" improve netrw `-` to go top; `I` to toggle header `.` to feed file to : `!` to feed filename to :!  `y.` to yank absolute path  `~` to go home
" }}}
" gv.vim {{{
" }}}
" peekaboo {{{
let g:peekaboo_delay = 300
" }}}
" vim-choosewin {{{
nmap . <Plug>(choosewin)
nmap <C-w>. <Plug>(choosewin)
nnoremap ,. .
let g:choosewin_overlay_enable = 1
let g:choosewin_blink_on_land = 1
let g:choosewin_statusline_replace = 0
"
" }}}
" vim-which-key{{{
let g:which_key_map = {}
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'o' : ['<C-W>o'     , 'only-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:which_key_map['f'] = {
      \ 'name' : '+fzf' ,
      \ 'g' : ['GFiles' , 'Git files'] ,
      \ 'f' : ['Files'  , 'cwd files'] ,
      \ 'b' : ['Buffers'  , 'buffers'] ,
      \ 'h' : ['History'  , 'history files'] ,
      \ 't' : ['Tags'  , 'fzf tags'] ,
      \ 'l' : ['Lines'  , 'Lines in loaded buffer'] ,
      \ 'c' : ['Commits'  , 'Git commits'] ,
      \ 'p' : ['execute("Pag ".expand("<cword>"))'  , 'Ag git root'] ,
      \ 'r' : ['Rag'  , 'Ag non filename'] ,
      \ }

call which_key#register('m', "g:which_key_map")

nnoremap <silent> m :<c-u>WhichKey 'm'<CR>
vnoremap <silent> m :<c-u>WhichKeyVisual 'm'<CR>
" }}}
" vim-localsearch {{{
nmap <leader>/ <Plug>localsearch_toggle
" }}}
" semshi {{{
" let g:semshi#excluded_hl_groups = ['local']
let g:semshi#mark_selected_nodes = 2
" }}}
" rainbow {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
        \        'ctermfgs': ['223', '196', '128', '21', '83', '227', '15', '245'],
        \        'separately': {
        \               '*' : {
        \                   'ctermfgs': ['223', '196', '128', '21', '83', '227', '15', '245'],
        \               },
        \               'sh': {},
        \               'nerdtree': 0,
        \        }
        \}
" }}}
"acceleraed-jk {{{
let g:accelerated_jk_enable_deceleration = 1   
let g:accelerated_jk_acceleration_limit = 180
let g:accelerated_jk_acceleration_table = [20,70,100,125,150,160,170,180,185,190,195,200,205,210,215,220,225,230,235,240,245,250]
let g:accelerated_jk_deceleration_table	= [[100, 3], [150, 5], [200, 7], [300, 10], [500, 15], [900, 9999]]
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"}}}
" vim-highlightedyank{{{
let g:highlightedyank_highlight_duration = 1000
" }}}
if has('nvim')
set cursorline
endif
set nolazyredraw
set inccommand=split
" set nowrapscan
"Auto-Reload vimrc when it is changed
augroup reload_vimrc "{
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC " run :AirlineRefresh to re-sync airline colors
augroup END "}
" supress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c
nnoremap <F3> :syntax sync minlines=3<CR>
nnoremap <F4> :syntax sync minlines=10000<CR>
nnoremap <F5> :syntax sync clear<CR>

"syntax debugging {{{
nnoremap <F6> :echo synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>
nnoremap <F7> :echo ("hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">")<cr>
nnoremap <F8> :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>
nnoremap <F9> :exec 'syn list '.synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>
"}}}

" Just like windo, but restore the current window when done.
function! WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinDo(<q-args>)

" Just like Windo, but disable all autocommands for super fast processing.
com! -nargs=+ -complete=command Windofast noautocmd call WinDo(<q-args>)

" Just like bufdo, but restore the current buffer when done.
function! BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call BufDo(<q-args>)

" Capture ex command output
function! RedirOutput(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new", "vnew" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command RedirOutput call RedirOutput(<q-args>)
set number relativenumber
