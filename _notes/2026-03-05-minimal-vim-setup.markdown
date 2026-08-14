---
layout: note
title: Minimal .vimrc setup
description: "Vim Setup: Simple, Reliable, and Battle-Tested"
date: 2026-03-05 10:00:00 -0300
tags: [vim, snippet, gist]
---

```sh
" ===============================================================
" VIMRC - Setup with NERDTree, CoC, ALE, and optimized navigation
" ===============================================================

" -------------------------------
" Plugins
" -------------------------------
call plug#begin()
  Plug 'dense-analysis/ale'                        " Async linting
  Plug 'preservim/nerdtree'                                                          " File explorer
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   " Highlight file types in NERDTree
  Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Autocomplete + IntelliSense
call plug#end()

" -------------------------------
" General settings
" -------------------------------
set nocompatible
filetype plugin indent on
syntax on
set encoding=UTF-8
set clipboard=unnamedplus
colorscheme wildcharm
if has('termguicolors')
  set termguicolors
endif

" -------------------------------
" Appearance
" -------------------------------
set number
set showcmd
set showmatch
set laststatus=2

" Status line
set statusline=%F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=row:\ %l\ col:\ %c\ percent:\ %p%%

" -------------------------------
" Tabs and Indentation
" -------------------------------
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent

" -------------------------------
" Searching
" -------------------------------
set incsearch
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" -------------------------------
" Buffer and Split Navigation
" -------------------------------
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bd :bdelete<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" -------------------------------
" NERDTree Configuration
" -------------------------------
let NERDTreeShowHidden=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeSyntaxEnabledExtensions = ['*']
let g:NERDTreeSyntaxHideIcons = 1

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
autocmd VimEnter * if !argc() | NERDTree | endif

" -------------------------------
" CoC - Autocomplete / IntelliSense
" -------------------------------
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" -------------------------------
" ALE - Linting / Fixing
" -------------------------------
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" Define fixers per language
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\}

" Key mappings for ALE
nnoremap <Leader>en :ALENext<CR>      " Next error
nnoremap <Leader>ep :ALEPrevious<CR>  " Previous error
nnoremap <Leader>f :ALEFix<CR>        " Fix current file

" Show ALE results in a window
nnoremap <Leader>el :ALEResults<CR>

" -------------------------------
" Auto-reload external changes
" -------------------------------
set autoread
autocmd FocusGained,BufEnter * checktime

" ===============================================================
" End of Vim configuration
" ===============================================================
```
