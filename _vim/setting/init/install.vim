"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
  
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree'

" jellybeans
NeoBundle 'nanotech/jellybeans.vim'

call neobundle#end()
" Required:
filetype plugin indent on

NeoBundleCheck
"-------------------------
" End Neobundle Settings.
"-------------------------
