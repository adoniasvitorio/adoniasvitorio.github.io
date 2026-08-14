---
layout: post
title:  "Um setup minimalista de Vim que funciona"
description: "Setup de Vim: simples, confiável e testado na prática"
date:   2025-09-30 16:00:00 -0300
tags: [vim, vimrc, cli, terminal, developer-tools, minimalism, productivity]
---

Uso o mesmo setup de Vim desde 2019, e ele continua funcionando bem para tudo o que preciso: codar, escrever, editar e explorar projetos nas linguagens com as quais já trabalhei.

Não me entenda mal. Respeito quem mantém configurações avançadas de Vim, com muitos plugins e scripts personalizados. Só não é para mim. *Mantenha simples*.

Este post é para quem quer uma experiência de Vim limpa e confiável, sem complexidade desnecessária. Se você está começando com Vim ou prefere um setup minimalista, este guia é para você.

## Por que este setup funciona

Esta configuração segue alguns princípios simples:

- **Plugins mínimos** – apenas ferramentas que resolvem problemas reais
- **Inicialização rápida** – sem frameworks pesados
- **Bons padrões** – indentação, busca e navegação sensatas
- **Recursos modernos** – linting, formatação e IntelliSense quando necessário

É um setup que fica fora do seu caminho, mas continua poderoso.

Se você tem curiosidade, a configuração completa está disponível aqui:

👉 [https://adoniasvitorio.github.io/notes/2026-03-05-minimal-vim-setup/](https://adoniasvitorio.github.io/notes/2026-03-05-minimal-vim-setup/)

## Começando

O Vim lê as configurações de um arquivo chamado `.vimrc`, que fica no seu diretório pessoal. Se ele não existir, crie com:

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
Isso deixa a busca mais fluida. O Vim vai destacar as correspondências enquanto você digita, ignorar maiúsculas/minúsculas a menos que você use letras maiúsculas e ajudar você a encontrar o que precisa mais rápido.

## Ajudas visuais
```vim
set showcmd      " Display incomplete commands in the status line
set showmode     " Show current mode (e.g., -- INSERT --) in the status line
set showmatch    " Briefly jump to matching bracket when typing
set hlsearch     " Highlight all search matches in the file
```

Essas configurações mostram o modo atual, fazem correspondência de parênteses e colchetes e destacam os resultados da busca. Tudo para deixar o Vim mais amigável.

## Autocompletar
```vim
set wildmenu        " Enable enhanced command-line completion menu
set wildmode=list:longest " Show completion options as a list, auto-complete the longest match
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " Ignore these file types in command-line completion
```

O wildmenu te dá um menu de autocompletar bem legal quando você pressiona TAB. Ele funciona como o Bash e ignora arquivos que você provavelmente não quer abrir no Vim.

## Barra de status
```vim
set statusline=                       " Start with an empty status line
set statusline+=\ %F\ %M\ %Y\ %R      " Show file name, modified flag, file type, and readonly flag
set statusline+=%=                    " Separate left and right sections
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%% " Show current row, column, and percent through file
set laststatus=2                      " Always display the status line
```

Isso mostra o nome do arquivo, o modo e sua posição nele. Simples e útil.

## O que mudou

Desde que escrevi isso pela primeira vez, fiz algumas mudanças pontuais no meu `.vimrc` que mantêm o setup minimalista, mas trazem conveniências modernas:

- Plugins atualizados: uso `coc.nvim` para autocompletar no estilo LSP e `vim-nerdtree-syntax-highlight` para melhorar o visual do NERDTree.
- Configurações novas e ajustadas: integração com a área de transferência do sistema (`unnamedplus`), indentação consistente (espaços, 2 colunas) e suporte a cores verdadeiras (true color) quando disponível.
- Atalhos úteis: navegação entre buffers, movimento entre janelas, atalhos do NERDTree e atalhos de CoC/ALE para agilizar a edição.

Abaixo, resumo as partes importantes do meu `.vimrc` atual para você aplicar as mesmas mudanças rapidamente.

## Partes-chave do meu `.vimrc` atualizado

Plugins (instale com `vim-plug`):

```vim
call plug#begin()
	Plug 'dense-analysis/ale'                        " ALE: Asynchronous linting and fixing
	Plug 'preservim/nerdtree'                        " NERDTree: File system explorer
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   " Highlight file types in NERDTree
	Plug 'neoclide/coc.nvim', {'branch': 'release'}  " CoC: Autocomplete + IntelliSense
call plug#end()
```

Geral e aparência:

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

Tabs e indentação (consistentes, 2 espaços):

```vim
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
```

Melhorias de busca e autocompletar:

```vim
set incsearch
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
```

Atalhos úteis (estes estão no meu `.vimrc`):

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

Mapeamentos pequenos, mas úteis, do CoC (autocompletar / IntelliSense):

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

Recarga automática quando arquivos mudam externamente:

```vim
set autoread
autocmd FocusGained,BufEnter * checktime
```

## Finalizando
Depois de salvar seu `.vimrc`, reinicie o Vim ou recarregue-o com:
```vim
:source ~/.vimrc
```

Isso mantém o setup pequeno e rápido, adicionando conveniências modernas de editor: integração com a área de transferência, indentação consistente, autocompletar no estilo LSP com `coc.nvim`, visual melhor do NERDTree e atalhos rápidos de navegação.

Se quiser, também posso colar meu `.vimrc` completo no post ou criar um Gist com ele.

E é isso. Agora você tem um setup de Vim limpo, rápido e fácil de usar. É o mesmo que eu uso há anos, e espero que sirva para você tão bem quanto serviu para mim.
