
"=====================================================
"Vundle Stuff
"====================================================
let mapleader = "\<Space>"
set nocompatible
filetype off

"set the runtime path to include Vundle and initialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"My bundles
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'christoomey/vim-system-copy'
Plugin 'thoughtbot/vim-rspec'

"All of your Plugins must be added before the following line
call vundle#end()		"required	
filetype plugin indent on 	"required

"=======================================================================================================
" General Vim Settings <from https://github.com/christoomey/dotfiles/blob/master/vim/rcfiles/general>
"=======================================================================================================

set backspace=2      " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set incsearch        " do incremental searching
set laststatus=2     " Always display the status line
set autowrite        " Automatically :write before running commands
set formatoptions-=t " Don't auto-break long lines (re-enable this for prose)

" Rspec
let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"
map <Leader>tf :call RunCurrentSpecFile()<CR>
map <Leader>t :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Display relative line numbers, with absolute line number for current line
set number
set numberwidth=5
set relativenumber

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Don't require saving before closing a buffer
set hidden

" vim:ft=vim

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd_<cr>:wincmd\|<cr>
nnoremap <leader>= :wincmd=<cr>

"Vim Tmux Runner - Connect Vim and tmux to allow running lines & commands

 nnoremap <leader>v- :VtrOpenRunner { "orientation": "v" }<cr>
 nnoremap <leader>sr :VtrOpenRunner {'orientation': 'h', 'percentage': 50} <cr>
 nnoremap <leader>vk :VtrKillRunner<cr>
 nnoremap <leader>va :VtrAttachToPane<cr>
 nnoremap <leader>fr :VtrFocusRunner<cr>
 nnoremap <leader>fg :VtrSendLinesToRunner<cr>
 nnoremap <leader>f :VtrSendFile<cr>

 nnoremap <leader>sq :VtrSendKeysRaw q<cr>
 nnoremap <leader>sd :VtrSendKeysRaw ^D<cr>
 nnoremap <leader>sl :VtrSendKeysRaw ^L<cr>
 nnoremap <leader>sc :VtrSendKeysRaw ^C<cr>
 nnoremap <leader>vs :VtrSendCommandToRunner<space>

"for vim-tmux-runner if using PYTHON 
"let g:VtrStripLeadingWhitespace = 0
"let g:VtrClearEmptyLines = 0
"let g:VtrAppendNewline = 1

