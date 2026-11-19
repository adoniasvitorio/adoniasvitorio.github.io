# adoniasvitorio.github.io

Blog pessoal feito com Jekyll e o tema Minima.

## Executar localmente

Instale as dependências do projeto:

```sh
bundle install
```

Inicie o servidor local:

```sh
bundle exec jekyll serve
```

Acesse <http://localhost:4000>. O servidor atualiza o site ao detectar alterações nos arquivos. Para encerrar, pressione `Ctrl+C` no terminal.

O idioma padrão do site é inglês. Use o seletor no cabeçalho para abrir a versão em português do Brasil. O feed RSS e os links sociais ficam no rodapé, as tags dos posts abrem páginas de arquivo localizadas, e o ícone no cabeçalho alterna entre os temas claro e escuro.

## Estilo visual

O Minima fornece a estrutura e os estilos básicos. As personalizações do blog ficam em `assets/main.scss`; classes de componentes próprios seguem BEM (`bloco__elemento--modificador`).

- Cores, tipografia e espaçamentos usam tokens CSS semânticos, incluindo variantes para o tema escuro.
- A interface usa fontes do sistema; o corpo dos artigos usa uma pilha serifada para leitura longa, e exemplos usam fontes monoespaçadas.
- Componentes devem preservar estados de foco visíveis, contraste legível, layout responsivo e a preferência por movimento reduzido do sistema.
- Prefira os componentes existentes de prévia de artigo e lista de tags em `_includes/post-preview.html` antes de criar marcação ou estilos repetidos.
