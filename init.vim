set termguicolors
call plug#begin('~/.local/share/nvim/plugged')

" Search
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" Code
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim'
Plug 'neovim/nvim-lsp'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'

" Solidity
Plug 'tomlion/vim-solidity'

" Python
Plug 'python-rope/ropevim'

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
Plug 'xolox/vim-colorscheme-switcher'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kaicataldo/material.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'arzg/vim-oldbook8'
Plug 'cideM/yui'
Plug 'jaredgorski/SpaceCamp'
Plug 'kamykn/dark-theme.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'danishprakash/vim-yami'
Plug 'arzg/vim-colors-xcode'

call plug#end()


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
set sidescrolloff=0
autocmd BufEnter * if &buftype == 'terminal' | set sidescrolloff=0 | endif
autocmd TermOpen * if &buftype == 'terminal' | set sidescrolloff=0 | endif
autocmd BufEnter * if &buftype != 'terminal' | set sidescrolloff=5 | endif
autocmd FileType python set shiftwidth=4 tabstop=4 expandtab

" set winwidth=95
" set winheight=50


" Custom Mappings
nmap <F9> :TagbarToggle<CR>
nmap <F3> :PrevColorScheme<CR>
nmap <F4> :NextColorScheme<CR>
" Custom Commands
cnoreabbrev H vert bo h

" normal mode
nnoremap <S-h> ^
nnoremap <S-l> $
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <F1> :Files<CR>
nnoremap <F2> :Ag<CR>
nnoremap <C-X> :bdelete<CR>
nnoremap <C-Space> <Enter>
nnoremap <Esc> <Nop>
" insert mode
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
" terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <Down>
tnoremap <C-k> <Up>
tnoremap <C-Space> <Enter>


command! -bang -nargs=* Files
  \ call fzf#vim#files(<q-args>,
  \                 fzf#vim#with_preview({})
  \                )

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 fzf#vim#with_preview({})
  \                )
" HardTime settings
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


" Colorscheme settings
let g:colorscheme_switcher_exclude_builtins = 1


let g:deoplete#enable_at_startup = 1

setlocal autoindent
setlocal cindent
setlocal smartindent
set expandtab 
set shiftwidth=4
set directory=


lua << EOF
require'nvim_lsp'.pyls_ms.setup{
    settings = {
        python ={
            linting ={
                flake8Enabled=true;
                pylintEnabled=false;
            }
        }
    }
}
EOF


autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc


nnoremap  gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap  cr    :call     RopeRename()<cr>
nnoremap  gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap  cf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap  gD    <cmd>lua vim.lsp.buf.implementation()<CR>


let g:neovide_cursor_trail_length=0.5




let g:material_terminal_italics = 1
let g:material_theme_style = 'default'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip


syntax on

let g:nvim_typescript#server_path = '/usr/local/Cellar/node/12.8.0/bin/tsserver'

autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab

colorscheme spacecamp
set guifont=Iosevka\ Fixed,Iosevka\ Fixed\ Light:h14
set mouse=
