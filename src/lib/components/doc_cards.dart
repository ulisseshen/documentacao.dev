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
  color: #2563eb;
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
  background: #ffffff;
  border: 2px solid #e5e7eb;
  border-radius: 16px;
  padding: 1.5rem;
  transition: all 0.3s ease;
  text-decoration: none;
  color: inherit;
  overflow: hidden;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.doc-card:hover {
  transform: translateY(-4px);
  border-color: #3b82f6;
  box-shadow: 0 10px 30px rgba(59, 130, 246, 0.15);
  background: #f8faff;
}

.doc-card.disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.doc-card.disabled:hover {
  transform: none;
  border-color: #e5e7eb;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
  background: #ffffff;
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
  color: #1e40af;
}

.doc-card-description {
  font-size: 0.875rem;
  margin: 0;
  color: #6b7280;
}

.doc-card-badge {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: linear-gradient(135deg, #fbbf24, #f59e0b);
  color: #000;
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  box-shadow: 0 2px 4px rgba(251, 191, 36, 0.3);
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
  color: #374151;
}

.doc-card-features li::before {
  content: '✓';
  position: absolute;
  left: 0;
  color: #10b981;
  font-weight: bold;
  font-size: 1rem;
}

.doc-card-footer {
  margin-top: auto;
  padding-top: 1rem;
  border-top: 1px solid #e5e7eb;
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.875rem;
  color: #2563eb;
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
  .doc-cards-title {
    color: #60a5fa;
  }

  .doc-card {
    background: rgba(17, 24, 39, 0.8);
    border-color: rgba(75, 85, 99, 0.5);
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
  }

  .doc-card:hover {
    border-color: #60a5fa;
    box-shadow: 0 10px 30px rgba(96, 165, 250, 0.2);
    background: rgba(17, 24, 39, 0.95);
  }

  .doc-card.disabled:hover {
    border-color: rgba(75, 85, 99, 0.5);
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
    background: rgba(17, 24, 39, 0.8);
  }

  .doc-card-title {
    color: #60a5fa;
  }

  .doc-card-description {
    color: #9ca3af;
  }

  .doc-card-features li {
    color: #d1d5db;
  }

  .doc-card-features li::before {
    color: #34d399;
  }

  .doc-card-footer {
    border-top-color: rgba(75, 85, 99, 0.3);
    color: #60a5fa;
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

  // Flutter icon (official colors and design)
  Component _flutterIcon() {
    return raw('''
<svg viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="flutterGrad1" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#47C5FB;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#0175C2;stop-opacity:1" />
    </linearGradient>
    <linearGradient id="flutterGrad2" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#00D2B8;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#0175C2;stop-opacity:1" />
    </linearGradient>
  </defs>
  <polygon points="32,8 8,32 16,40 48,8" fill="url(#flutterGrad1)"/>
  <polygon points="24,32 16,40 24,48 32,48 40,40 32,32" fill="url(#flutterGrad2)" opacity="0.85"/>
  <polygon points="32,32 48,16 56,16 56,48 48,56 32,40" fill="#0175C2"/>
  <polygon points="32,32 24,40 32,48 40,40" fill="#02569B"/>
</svg>
''');
  }

  // Dart icon (official colors and design)
  Component _dartIcon() {
    return raw('''
<svg viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="dartGrad1" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#00D2B8;stop-opacity:1" />
      <stop offset="50%" style="stop-color:#00B4CC;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#0175C2;stop-opacity:1" />
    </linearGradient>
  </defs>
  <path d="M16 44 L12 48 L12 16 L44 16 Z" fill="url(#dartGrad1)"/>
  <path d="M16 44 L44 16 L52 16 L52 48 L44 48 Z" fill="#0175C2"/>
  <path d="M44 48 L52 48 L52 44 Z" fill="#01579B"/>
  <path d="M16 44 L12 48 L44 48 Z" fill="#00D2B8" opacity="0.7"/>
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
