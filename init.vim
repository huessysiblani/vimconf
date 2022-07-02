augroup initvim | autocmd! | augroup END


call plug#begin()

Plug 'kkoomen/vim-doge', {'do': { -> doge#install() }}
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-palenight.lua'

"""
Plug 'OmniSharp/omnisharp-vim'
let g:OmniSharp_server_use_mono = 1
autocmd initvim FileType cs,csharp nnoremap <buffer> <silent> <F3> :OmniSharpGotoDefinition<CR>
autocmd initvim FileType cs,csharp nnoremap <buffer> <silent> <F4> :OmniSharpFindUsages<CR>
"""

"""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
nmap <silent> <F3> <Plug>(coc-definition)
nmap <silent> <F4> <Plug>(coc-references)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
autocmd initvim FileType cpp,cc,c,hpp,h nnoremap <buffer> <silent><S-q> :CocCommand clangd.switchSourceHeader<CR>
autocmd User CocLocationsChange CocList --normal location
let g:coc_enable_locationlist = 0
let g:coc_global_extensions = 
            \ [
            \ 'coc-json', 'coc-tsserver',
            \ 'coc-clangd',
            \ 'coc-jedi', 'coc-prettier', 'coc-eslint', 
            \ 'coc-go', 'coc-angular',
            \ 'coc-html', 'coc-cmake', 'coc-css', 
            \ '@yaegassy/coc-intelephense', 
            \ 'coc-xml', 'coc-yaml',
            \ ]
"""

"""
Plug 'dense-analysis/ale'
let g:ale_disable_lsp = 1
let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'cpp': ['clang-tidy', 'g++', 'gcc'],
\ 'c': ['clang-tidy', 'g++', 'gcc'],
\ 'typescript': ['tslint'],
\ 'typescriptreact': ['tslint'],
\ 'javascript': ['tslint']
\}
"""

"""
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'FZF'
let $FZF_DEFAULT_COMMAND = 'find . -type f'
"""

"""
Plug 'vim-airline/vim-airline'
let g:airline_theme = 'gruvbox'
"""

"""
Plug 'AlxHnr/project-chdir.vim'
let g:project_chdir#items =
  \ {
  \   '.git':      2,
  \   'node_modules':      2,
  \   'Makefile':  1,
  \   'CMakeLists.txt':  1,
  \   'README.md': 1,
  \   'package.json': 1,
  \   'Cargo.toml': 1,
  \ }
"""

"""
Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"""
call plug#end()

""quickfix""
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END
""quickfix""

""FZF Keybinds""
nnoremap <silent> <c-f> :FZFHistory<CR>
nnoremap <silent> <c-p> :FZF<CR>
""FZF Keybinds""

""netrw config and keybinding""
let g:netrw_liststyle = 3
let g:netrw_winsize = 21 
let g:netrw_dirhistmax = 0
nnoremap <silent> <S-Tab> :Vexplore<CR>
""netrw config and keybinding"" 

""formatting config""
autocmd initvim FileType dart nnoremap <silent> <F2> :DartFmt <CR>
autocmd initvim FileType cpp,hpp,c,h,rust,php nnoremap <silent> <F2> :Autoformat <CR>
autocmd initvim FileType javascript,typescript,typescriptreact nnoremap <silent> <F2> :CocCommand prettier.formatFile <CR>
""formatting config""

""navigation""
noremap j gj
noremap k gk
nnoremap <a-h> <c-w><c-h>
nnoremap <a-j> <c-w><c-j>
nnoremap <a-k> <c-w><c-k>
nnoremap <a-l> <c-w><c-l>
tnoremap <a-h> <c-\><c-n><c-w><c-h>
tnoremap <a-j> <c-\><c-n><c-w><c-j>
tnoremap <a-k> <c-\><c-n><c-w><c-k>
tnoremap <a-l> <c-\><c-n><c-w><c-l>
""navigation""

""buffer start""
au BufRead * normal zR
""buffer start""

""other keybinds""
nnoremap <silent> <esc><esc> :noh<CR>:pc<CR>
""other keybinds""

""other flags and config""
set ic
set number
set nowrap
set termguicolors
set background=dark
set foldmethod=syntax
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
colorscheme palenight
""other flags and config""
