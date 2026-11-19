---
layout: post
title: "Um setup minimalista de Vim que funciona"
description: "Uma configuração de Vim simples, confiável e testada no dia a dia."
date: 2025-09-30 16:00:00 -0300
lang: pt-BR
translation_url: /2025/09/30/a-minimalist-vim-setup-that-just-works.html
permalink: /pt-br/2025/09/30/configuracao-minimalista-vim/
tags: [vim, vimrc, cli, terminal, tools, minimalism, productivity]
---

Uso o mesmo setup de Vim desde 2019, e ele continua funcionando bem para tudo o que preciso: programar, escrever, editar e explorar projetos nas linguagens com as quais já trabalhei.

Não me entenda mal. Respeito quem mantém configurações avançadas de Vim, com muitos plugins e scripts personalizados. Só não é para mim. *Mantenha simples.*

Este artigo é para quem quer uma experiência de Vim limpa e confiável, sem complexidade desnecessária. Se você está começando a usar Vim ou prefere um setup minimalista, este guia é para você.

## Por que este setup funciona

Esta configuração segue alguns princípios simples:

- **Poucos plugins** – apenas ferramentas que resolvem problemas reais
- **Inicialização rápida** – sem frameworks pesados
- **Padrões sensatos** – indentação, busca e navegação práticas
- **Recursos modernos** – linting, formatação e IntelliSense quando necessário

É uma configuração que não atrapalha, mas continua poderosa.

## Começando

O Vim lê suas configurações de um arquivo chamado `.vimrc`, localizado no diretório pessoal. Se ele não existir, crie-o com:

```sh
vim ~/.vimrc
```

Agora vamos adicionar um pouco de mágica.

## Configurações básicas

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

## Busca

```vim
set incsearch      " Highlight search matches as you type
set ignorecase     " Ignore case when searching
set smartcase      " Override 'ignorecase' if search contains uppercase letters
```

Essas opções deixam a busca mais fluida. O Vim destaca as correspondências enquanto você digita, ignora maiúsculas e minúsculas a menos que a busca contenha letras maiúsculas e ajuda você a encontrar o que precisa mais rapidamente.

## Ajudas visuais

```vim
set showcmd      " Display incomplete commands in the status line
set showmode     " Show current mode (e.g., -- INSERT --) in the status line
set showmatch    " Briefly jump to matching bracket when typing
set hlsearch     " Highlight all search matches in the file
```

Essas opções mostram o modo atual, destacam os resultados da busca e levam brevemente o cursor até o par correspondente de um delimitador. Tudo para deixar o Vim mais fácil de usar.

## Autocompletar

```vim
set wildmenu        " Enable enhanced command-line completion menu
set wildmode=list:longest " Show completion options as a list, auto-complete the longest match
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " Ignore these file types in command-line completion
```

O `wildmenu` mostra sugestões úteis quando você pressiona Tab. Como no Bash, ele oferece opções de conclusão e ignora tipos de arquivo que você provavelmente não quer abrir no Vim.

## Barra de status

```vim
set statusline=                       " Start with an empty status line
set statusline+=\ %F\ %M\ %Y\ %R      " Show file name, modified flag, file type, and readonly flag
set statusline+=%=                    " Separate left and right sections
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%% " Show current row, column, and percent through file
set laststatus=2                      " Always display the status line
```

Isso mostra o nome do arquivo, seu estado e sua posição atual. Simples e útil.

## O que mudou

Desde que escrevi este artigo pela primeira vez, fiz algumas mudanças pontuais no meu `.vimrc`. A configuração continua minimalista, mas ganhou algumas conveniências modernas:

- **Plugins atualizados:** uso `coc.nvim` para autocompletar no estilo LSP e `vim-nerdtree-syntax-highlight` para melhorar a exibição dos arquivos no NERDTree.
- **Configurações novas e ajustadas:** integração com a área de transferência do sistema (`unnamedplus`), indentação consistente com dois espaços e suporte a true color quando disponível.
- **Atalhos úteis:** navegação entre buffers e janelas, atalhos do NERDTree e mapeamentos do CoC/ALE para agilizar a edição.

A seguir, resumo as partes importantes do meu `.vimrc` atual para você aplicar as mesmas mudanças rapidamente.

## Partes principais do meu `.vimrc` atualizado

Plugins (instale com `vim-plug`):

```vim
call plug#begin()
	Plug 'dense-analysis/ale'                        " ALE: Asynchronous linting and fixing
	Plug 'preservim/nerdtree'                        " NERDTree: File system explorer
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   " Highlight file types in NERDTree
	Plug 'neoclide/coc.nvim', {'branch': 'release'}  " CoC: Autocomplete + IntelliSense
call plug#end()
```

Configurações gerais e aparência:

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

Indentação consistente com dois espaços:

```vim
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
```

Melhorias na busca e no autocompletar:

```vim
set incsearch
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
```

Atalhos úteis:

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

Realce de sintaxe e comportamento do NERDTree:

```vim
let NERDTreeShowHidden=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeSyntaxEnabledExtensions = ['*']
let g:NERDTreeSyntaxHideIcons = 1
```

Mapeamentos úteis do CoC (autocompletar / IntelliSense):

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

Ajustes do ALE (linting / correção):

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

Recarregamento automático quando arquivos são alterados externamente:

```vim
set autoread
autocmd FocusGained,BufEnter * checktime
```

## Para concluir

Depois de salvar seu `.vimrc`, reinicie o Vim ou recarregue o arquivo com:

```vim
:source ~/.vimrc
```

Assim, você mantém uma configuração pequena e rápida, com conveniências modernas: integração com a área de transferência, indentação consistente, autocompletar no estilo LSP com `coc.nvim`, uma exibição melhor no NERDTree e atalhos de navegação.

Se quiser, também posso incluir meu `.vimrc` completo neste artigo ou criar um Gist com ele.

E é isso. Agora você tem um setup de Vim limpo, rápido e fácil de usar. É o mesmo que uso há anos, e espero que seja tão útil para você quanto tem sido para mim.
