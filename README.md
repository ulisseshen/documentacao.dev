# 📚 Documentação.dev

> Plataforma de documentação técnica de alta qualidade em Português do Brasil

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

## 🌟 Sobre o Projeto

O **Documentação.dev** é uma iniciativa da comunidade brasileira para fornecer documentação técnica traduzida e de alta qualidade em Português do Brasil. Acreditamos que quebrar a barreira do idioma é essencial para democratizar o acesso ao conhecimento em tecnologia.

### ✨ Características

- 🎨 **Design Moderno e Responsivo** - Interface limpa e amigável que funciona em todos os dispositivos
- 🌓 **Tema Claro/Escuro** - Alternar entre temas para melhor conforto visual
- 🔍 **Busca Inteligente** - Encontre rapidamente o que precisa (Ctrl/Cmd + K)
- 📱 **Mobile-First** - Otimizado para dispositivos móveis
- ⚡ **Performance** - Site estático ultra-rápido
- 🇧🇷 **100% em Português** - Todo o conteúdo em PT-BR

## 🚀 Como Usar

### Pré-requisitos

- [Dart SDK](https://dart.dev/get-dart) (3.8.0 ou superior)
- [Jaspr CLI](https://jaspr.site/) (instalado globalmente)

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/ulisseshen/documentacao.dev.git
cd documentacao.dev
```

2. Navegue até a pasta `src` e instale as dependências:
```bash
cd src
dart pub get
```

### Desenvolvimento Local

Para iniciar o servidor de desenvolvimento com hot-reload:

```bash
cd src
jaspr serve
```

O site estará disponível em `http://localhost:8080`

### Build para Produção

Para criar uma versão otimizada para produção:

```bash
cd src
jaspr build
```

Os arquivos compilados estarão em `src/build/jaspr/`

## 📁 Estrutura do Projeto

```
documentacao.dev/
├── src/                    # Aplicação Jaspr
│   ├── content/           # Conteúdo markdown em PT-BR
│   │   ├── _data/         # Configurações (site.yaml, links.yaml)
│   │   ├── index.md       # Página inicial
│   │   ├── instalacao.md  # Guia de instalação
│   │   ├── conceitos.md   # Conceitos básicos
│   │   ├── componentes.md # Guia de componentes
│   │   ├── contribuir.md  # Como contribuir
│   │   └── about.md       # Sobre o projeto
│   ├── lib/               # Código Dart
│   │   ├── components/    # Componentes customizados
│   │   │   ├── donation_buttons.dart
│   │   │   └── clicker.dart
│   │   ├── main.dart      # Aplicação principal
│   │   └── jaspr_options.dart
│   ├── web/               # Assets estáticos
│   │   ├── favicon.ico
│   │   └── images/
│   ├── pubspec.yaml       # Dependências
│   └── analysis_options.yaml
├── README.md              # Este arquivo
└── LICENSE               # Licença MIT
```

## 🎨 Personalização

### Cores e Tema

As cores do tema podem ser personalizadas em `src/lib/main.dart`:

```dart
theme: ContentTheme(
  primary: ThemeColor(ThemeColors.cyan.$400, dark: ThemeColors.cyan.$400),
  background: ThemeColor(ThemeColors.slate.$50, dark: ThemeColors.zinc.$950),
),
```

### Adicionando Conteúdo

Para adicionar novas páginas de documentação:

1. Crie um novo arquivo markdown em `src/content/`:
```markdown
---
title: Nova Seção
description: Descrição da nova seção
---

# Nova Seção

Conteúdo aqui...
```

2. Adicione o link na navegação em `src/lib/main.dart`:
```dart
SidebarGroup(title: 'Guias', links: [
  SidebarLink(text: "Nova Seção", href: '/nova-secao'),
]),
```

### Criando Componentes Customizados

Crie novos componentes em `src/lib/components/`:

```dart
import 'package:jaspr/jaspr.dart';

class MeuComponente extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return div([
      text('Olá, Mundo!'),
    ]);
  }
}
```

E registre em `src/lib/main.dart`:

```dart
components: [
  CustomComponent(
    pattern: 'MeuComponente',
    builder: (_, __, ___) => MeuComponente(),
  ),
],
```

## 💝 Como Apoiar

Este projeto é mantido pela comunidade e depende de doações para:

- ✅ Manter traduções atualizadas
- ✅ Adicionar documentação de novas tecnologias
- ✅ Melhorar a qualidade das traduções existentes
- ✅ Cobrir custos de hospedagem e infraestrutura

### Formas de Contribuir

- ☕ **Buy Me a Coffee**: [buymeacoffee.com/documentacao](https://www.buymeacoffee.com/documentacao)
- 💳 **PIX**: `documentacao@dev.com.br`
- 🔧 **Contribua com código**: Envie Pull Requests!
- 📝 **Melhore traduções**: Ajude a revisar e melhorar
- 🐛 **Reporte bugs**: Abra issues com sugestões

## 🤝 Como Contribuir

Contribuições são muito bem-vindas! Veja como você pode ajudar:

1. Faça um Fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

### Diretrizes

- Use português claro e objetivo
- Siga o guia de estilo existente
- Teste suas alterações em diferentes navegadores
- Mantenha o código limpo e bem documentado

## 🛠️ Tecnologias Utilizadas

- **Dart** - Linguagem de programação
- **Jaspr** - Framework Dart para web (similar ao Flutter)
- **Jaspr Content** - Sistema de documentação baseado em markdown
- **Markdown** - Para escrita de conteúdo
- **YAML** - Para configurações

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🌍 Comunidade

- **GitHub**: [github.com/ulisseshen/documentacao.dev](https://github.com/ulisseshen/documentacao.dev)
- **Discord**: [discord.gg/documentacao](https://discord.gg/documentacao)
- **Twitter**: [@documentacaodev](https://twitter.com/documentacaodev)

## 🙏 Agradecimentos

Agradecemos a todos os contribuidores que ajudam a manter este projeto vivo e atualizado!

---

Feito com ❤️ pela comunidade brasileira de desenvolvedores