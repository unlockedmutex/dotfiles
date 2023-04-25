set termguicolors
call plug#begin('~/.local/share/nvim/plugged')

" Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" Git
Plug 'tpope/vim-fugitive'

" Code
Plug 'tomtom/tcomment_vim'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'

" UI
Plug 'gcmt/taboo.vim'

" Misc
Plug 'farmergreg/vim-lastplace'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'michaeljsmith/vim-indent-object'

" Themes
Plug 'xolox/vim-misc'
Plug 'tpope/vim-vividchalk'

call plug#end()

let g:python3_host_prog = '/Users/baptistevauthey/nvim_python_virtualenv/bin/python'
let g:python_host_prog = '/Users/baptistevauthey/nvim_python2_virtualenv/bin/python'

" call nvim_lsp#setup("pyls", {
"       \ 'pyls.plugins.pyflakes.enabled': 1,
"       \ 'pyls.plugins.pylint.enabled': 1,
"       \ 'pyls.plugins.pylint.args': ['--py3k'],
"       \
"       \ })


"search
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Vanilla Nvim Settings
set laststatus=2
set incsearch
set ignorecase
set smartcase
set clipboard=unnamed
autocmd FileType gitcommit set bufhidden=delete
set noshowmode
set nu rnu
set cursorline
set sessionoptions+=tabpages,globals
set fillchars=" "
set scrolloff=8       " Show next 8 lines while scrolling.
" set sidescrolloff=5
autocmd FileType python set shiftwidth=2 tabstop=2 expandtab


" Custom Mappings
nmap <F9> :TagbarToggle<CR>
" Custom Commands
cnoreabbrev H vert bo h

" normal mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <F1> :Files<CR>
nnoremap <F2> :Ag<CR>
nnoremap <F3> :PrevColorScheme<CR>
nnoremap <F4> :NextColorScheme<CR>
nnoremap <C-X> :bdelete<CR>
nnoremap <C-Space> <Enter>
nnoremap <Esc> <Nop>
" insert mode
inoremap <C-j> <C-n>
inoremap kj <Esc>
inoremap <C-k> <C-p>
" terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <Down>
tnoremap <C-k> <Up>
tnoremap <C-Space> <Enter>
tnoremap kj <C-\><C-n>



let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
let g:hardtime_default_on = 0

" Taboo settings
let g:taboo_tab_format = " | %l%f [%W] (%N) | "

" Tagbar settings
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = -1
let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
  \ ],                                                                            
  \ 'sort' : 0                                                                    
  \ }                                                                               


let g:vimade = {
  \ "normalid": '',
  \ "normalncid": '',
  \ "basefg": '',
  \ "basebg": '',
  \ "fadelevel": 0.6,
  \ "colbufsize": 15,
  \ "rowbufsize": 15, 
  \ "checkinterval": 100, 
  \ "usecursorhold": 0,
  \ "detecttermcolors": 1,
  \ 'enablescroll': 1, 
  \ 'enablesigns': 0,
  \ 'signsid': 13100,
  \ 'signsretentionperiod': 4000,
  \ 'fademinimap': 1,
  \ 'fadepriority': 10,
  \ 'groupdiff': 1,
  \ 'groupscrollbind': 0,
  \ 'enablefocusfading': 0}

" Colorscheme settings
let g:colorscheme_switcher_exclude_builtins = 1


" let g:deoplete#enable_at_startup = 1

setlocal autoindent
setlocal cindent
setlocal smartindent
set expandtab 
set shiftwidth=2




let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\}
"
let g:ale_python_pylint_options = "--py3k"
let g:ale_completion_enabled = 0

let g:material_terminal_italics = 1
let g:material_theme_style = 'default'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" autocmd! TermOpen
" autocmd TermOpen * setlocal nobuflisted


syntax on
" Removing highlighting from all ALE errors/warnings cuz I don't like it
" And it doesn't look clean
" highlight clear ALEStyleErrorSign
" highlight clear ALEStyleWarningSign 
"
" highlight clear ALEErrorSign
" highlight clear ALEInfoSign
" highlight clear ALEWarningSign 
"
" highlight clear ALEStyleErrorSignLineNr
" highlight clear ALEStyleWarningSignLineNr
"
" highlight clear ALEErrorSignLineNr
" highlight clear ALEInfoSignLineNr
" highlight clear ALEWarningSignLineNr

" highlight clear SignColumn

let g:nvim_typescript#server_path = '/usr/local/Cellar/node/12.8.0/bin/tsserver'

autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab

colorscheme vividchalk
