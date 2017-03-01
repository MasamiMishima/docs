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

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" ステータスバー表示
NeoBundle 'itchyny/lightline.vim'

" HTML5 のタグに色をつける
NeoBundle 'othree/html5.vim'

" vim-gitgutter install & setting
NeoBundle 'airblade/vim-gitgutter'

" js のシンタックス
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

" エリクサーの設定 
NeoBundle 'elixir-lang/vim-elixir'

" goのシンタックス
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-jp/vim-go-extra'

NeoBundle 'scrooloose/syntastic'

NeoBundle 'ervandew/supertab'

call neobundle#end()
" Required:
filetype plugin indent on



NeoBundleCheck
"-------------------------
" End Neobundle Settings.
"-------------------------
