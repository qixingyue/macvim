set nu
syntax on
set tabstop=2
set nowrap

set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle
let path='~/.vim/bundleplugins'

"call vundle#begin(path)
call vundle#rc(path)
"call vundle#runtime_append_all_bundles

Plugin 'gmarik/vundle'
Plugin 'Emmet.vim'
Plugin 'AutoComplPop'
Plugin 'scrooloose/nerdtree' 
Plugin 'php.vim-html-enhanced' 
Plugin 'bling/vim-airline'
Plugin 'fugitive.vim'
Plugin 'elzr/vim-json'
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
