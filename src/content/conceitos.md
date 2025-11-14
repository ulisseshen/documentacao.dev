---
title: Conceitos Básicos
description: Entenda os conceitos fundamentais antes de começar a desenvolver
---

# Conceitos Básicos

Esta página explica os conceitos fundamentais que você precisa conhecer para desenvolver com eficiência.

## Componentes

Componentes são os blocos de construção fundamentais de qualquer aplicação moderna.

### O que é um Componente?

Um componente é uma peça reutilizável de código que encapsula:

*   **Estrutura** (HTML/markup)
*   **Estilo** (CSS)
*   **Comportamento** (JavaScript/Dart)

### Exemplo de Componente

```dart
import 'package:jaspr/jaspr.dart';

class BotaoCustomizado extends StatelessComponent {
  final String texto;

  const BotaoCustomizado({
    required this.texto,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button([
      text(texto),
    ]);
  }
}
```

<Info>
  Componentes promovem a **reutilização de código** e tornam sua aplicação mais **modular** e **manutenível**.
</Info>

## Estado (State)

Estado representa os dados que podem mudar ao longo do tempo em sua aplicação.

### Estado Local vs Global

| Tipo | Quando Usar | Exemplo |
|------|------------|---------|
| **Local** | Dados específicos de um componente | Contador, formulário |
| **Global** | Dados compartilhados entre componentes | Usuário logado, tema |

### Gerenciando Estado

```dart
import 'package:jaspr/jaspr.dart';

class Contador extends StatefulComponent {
  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      p([text('Contagem: $contador')]),
      button(
        onClick: incrementar,
        [text('Incrementar')],
      ),
    ]);
  }
}
```

## Props (Propriedades)

Props são argumentos passados de um componente pai para um filho.

### Características das Props

*   ✅ São **imutáveis** (somente leitura)
*   ✅ Permitem **personalização** de componentes
*   ✅ Facilitam a **comunicação** entre componentes

### Exemplo com Props

```dart
// Componente filho
class Saudacao extends StatelessComponent {
  final String nome;

  const Saudacao({required this.nome, super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield p([text('Olá, $nome!')]);
  }
}

// Uso no componente pai
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Saudacao(nome: 'Maria');
  }
}
```

## Ciclo de Vida

Componentes passam por diferentes fases durante sua existência:

### Fases do Ciclo de Vida

1.  **Montagem** - Componente é criado e inserido no DOM
2.  **Atualização** - Props ou estado mudam
3.  **Desmontagem** - Componente é removido do DOM

```dart
class ExemploCicloVida extends StatefulComponent {
  @override
  State<ExemploCicloVida> createState() => _ExemploCicloVidaState();
}

class _ExemploCicloVidaState extends State<ExemploCicloVida> {
  @override
  void initState() {
    super.initState();
    // Executado quando o componente é montado
    print('Componente montado!');
  }

  @override
  void dispose() {
    // Executado quando o componente é desmontado
    print('Componente desmontado!');
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield text('Ciclo de Vida');
  }
}
```

## Renderização

Entenda como os componentes são renderizados na tela:

### Processo de Renderização

1.  **Build** - Componente gera sua estrutura
2.  **Reconciliação** - Framework compara com versão anterior
3.  **Atualização** - Apenas mudanças são aplicadas ao DOM

> **Otimização:** O framework atualiza apenas o que mudou, não toda a página!

## Estilização

Há várias formas de estilizar componentes:

### CSS Inline

```dart
yield div(
  styles: Styles.raw({
    'color': 'blue',
    'padding': '1rem',
  }),
  [text('Conteúdo estilizado')],
);
```

### Classes CSS

```dart
yield div(
  classes: 'minha-classe outra-classe',
  [text('Com classes')],
);
```

## Resumo

Você aprendeu sobre:

*   ✅ **Componentes** - blocos de construção reutilizáveis
*   ✅ **Estado** - dados dinâmicos da aplicação
*   ✅ **Props** - passagem de dados entre componentes
*   ✅ **Ciclo de Vida** - fases de um componente
*   ✅ **Renderização** - como mudanças são aplicadas
*   ✅ **Estilização** - formas de aplicar estilos

## Próximos Passos

*   🧩 Explore [componentes avançados](/componentes)
*   🤝 Aprenda [como contribuir](/contribuir)
*   💝 [Apoie o projeto](/#apoie-este-projeto)
