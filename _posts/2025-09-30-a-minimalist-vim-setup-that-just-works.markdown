---
layout: post
title:  "A minimal Vim setup that just works"
description: "Vim Setup: Simple, Reliable, and Battle-Tested"
date:   2025-09-30 16:00:00 -0300
tags: [vim, vimrc, cli, terminal, developer-tools, minimalism, productivity]
---

I’ve been using the same Vim setup since 2019, and it still works well for everything I need: coding, writing, editing, and exploring projects across the languages I’ve worked with.

Don’t get me wrong. I respect devs who maintain advanced Vim configurations with many plugins and custom scripts. That’s just not for me. *Keep it simple*.

This post is for anyone who wants a clean, reliable Vim experience without unnecessary complexity. If you’re starting with Vim or prefer a minimalist setup, this guide is for you.

## Why This Setup Works

This configuration follows a few simple principles:

- **Minimal plugins** – only tools that solve real problems
- **Fast startup** – no heavy frameworks
- **Good defaults** – sensible indentation, search behavior, and navigation
- **Modern features** – linting, formatting, and IntelliSense when needed

It’s a setup that stays out of your way while still being powerful.

If you're curious, the full configuration is available here:

👉 [https://adoniasvitorio.github.io/notes/2026-03-05-minimal-vim-setup/](https://adoniasvitorio.github.io/notes/2026-03-05-minimal-vim-setup/)

## Getting Started

Vim reads settings from a file called `.vimrc`. You can find it in your home directory. If it doesn’t exist, create it:

```sh
vim ~/.vimrc
```

Now let’s add some magic.

## Basic Settings
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

## Search
```vim
set incsearch      " Highlight search matches as you type
set ignorecase     " Ignore case when searching
set smartcase      " Override 'ignorecase' if search contains uppercase letters
```
This makes searching smoother. Vim will highlight matches as you type, ignore case unless you use capital letters, and help you find what you need faster.

## Helpful Visuals
```vim
set showcmd      " Display incomplete commands in the status line
set showmode     " Show current mode (e.g., -- INSERT --) in the status line
set showmatch    " Briefly jump to matching bracket when typing
set hlsearch     " Highlight all search matches in the file
```

These settings show your current mode, match parentheses and brackets, and highlight search results. It’s all about making Vim more friendly.

## Auto Completion
```vim
set wildmenu        " Enable enhanced command-line completion menu
set wildmode=list:longest " Show completion options as a list, auto-complete the longest match
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " Ignore these file types in command-line completion
```

Wildmenu gives you a nice auto-complete menu when you press TAB. It works like Bash and ignores files you probably don’t want to open in Vim.

## Status Line
```vim
set statusline=                       " Start with an empty status line
set statusline+=\ %F\ %M\ %Y\ %R      " Show file name, modified flag, file type, and readonly flag
set statusline+=%=                    " Separate left and right sections
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%% " Show current row, column, and percent through file
set laststatus=2                      " Always display the status line
```

This shows the file name, mode, and your position in the file. It’s simple and useful.

## What changed

Since I first wrote this, I made a few focused changes to my `.vimrc` that keep the setup minimal but bring modern conveniences:

- Updated plugins: I use `coc.nvim` for LSP-like autocompletion and `vim-nerdtree-syntax-highlight` to improve NERDTree visuals.
- New and tweaked settings: system clipboard integration (`unnamedplus`), consistent indentation (spaces, 2 cols), and true color support where available.
- Useful shortcuts: buffer navigation, window movement, NERDTree toggles and CoC/ALE shortcuts to speed up editing.

Below I summarize the important bits from my current `.vimrc` so you can apply the same changes quickly.

## Key parts of my updated `.vimrc`

Plugins (install with `vim-plug`):

```vim
call plug#begin()
	Plug 'dense-analysis/ale'                        " ALE: Asynchronous linting and fixing
	Plug 'preservim/nerdtree'                        " NERDTree: File system explorer
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   " Highlight file types in NERDTree
	Plug 'neoclide/coc.nvim', {'branch': 'release'}  " CoC: Autocomplete + IntelliSense
call plug#end()
```

General and appearance:

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

Tabs and indentation (consistent, 2 spaces):

```vim
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
```

Searching and completion improvements:

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

CoC (autocomplete / IntelliSense) small but useful mappings:

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

ALE (linting / fixing) tweaks:

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

Auto-reload when files change externally:

```vim
set autoread
autocmd FocusGained,BufEnter * checktime
```

## Final
After saving your `.vimrc`, restart Vim or reload it with:
```vim
:source ~/.vimrc
```

This keeps the setup small and fast while adding modern editor conveniences: clipboard integration, consistent indentation, LSP-like completion via `coc.nvim`, better NERDTree visuals, and fast navigation shortcuts.

If you want, I can also paste my full `.vimrc` into the post or create a Gist with it.

And that’s it. You now have a Vim setup that’s clean, fast, and easy to use. It’s the same one I’ve trusted for years, and I hope it serves you just as well.
