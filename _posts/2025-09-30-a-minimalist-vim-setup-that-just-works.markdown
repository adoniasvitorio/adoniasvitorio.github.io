---
layout: post
title: "A Minimalist Vim Setup That Just Works"
description: "A Vim setup that is simple, reliable, and tested in everyday use."
date:   2025-09-30 16:00:00 -0300
lang: en
translation_url: /pt-br/2025/09/30/configuracao-minimalista-vim/
permalink: /2025/09/30/a-minimalist-vim-setup-that-just-works.html
tags: [vim, vimrc, cli, terminal, tools, minimalism, productivity]
---

I've used the same Vim setup since 2019, and it still works well for everything I need to do: code, write, edit, and explore projects in the languages I've worked with.

Don't get me wrong. I respect people who maintain advanced Vim configurations with lots of plugins and custom scripts. It's just not for me. *Keep it simple.*

This post is for anyone looking for a clean, reliable Vim experience without unnecessary complexity. If you're new to Vim or prefer a minimalist setup, this guide is for you.

## Why this setup works

This configuration follows a few simple principles:

- **Minimal plugins** – only tools that solve real problems
- **Fast startup** – no heavy frameworks
- **Sensible defaults** – practical indentation, search, and navigation
- **Modern features** – linting, formatting, and IntelliSense when needed

It's a setup that stays out of your way while remaining powerful.

## Getting started

Vim reads its configuration from a file called `.vimrc` in your home directory. If it doesn't exist, create it with:

```sh
vim ~/.vimrc
```

Now let's add a little magic.

## Basic settings
```vim
set nocompatible            " Disable Vi compatibility for better Vim features
colorscheme wildcharm       " Set a simple, readable color scheme
filetype on                 " Enable file type detection
filetype plugin on          " Enable file type specific plugins
filetype plugin indent on   " Enable file type specific indentation
syntax on                   " Enable syntax highlighting
set number                  " Show line numbers
set tabstop=2               " Set tab width to 2 spaces
```

## Searching
```vim
set incsearch      " Highlight search matches as you type
set ignorecase     " Ignore case when searching
set smartcase      " Override 'ignorecase' if search contains uppercase letters
```
These settings make searching more fluid. Vim highlights matches as you type, ignores case unless your search contains uppercase letters, and helps you find what you need faster.

## Visual aids
```vim
set showcmd      " Display incomplete commands in the status line
set showmode     " Show current mode (e.g., -- INSERT --) in the status line
set showmatch    " Briefly jump to matching bracket when typing
set hlsearch     " Highlight all search matches in the file
```

These settings show the current mode, briefly jump to matching brackets, and highlight search results. They make Vim a little friendlier to use.

## Completion
```vim
set wildmenu        " Enable enhanced command-line completion menu
set wildmode=list:longest " Show completion options as a list, auto-complete the longest match
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " Ignore these file types in command-line completion
```

`wildmenu` gives you a useful completion menu when you press Tab. Like Bash, it offers suggestions while ignoring file types you probably don't want to open in Vim.

## Status line
```vim
set statusline=                       " Start with an empty status line
set statusline+=\ %F\ %M\ %Y\ %R      " Show file name, modified flag, file type, and readonly flag
set statusline+=%=                    " Separate left and right sections
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%% " Show current row, column, and percent through file
set laststatus=2                      " Always display the status line
```

This shows the filename, its status, and your current position in the file. Simple and useful.

## What's changed

Since I first wrote this, I've made a few small changes to my `.vimrc`. The setup is still minimal, but now includes some modern conveniences:

- Updated plugins: I use `coc.nvim` for LSP-style completion and `vim-nerdtree-syntax-highlight` to improve how NERDTree displays files.
- New and adjusted settings: system clipboard integration (`unnamedplus`), consistent two-space indentation, and true-color support when available.
- Useful shortcuts: buffer and window navigation, NERDTree shortcuts, and CoC/ALE mappings to speed up editing.

Below, I summarize the key parts of my current `.vimrc` so you can quickly apply the same changes.

## Key parts of my updated `.vimrc`

Plugins (install them with `vim-plug`):

```vim
call plug#begin()
	Plug 'dense-analysis/ale'                        " ALE: Asynchronous linting and fixing
	Plug 'preservim/nerdtree'                        " NERDTree: File system explorer
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   " Highlight file types in NERDTree
	Plug 'neoclide/coc.nvim', {'branch': 'release'}  " CoC: Autocomplete + IntelliSense
call plug#end()
```

General settings and appearance:

```vim
set nocompatible
filetype plugin indent on
syntax on
set encoding=UTF-8
set clipboard=unnamedplus       " Use system clipboard (copy/paste with the OS)
colorscheme wildcharm
if has('termguicolors')
	set termguicolors
endif

set number
set showcmd
set showmatch
set laststatus=2

set statusline=%F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=row:\ %l\ col:\ %c\ percent:\ %p%%
```

Consistent two-space indentation:

```vim
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
```

Search and completion improvements:

```vim
set incsearch
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
```

Useful shortcuts (these are in my `.vimrc`):

```vim
" Buffer navigation
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bd :bdelete<CR>

" Window navigation with Ctrl-h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree quick toggles
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
autocmd VimEnter * if !argc() | NERDTree | endif
```

NERDTree syntax highlighting and behavior:

```vim
let NERDTreeShowHidden=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeSyntaxEnabledExtensions = ['*']
let g:NERDTreeSyntaxHideIcons = 1
```

Small but useful CoC mappings (completion / IntelliSense):

```vim
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
```

ALE settings (linting / fixing):

```vim
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\}

nnoremap <Leader>en :ALENext<CR>
nnoremap <Leader>ep :ALEPrevious<CR>
nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>el :ALEResults<CR>
```

Automatically reload files changed outside Vim:

```vim
set autoread
autocmd FocusGained,BufEnter * checktime
```

## Wrapping up
After saving your `.vimrc`, restart Vim or reload it with:
```vim
:source ~/.vimrc
```

This keeps the setup small and fast while adding modern editor conveniences: clipboard integration, consistent indentation, LSP-style completion with `coc.nvim`, a better NERDTree display, and quick navigation shortcuts.

If you'd like, I can also include my complete `.vimrc` in the post or create a Gist for it.

And that's it. You now have a clean, fast, and easy-to-use Vim setup. It's the same one I've used for years, and I hope it serves you as well as it has served me.
