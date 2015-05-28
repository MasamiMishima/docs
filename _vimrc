" neobundle settings {{{
if has('vim_starting')
  set nocompatible
  "save directory
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
    "runtimepath
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end (install plugin)
" --------------install list-------------------
" neobundle,jellyneans,unite,neomru,neocomplete
" yankround,vimfiler,vim-autoclose,vim-endwise
" vim-easymotion


" neobundle install & setting
NeoBundleFetch 'Shougo/neobundle.vim'

" jellubeans install & setting
NeoBundle 'nanotech/jellybeans.vim'

" unite install & setting
NeoBundle 'Shougo/unite.vim'

" lightline install & settiong
NeoBundle 'itchyny/lightline.vim'

" neomru install & setting
NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }

" vim-autclose instal & setting
NeoBundle 'Townk/vim-autoclose'

" vim-endwise install & setting
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}

" vimproc install & setting
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

" neocomplete install & setting
if has('lua')
    NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'depends' : 'Shougo/vimproc',
        \ 'autoload' : { 'insert' : 1,}
       \ }
endif

" vimfiler install & setting
NeoBundleLazy 'Shougo/vimfiler', {
  \ 'depends' : ["Shougo/unite.vim"],
  \ 'autoload' : {
  \   'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir" ],
  \   'mappings' : ['<Plug>(vimfiler_switch)'],
  \   'explorer' : 1,
  \ }}

" vim-easymoteion install & setting
NeoBundle 'Lokaltog/vim-easymotion'

" vim-fugitive install & setting
NeoBundle 'tpope/vim-fugitive'

" vim-gitgutter install & setting
NeoBundle 'airblade/vim-gitgutter'

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

" unite {{{
  let g:unite_enable_start_insert=1
  nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
  nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
  nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
  nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
  nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
  au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  au FileType unite nmap <silent> <buffer> <ESC><ESC> q
  au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
" }}}

"lighline {{{
" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" lightline.vim
  let g:lightline = {
          \ 'colorscheme': 'landscape',
          \ 'mode_map': {'c': 'NORMAL'},
          \ 'active': {
          \   'left': [
          \     ['mode', 'paste'],
          \     ['fugitive', 'gitgutter', 'filename'],
          \   ],
          \   'right': [
          \     ['lineinfo', 'syntastic'],
          \     ['percent'],
          \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
          \   ]
          \ },
          \ 'component_function': {
          \   'modified': 'MyModified',
          \   'readonly': 'MyReadonly',
          \   'fugitive': 'MyFugitive',
          \   'filename': 'MyFilename',
          \   'fileformat': 'MyFileformat',
          \   'filetype': 'MyFiletype',
          \   'fileencoding': 'MyFileencoding',
          \   'mode': 'MyMode',
          \   'syntastic': 'SyntasticStatuslineFlag',
          \   'charcode': 'MyCharCode',
          \   'gitgutter': 'MyGitGutter',
          \ },
          \ 'separator': {'left': '⮀', 'right': '⮂'},
          \ 'subseparator': {'left': '⮁', 'right': '⮃'}
          \ }

  function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
  endfunction

  function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
          \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
          \  &ft == 'unite' ? unite#get_status_string() :
          \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != MyModified() ? ' ' . MyModified() : '')
  endfunction

  function! MyFugitive()
    try
      if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
      endif
    catch
    endtry
    return ''
  endfunction

  function! MyFileformat()
    return winwidth('.') > 70 ? &fileformat : ''
  endfunction

  function! MyFiletype()
    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
  endfunction

  function! MyFileencoding()
    return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endfunction

  function! MyMode()
    return winwidth('.') > 60 ? lightline#mode() : ''
  endfunction

  function! MyGitGutter()
    if ! exists('*GitGutterGetHunkSummary')
          \ || ! get(g:, 'gitgutter_enabled', 0)
          \ || winwidth('.') <= 90
      return ''
    endif
    let symbols = [
          \ g:gitgutter_sign_added . ' ',
          \ g:gitgutter_sign_modified . ' ',
          \ g:gitgutter_sign_removed . ' '
          \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
      if hunks[i] > 0
        call add(ret, symbols[i] . hunks[i])
      endif
    endfor
    return join(ret, ' ')
  endfunction

  " https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
  function! MyCharCode()
    if winwidth('.') <= 70
      return ''
    endif

    " Get the output of :ascii
    redir => ascii
    silent! ascii
    redir END

    if match(ascii, 'NUL') != -1
      return 'NUL'
    endif

    " Zero pad hex values
    let nrformat = '0x%02x'

    let encoding = (&fenc == '' ? &enc : &fenc)

    if encoding == 'utf-8'
      " Zero pad with 4 zeroes in unicode files
      let nrformat = '0x%04x'
    endif

    " Get the character and the numeric value from the return value of :ascii
    " This matches the two first pieces of the return value, e.g.
    " "<F>  70" => char: 'F', nr: '70'
    let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

    " Format the numeric value
    let nr = printf(nrformat, nr)

    return "'". char ."' ". nr
  endfunction
"}}}

" vimfiler {{{
  let g:vimfiler_as_default_explorer  = 1
  let g:vimfiler_safe_mode_by_default = 0
  let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
  nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>
" }}}

" vim-easymotion {{{
  let g:EasyMotion_do_mapping = 0
  nmap s <Plug>(easymotion-s2)
  xmap s <Plug>(easymotion-s2)
  omap z <Plug>(easymotion-s2)
  nmap g/ <Plug>(easymotion-sn)
  xmap g/ <Plug>(easymotion-sn)
  omap g/ <Plug>(easymotion-tn)
  let g:EasyMotion_smartcase = 1
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)
  let g:EasyMotion_startofline = 0
  let g:EasyMotion_keys = 'QZASDFGHJKL;'
  let g:EasyMotion_use_upper = 1
  let g:EasyMotion_enter_jump_first = 1
" }}}

"---------neobundle#end--------------
call neobundle#end()
filetype plugin indent on
set t_Co=256
set laststatus=2
syntax on
