set backspace=indent,eol,start
set number
set nocompatible
set autoindent
set laststatus=2

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
" SuperTab
let g:SuperTabDefaultCompletionType = "context"

let OSTYPE = system('uname')
if OSTYPE == "Darwin\n" 
  :set term=xterm-256color 
	:syntax on 
endif 

