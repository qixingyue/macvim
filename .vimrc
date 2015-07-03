set nu
syntax on
set tabstop=4

let g:airline_theme='serene'

set hlsearch   
set incsearch " increment search
set showmatch " when keyup the right ) the left ( bright
set background=dark

set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle
let path='~/.vim/bundleplugins'
call vundle#rc(path)

Plugin 'gmarik/vundle'
Plugin 'Emmet.vim'
Plugin 'scrooloose/nerdtree' 
Plugin 'php.vim-html-enhanced' 
Plugin 'bling/vim-airline'
Plugin 'fugitive.vim'
Plugin 'elzr/vim-json'
Plugin 'matchit.zip'
Plugin 'plasticboy/vim-markdown'

Plugin 'lookupfile' 
Plugin 'genutils' 
Bundle 'bufexplorer.zip'
Bundle 'neocomplcache'

call vundle#end()

filetype plugin indent on  

set laststatus=2

map <C-n> :NERDTreeToggle<CR>

au FileType php call PHPFuncList()
function PHPFuncList()
				set dictionary-=~/.vim/dict/php_funclist
				set dictionary+=~/.vim/dict/php_funclist
				set complete-=k complete+=k
endfunction

""colorscheme solarized
"colorscheme blue
""colorscheme darkblue
colorscheme default
""colorscheme delek
""colorscheme desert
"colorscheme elflord
""colorscheme evening
"colorscheme koehler
""colorscheme morning
""colorscheme murphy
"colorscheme pablo
""colorscheme peachpuff
"colorscheme ron
""colorscheme shine
"colorscheme slate
"colorscheme torte
""colorscheme zellner

"保存时检测php文件的语法
autocmd BufWritePost *.php call PHPSyntaxCheck()

if !exists('g:PHP_SYNTAX_CHECK_BIN')
    let g:PHP_SYNTAX_CHECK_BIN = 'php'
endif

function! PHPSyntaxCheck()
    let result = system(g:PHP_SYNTAX_CHECK_BIN.' -l -n '.expand('%'))
    if (stridx(result, 'No syntax errors detected') == -1)
        echohl WarningMsg | echo result | echohl None
    endif
endfunction

set modifiable

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:LookupFile_TagExpr = '"./filenametags"' 
let g:LookupFile_PreserveLastPattern = 0 
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
