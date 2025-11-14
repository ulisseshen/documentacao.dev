import 'package:jaspr/jaspr.dart';

/// A component that displays documentation cards in a modern grid layout.
class DocCards extends StatelessComponent {
  const DocCards({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'doc-cards-container',
      [
        h2(classes: 'doc-cards-title', [
          text('📚 Documentações Disponíveis')
        ]),
        div(
          classes: 'doc-cards-grid',
          [
            // Flutter Card 1
            _buildDocCard(
              icon: _flutterIcon(),
              title: 'FlutterBrasil.dev',
              description: 'Site oficial Flutter em PT-BR',
              features: [
                'Framework para criar aplicativos multiplataforma',
                'Documentação completa traduzida',
                'Tutoriais e guias em português',
              ],
              url: 'https://flutterbrasil.dev',
              badgeText: null,
              accentColor: '#02569B',
            ),
            // Flutter Card 2
            _buildDocCard(
              icon: _flutterIcon(),
              title: 'docs.flutterbrasil.dev',
              description: 'Documentação Flutter',
              features: [
                'Referência completa da API',
                'Guias de desenvolvimento',
                'Exemplos práticos',
              ],
              url: 'https://docs.flutterbrasil.dev',
              badgeText: null,
              accentColor: '#02569B',
            ),
            // Dart Card
            _buildDocCard(
              icon: _dartIcon(),
              title: 'DartBrasil.dev',
              description: 'Linguagem Dart e documentação',
              features: [
                'Linguagem de programação moderna',
                'Documentação oficial traduzida',
                'Recursos de aprendizado',
              ],
              url: 'https://dartbrasil.dev',
              badgeText: null,
              accentColor: '#0175C2',
            ),
            // Angular Card (Coming Soon)
            _buildDocCard(
              icon: _angularIcon(),
              title: 'Angular Brasil',
              description: 'Documentação Angular em PT-BR',
              features: [
                'Framework para aplicações web',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em breve',
              accentColor: '#DD0031',
            ),
          ],
        ),
        raw('''
<style>
.doc-cards-container {
  margin: 2rem 0;
}

.doc-cards-title {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 2rem;
  color: var(--primary-color, #00D9FF);
}

.doc-cards-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
  margin: 2rem 0;
}

.doc-card {
  position: relative;
  display: flex;
  flex-direction: column;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(0, 217, 255, 0.2);
  border-radius: 16px;
  padding: 1.5rem;
  transition: all 0.3s ease;
  text-decoration: none;
  color: inherit;
  overflow: hidden;
}

.doc-card:hover {
  transform: translateY(-4px);
  border-color: rgba(0, 217, 255, 0.5);
  box-shadow: 0 8px 24px rgba(0, 217, 255, 0.15);
  background: rgba(255, 255, 255, 0.08);
}

.doc-card.disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.doc-card.disabled:hover {
  transform: none;
  border-color: rgba(0, 217, 255, 0.2);
  box-shadow: none;
  background: rgba(255, 255, 255, 0.05);
}

.doc-card-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1rem;
}

.doc-card-icon {
  width: 48px;
  height: 48px;
  flex-shrink: 0;
}

.doc-card-icon svg {
  width: 100%;
  height: 100%;
}

.doc-card-title-group {
  flex: 1;
}

.doc-card-title {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 0 0 0.25rem 0;
  color: #00D9FF;
}

.doc-card-description {
  font-size: 0.875rem;
  margin: 0;
  opacity: 0.8;
}

.doc-card-badge {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: linear-gradient(135deg, #FFDD00, #FFA500);
  color: #000;
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.doc-card-features {
  list-style: none;
  padding: 0;
  margin: 1rem 0 0 0;
}

.doc-card-features li {
  padding: 0.5rem 0;
  padding-left: 1.5rem;
  position: relative;
  font-size: 0.9rem;
  line-height: 1.4;
}

.doc-card-features li::before {
  content: '✓';
  position: absolute;
  left: 0;
  color: #00D9FF;
  font-weight: bold;
}

.doc-card-footer {
  margin-top: auto;
  padding-top: 1rem;
  border-top: 1px solid rgba(0, 217, 255, 0.1);
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.875rem;
  color: #00D9FF;
  font-weight: 600;
}

.doc-card-footer svg {
  width: 16px;
  height: 16px;
}

@media (max-width: 768px) {
  .doc-cards-grid {
    grid-template-columns: 1fr;
  }

  .doc-card {
    padding: 1.25rem;
  }
}

/* Dark mode support */
@media (prefers-color-scheme: dark) {
  .doc-card {
    background: rgba(0, 0, 0, 0.3);
    border-color: rgba(0, 217, 255, 0.3);
  }

  .doc-card:hover {
    background: rgba(0, 0, 0, 0.4);
  }
}
</style>
'''),
      ],
    );
  }

  Component _buildDocCard({
    required Component icon,
    required String title,
    required String description,
    required List<String> features,
    String? url,
    String? badgeText,
    required String accentColor,
  }) {
    final card = div(
      classes: url == null ? 'doc-card disabled' : 'doc-card',
      [
        if (badgeText != null)
          div(classes: 'doc-card-badge', [text(badgeText)]),
        div(
          classes: 'doc-card-header',
          [
            div(classes: 'doc-card-icon', [icon]),
            div(
              classes: 'doc-card-title-group',
              [
                h3(classes: 'doc-card-title', [text(title)]),
                p(classes: 'doc-card-description', [text(description)]),
              ],
            ),
          ],
        ),
        ul(
          classes: 'doc-card-features',
          features.map((feature) => li([text(feature)])).toList(),
        ),
        if (url != null)
          div(
            classes: 'doc-card-footer',
            [
              text('Acessar documentação'),
              raw('''<svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"/>
              </svg>'''),
            ],
          ),
      ],
    );

    if (url != null) {
      return a(
        href: url,
        target: Target.blank,
        [card],
      );
    }

    return card;
  }

  // Flutter icon (simplified logo)
  Component _flutterIcon() {
    return raw('''
<svg viewBox="0 0 48 48" fill="none">
  <path d="M26 8L6 28L12 34L38 8H26Z" fill="#02569B"/>
  <path d="M26 20L18 28L12 34L26 48H38L24 34L38 20H26Z" fill="#0175C2"/>
  <path d="M24 34L18 28L24 34Z" fill="#01579B"/>
</svg>
''');
  }

  // Dart icon (simplified logo)
  Component _dartIcon() {
    return raw('''
<svg viewBox="0 0 48 48" fill="none">
  <path d="M12 36L8 40L8 12L36 12L12 36Z" fill="#00D2B8"/>
  <path d="M12 36L36 12L40 12L40 40L36 40L12 36Z" fill="#0175C2"/>
  <path d="M36 40L40 40L40 36L36 40Z" fill="#055A9E"/>
  <path d="M12 36L8 40L36 40L12 36Z" fill="#00A4B4" opacity="0.8"/>
</svg>
''');
  }

  // Angular icon (simplified logo)
  Component _angularIcon() {
    return raw('''
<svg viewBox="0 0 48 48" fill="none">
  <path d="M24 6L8 14L10 32L24 42L38 32L40 14L24 6Z" fill="#DD0031"/>
  <path d="M24 6V42L38 32L40 14L24 6Z" fill="#C3002F"/>
  <path d="M24 12L16 30H20L22 26H26L28 30H32L24 12ZM24 18L26 24H22L24 18Z" fill="white"/>
</svg>
''');
  }
}
