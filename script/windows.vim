""" Set options and add mapping such that Vim behaves a lot like MS-Windows Visual Studio
" Maintainer:  Riliumph

""" Set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

""" Backspace
" Backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start   " Use backspace key to erase

" Backspace in Visual mode deletes selection by [_] register
vnoremap <BS> "_d
" Backspace in Normal & Visual mode deletes a char before cursor by [_] register
nnoremap <BS> "_X
""" Delete
nnoremap <Del> "_x

""" CTRL-Z : Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

""" CTRL-X / SHIFT-Del : Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

""" CTRL-C / CTRL-Insert : Copy
" Use [+] register for clipboard
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

""" CTRL-V / SHIFT-Insert : Paste
" Use [+] register for clipboard
noremap <C-V>       "+gP
noremap <S-Insert>  "+gP
noremap! <C-V>      <C-R>+
noremap! <S-Insert> <C-R>+

""" CTRL-A : Select all
noremap  <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

""" CTRL-S : Save file
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

""" CTRL-F : Find character
" Use register [f] to avoid conflict with clipboard
nnoremap <C-f> <ESC>/
vnoremap <C-f> "fy/<C-R>f
nnoremap <silent> <ESC><f3> :set hlsearch!<CR>

""" CTRL-H : Replace character
" Use register [f] to avoid conflict with clipboard
nnoremap <C-h> <ESC>:%substitute/
vnoremap <C-h> "fy:%substitute;<C-R>f;

""" CTRL-Y : Redo (although not repeat); not in cmdline though
noremap  <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

""" CTRL-Tab : Move tab
noremap <C-t> <ESC>:tabnew<CR>

""" CTRL-] : Move between [ and ]
nnoremap <C-]> %
inoremap <C-]>  <C-O>%

""" ALT-Arrow : Move line
" Use register [t], means temporary
nnoremap <M-Up> "tdd<Up>"tP
nnoremap <M-Down> "tdd"tp
vnoremap <M-Up> "tx<Up>"tP`[V`]
vnoremap <M-Down> "tx"tp`[V`]

""""" Below this is a remap of the overwritten keymap.
""" CTRL-Q : Go Visual Mode to do what CTRL-V used to do
noremap <C-Q>  <C-V>

""" Only GUI setting
if has("gui")
  """ Alt-Space : System menu
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
  """ Ctrl-Tab : Move tab
  noremap <C-Tab> gt
  noremap <C-S-Tab> gT
endif

""" CTRL-Tab : Next window
"noremap <C-Tab> <C-W>w
"inoremap <C-Tab> <C-O><C-W>w
"cnoremap <C-Tab> <C-C><C-W>w
"onoremap <C-Tab> <C-C><C-W>w

""" CTRL-F4 : Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

