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
            // Angular Card
            _buildDocCard(
              icon: _angularIcon(),
              title: 'Angular Brasil',
              description: 'Documentação Angular em PT-BR',
              features: [
                'Framework para aplicações web',
                'Documentação traduzida',
                'Contribuições bem-vindas',
              ],
              url: 'https://angularbrasil.web.app',
              badgeText: null,
              accentColor: '#DD0031',
            ),
            // React Native Card (In Progress)
            _buildDocCard(
              icon: _reactNativeIcon(),
              title: 'React Native Brasil',
              description: 'Documentação React Native em PT-BR',
              features: [
                'Framework para aplicativos mobile',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em processo',
              accentColor: '#61DAFB',
            ),
            // Go Card (Coming Soon)
            _buildDocCard(
              icon: _goIcon(),
              title: 'Go Brasil',
              description: 'Documentação Go em PT-BR',
              features: [
                'Linguagem de programação moderna',
                'Em desenvolvimento',
                'Contribuições bem-vindas',
              ],
              url: null,
              badgeText: 'Em breve',
              accentColor: '#00ADD8',
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

  // React Native icon (official logo from vectorlogo.zone)
  Component _reactNativeIcon() {
    return raw('''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
  <g transform="matrix(.05696 0 0 .05696 .647744 2.43826)" fill="none" fill-rule="evenodd">
    <circle r="50.167" cy="237.628" cx="269.529" fill="#61DAFB"/>
    <g stroke="#61DAFB" stroke-width="24">
      <path d="M269.53 135.628c67.356 0 129.928 9.665 177.107 25.907 56.844 19.57 91.794 49.233 91.794 76.093 0 27.99-37.04 59.503-98.083 79.728-46.15 15.29-106.88 23.272-170.818 23.272-65.554 0-127.63-7.492-174.3-23.44-59.046-20.182-94.61-52.103-94.61-79.56 0-26.642 33.37-56.076 89.415-75.616 47.355-16.51 111.472-26.384 179.486-26.384z"/>
      <path d="M180.736 186.922c33.65-58.348 73.28-107.724 110.92-140.48C337.006 6.976 380.163-8.48 403.43 4.937c24.248 13.983 33.042 61.814 20.067 124.796-9.8 47.618-33.234 104.212-65.176 159.6-32.75 56.788-70.25 106.82-107.377 139.272-46.98 41.068-92.4 55.93-116.185 42.213-23.08-13.3-31.906-56.92-20.834-115.233 9.355-49.27 32.832-109.745 66.8-168.664z"/>
      <path d="M180.82 289.482C147.075 231.2 124.1 172.195 114.51 123.227c-11.544-59-3.382-104.11 19.864-117.566 24.224-14.024 70.055 2.244 118.14 44.94 36.356 32.28 73.688 80.837 105.723 136.173 32.844 56.733 57.46 114.21 67.036 162.582 12.117 61.213 2.31 107.984-21.453 121.74-23.057 13.348-65.25-.784-110.24-39.5-38.013-32.71-78.682-83.253-112.76-142.115z"/>
    </g>
  </g>
</svg>
''');
  }

  // Go icon (official logo from vectorlogo.zone)
  Component _goIcon() {
    return raw('''
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <style>.st0{fill:#00acd7}</style>
  <g>
    <path class="st0" d="M4.8 27.3c-.1 0-.2-.1-.1-.2l.7-.8c.1-.1.2-.2.3-.2h11.1c.1 0 .2.1.1.2l-.5.8c-.1.1-.2.2-.3.2H4.8zM.1 30.2c-.1 0-.1-.1-.1-.2l.7-.8c0-.1.2-.2.3-.2h14.2c.1 0 .2.1.2.2l-.2.7c0 .1-.2.2-.3.2l-14.8.1zM7.7 33c-.1 0-.2-.1-.1-.2l.4-.7c.1-.1.2-.2.3-.2h6.2c.1 0 .2.1.2.2l-.1.7c0 .1-.1.2-.2.2H7.7zM40 26.7l-5.2 1.4c-.5.1-.5.2-.9-.3-.5-.5-.8-.9-1.5-1.2-2-1-3.9-.7-5.6.5-2.1 1.4-3.2 3.4-3.2 5.9 0 2.5 1.7 4.5 4.2 4.9 2.1.3 3.9-.5 5.3-2.1.3-.3.5-.7.8-1.2h-6c-.7 0-.8-.4-.6-.9.4-1 1.2-2.6 1.6-3.4.1-.2.3-.5.8-.5H41c-.1.8-.1 1.7-.2 2.5-.3 2.2-1.2 4.3-2.6 6.1-2.2 3-5.2 4.8-8.9 5.3-3.1.4-5.9-.2-8.4-2.1-2.3-1.7-3.6-4.1-4-6.9-.4-3.4.6-6.4 2.6-9.1 2.2-2.9 5.1-4.7 8.7-5.4 2.9-.5 5.7-.2 8.3 1.5 1.7 1.1 2.8 2.6 3.6 4.4.4.4.3.5-.1.6z"/>
    <path class="st0" d="M50.3 44c-2.8-.1-5.4-.9-7.6-2.7-1.8-1.6-3-3.6-3.4-6-.6-3.5.4-6.6 2.5-9.4 2.3-3 5-4.5 8.7-5.2 3.2-.6 6.2-.2 8.9 1.6 2.5 1.7 4 4 4.4 6.9.5 4.2-.7 7.6-3.6 10.6-2.1 2.1-4.6 3.4-7.5 4-.7 0-1.6.1-2.4.2zm7.4-12.6c0-.4 0-.7-.1-1-.6-3.1-3.4-4.8-6.4-4.1-2.9.7-4.8 2.5-5.5 5.4-.6 2.4.6 4.9 2.9 5.9 1.7.7 3.4.7 5.1-.2 2.5-1.4 3.9-3.4 4-6z"/>
  </g>
</svg>
''');
  }
}
