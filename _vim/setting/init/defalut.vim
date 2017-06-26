set backspace=indent,eol,start
set number
set nocompatible
set autoindent
set tabstop=2
set laststatus=2
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
" SuperTab
let g:SuperTabDefaultCompletionType = "context"

let OSTYPE = system('uname')
if OSTYPE == "Darwin\n" 
  :set term=xterm-256color 
	:syntax on 
endif 

