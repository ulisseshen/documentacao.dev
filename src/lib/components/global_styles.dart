import 'package:jaspr/jaspr.dart';

/// Componente que adiciona estilos globais ao site
class GlobalStyles extends StatelessComponent {
  const GlobalStyles({super.key});

  @override
  Component build(BuildContext context) {
    return raw('''
<style>
/* Fix para âncoras que ficam escondidas atrás do appbar fixo */
html {
  scroll-padding-top: 80px;
}

/* Alternativa para navegadores mais antigos */
:target {
  scroll-margin-top: 80px;
}

/* Ajuste para headings que são alvos de âncoras */
h1:target,
h2:target,
h3:target,
h4:target,
h5:target,
h6:target {
  scroll-margin-top: 80px;
}
</style>
''');
  }
}
