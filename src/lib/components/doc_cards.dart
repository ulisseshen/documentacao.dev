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

.doc-cards-grid > a {
  text-decoration: none;
  color: inherit;
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
  margin: 0 0 0.125rem 0;
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

  // Flutter icon (official logo from vectorlogo.zone)
  Component _flutterIcon() {
    return raw('''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 64 64">
  <g transform="matrix(.061615 0 0 .061615 -1.430818 -1.2754)">
    <defs><path id="A" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="B"><use xlink:href="#A"/></clipPath>
    <g clip-path="url(#B)"><path d="M360.3 779.7L520 939.5 959.4 500H639.9z" fill="#39cefd"/></g>
    <defs><path id="C" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="D"><use xlink:href="#C"/></clipPath>
    <path clip-path="url(#D)" d="M639.9 20.7h319.5l-679 679.1L120.6 540z" fill="#39cefd"/>
    <defs><path id="E" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="F"><use xlink:href="#E"/></clipPath>
    <path clip-path="url(#F)" d="M520 939.5l119.9 119.8h319.5L679.8 779.7z" fill="#03569b"/>
    <defs><path id="G" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="H"><use xlink:href="#G"/></clipPath>
    <linearGradient id="I" gradientUnits="userSpaceOnUse" x1="566.635" y1="970.339" x2="685.65" y2="851.324">
      <stop offset="0" stop-color="#1a237e" stop-opacity=".4"/>
      <stop offset="1" stop-color="#1a237e" stop-opacity="0"/>
    </linearGradient>
    <path clip-path="url(#H)" d="M757 857.4l-77.2-77.7L520 939.5z" fill="url(#I)"/>
    <defs><path id="J" d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z"/></defs>
    <clipPath id="K"><use xlink:href="#J"/></clipPath>
    <g clip-path="url(#K)"><path d="M360.282 779.645L520.086 619.84 679.9 779.645 520.086 939.45z" fill="#16b9fd"/></g>
    <radialGradient id="L" cx="7824.659" cy="-2855.979" r="5082.889" gradientTransform="matrix(0.25,0,0,-0.25,-1812,-622.5)" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#fff" stop-opacity=".1"/>
      <stop offset="1" stop-color="#fff" stop-opacity="0"/>
    </radialGradient>
    <path d="M959.4 500L679.8 779.7l279.6 279.7H639.9L360.2 779.7 639.9 500h319.5zM639.9 20.7L120.6 540l159.8 159.8 679-679.1H639.9z" fill="url(#L)"/>
  </g>
</svg>
''');
  }

  // Dart icon (official logo from vectorlogo.zone)
  Component _dartIcon() {
    return raw('''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <path d="M17.582 17.424l-4.138-4.14.016 29.903.05 1.396c.02.66.145 1.4.345 2.17l32.775 11.56 8.2-3.63.007-.012L17.58 17.424z" fill="#00c4b3"/>
  <path d="M13.856 46.753h.003c-.003-.012-.008-.026-.014-.04.007.015.007.03.01.04zm40.966 7.93l-8.2 3.63-32.77-11.56c.625 2.404 2.012 5.106 3.502 6.58l10.69 10.637 23.788.03 2.98-9.317z" fill="#22d3c5"/>
  <g fill="#0075c9">
    <path d="M13.556 13.285L.813 32.53c-1.058 1.13-.53 3.462 1.173 5.18l7.356 7.416 4.624 1.63c-.2-.768-.326-1.5-.345-2.17l-.05-1.396-.015-29.903z"/>
    <path d="M46.9 13.67c-.77-.195-1.508-.318-2.173-.337l-1.478-.054-29.805.007 41.392 41.386 3.636-8.2-11.57-32.8z"/>
  </g>
  <path d="M46.862 13.663c.013.005.027.008.038.01v-.004c-.013-.003-.025-.003-.038-.008zm6.615 3.518c-1.505-1.515-4.17-2.9-6.577-3.508L58.47 46.47l-3.64 8.2 8.882-2.838.02-24.352-10.256-10.3z" fill="#00a8e1"/>
  <path d="M45.278 9.075l-7.4-7.36C36.152.018 33.82-.512 32.7.544l-19.244 12.74 29.805-.007 1.478.054c.665.02 1.404.142 2.173.337L45.28 9.073zm-31.833 4.2" fill="#00c4b3"/>
</svg>
''');
  }

  // Angular icon (official logo from vectorlogo.zone)
  Component _angularIcon() {
    return raw('''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
  <path d="M1 5.3L15.892 0l15.284 5.218-2.47 19.694L15.892 32 3.286 25.004 1 5.3z" fill="#e23237"/>
  <path d="M31.176 5.218L15.892 0v32l12.814-7.088 2.47-19.694z" fill="#b52e31"/>
  <path d="M15.915 3.74l-9.28 20.64 3.463-.07 1.87-4.664h8.3l2.032 4.7 3.302.07L15.915 3.74zm.023 6.626l3.14 6.557H13.2l2.747-6.557z" fill="#fff"/>
</svg>
''');
  }
}
