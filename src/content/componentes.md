---
title: Componentes
description: Guia completo sobre componentes e como usá-los
---

# Componentes

Aprenda a criar e usar componentes de forma eficaz.

## Tipos de Componentes

Existem dois tipos principais de componentes:

### Stateless Components

Componentes sem estado, ideais para conteúdo estático:

```dart
import 'package:jaspr/jaspr.dart';

class CartaoSimples extends StatelessComponent {
  final String titulo;
  final String descricao;

  const CartaoSimples({
    required this.titulo,
    required this.descricao,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'card', [
      h3([text(titulo)]),
      p([text(descricao)]),
    ]);
  }
}
```

### Stateful Components

Componentes com estado, para conteúdo dinâmico:

```dart
import 'package:jaspr/jaspr.dart';

class ContadorInterativo extends StatefulComponent {
  @override
  State<ContadorInterativo> createState() => _ContadorInterativoState();
}

class _ContadorInterativoState extends State<ContadorInterativo> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _decrementar() {
    setState(() {
      _contador--;
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'contador-container', [
      h2([text('Contador: $_contador')]),
      div(classes: 'botoes', [
        button(onClick: _decrementar, [text('-')]),
        button(onClick: _incrementar, [text('+')]),
      ]),
    ]);
  }
}
```

## Composição de Componentes

Componentes podem ser compostos para criar interfaces complexas:

```dart
class PaginaPerfil extends StatelessComponent {
  final String nome;
  final String email;

  const PaginaPerfil({
    required this.nome,
    required this.email,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'perfil', [
      CabecalhoPerfil(nome: nome),
      InformacoesPerfil(email: email),
      BotaoAcao(texto: 'Editar Perfil'),
    ]);
  }
}
```

<Info>
  **Dica:** Mantenha seus componentes pequenos e focados em uma única responsabilidade para facilitar a manutenção.
</Info>

## Passando Dados

### Props (Propriedades)

```dart
class Botao extends StatelessComponent {
  final String texto;
  final VoidCallback? onClick;
  final String? cor;

  const Botao({
    required this.texto,
    this.onClick,
    this.cor = 'blue',
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      onClick: onClick,
      styles: Styles.raw({'background-color': cor}),
      [text(texto)],
    );
  }
}

// Uso
Botao(
  texto: 'Clique Aqui',
  cor: 'green',
  onClick: () => print('Botão clicado!'),
)
```

### Children (Filhos)

```dart
class Container extends StatelessComponent {
  final List<Component> children;

  const Container({
    required this.children,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'container',
      children,
    );
  }
}

// Uso
Container(children: [
  Text('Primeiro filho'),
  Text('Segundo filho'),
  Botao(texto: 'Ação'),
])
```

## Eventos

Componentes podem responder a eventos do usuário:

```dart
class FormularioLogin extends StatefulComponent {
  @override
  State<FormularioLogin> createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  String _email = '';
  String _senha = '';

  void _fazerLogin() {
    print('Login: $_email');
    // Lógica de login aqui
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield form([
      input(
        type: InputType.email,
        placeholder: 'Email',
        value: _email,
        onChange: (valor) => setState(() => _email = valor),
        [],
      ),
      input(
        type: InputType.password,
        placeholder: 'Senha',
        value: _senha,
        onChange: (valor) => setState(() => _senha = valor),
        [],
      ),
      button(
        onClick: _fazerLogin,
        [text('Entrar')],
      ),
    ]);
  }
}
```

## Estilização Avançada

### Usando Classes CSS

```dart
class CartaoDestaque extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'card card-destaque shadow-lg', [
      h3(classes: 'card-titulo', [text('Título')]),
      p(classes: 'card-texto', [text('Descrição')]),
    ]);
  }
}
```

### Estilos Inline

```dart
yield div(
  styles: Styles.raw({
    'display': 'flex',
    'flex-direction': 'column',
    'gap': '1rem',
    'padding': '2rem',
    'background': 'linear-gradient(135deg, #00D9FF, #0066ff)',
    'border-radius': '12px',
  }),
  [text('Conteúdo')],
);
```

## Boas Práticas

### 1. Nomeação Clara

```dart
// ❌ Evite
class C extends StatelessComponent { }

// ✅ Prefira
class CardUsuario extends StatelessComponent { }
```

### 2. Componentes Pequenos

```dart
// ✅ Divida componentes grandes em menores
class ListaProdutos extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      CabecalhoLista(),
      ItensProdutos(),
      RodapeLista(),
    ]);
  }
}
```

### 3. Props com Valores Padrão

```dart
class Botao extends StatelessComponent {
  final String texto;
  final String cor;

  const Botao({
    required this.texto,
    this.cor = 'blue', // Valor padrão
    super.key,
  });
}
```

### 4. Documentação

```dart
/// Widget de cartão que exibe informações do usuário.
///
/// Exemplo:
/// ```dart
/// CartaoUsuario(
///   nome: 'João Silva',
///   email: 'joao@example.com',
/// )
/// ```
class CartaoUsuario extends StatelessComponent {
  // ...
}
```

## Componentes Reutilizáveis

Crie uma biblioteca de componentes reutilizáveis:

```
lib/
├── components/
│   ├── botoes/
│   │   ├── botao_primario.dart
│   │   └── botao_secundario.dart
│   ├── cards/
│   │   ├── card_produto.dart
│   │   └── card_usuario.dart
│   └── formularios/
│       ├── input_texto.dart
│       └── input_email.dart
```

## Próximos Passos

*   📚 Volte para [conceitos básicos](/conceitos)
*   🤝 Aprenda [como contribuir](/contribuir)
*   🏠 Retorne para a [página inicial](/)

<DonationButtons/>
