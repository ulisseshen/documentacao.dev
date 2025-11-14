import 'package:jaspr/jaspr.dart';

/// A component that displays donation buttons for Buy Me a Coffee and PIX.
class DonationButtons extends StatelessComponent {
  const DonationButtons({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'donation-section',
      [
        h3([text('💝 Apoie Este Projeto')]),
        p([
          text(
              'Manter documentação traduzida e atualizada requer tempo e dedicação. '
              'Suas doações nos ajudam a:')
        ]),
        ul([
          li([text('Manter as traduções sincronizadas com as versões originais')]),
          li([text('Melhorar a qualidade das traduções existentes')]),
          li([text('Adicionar documentação de novas tecnologias')]),
          li([text('Cobrir custos de hospedagem e infraestrutura')]),
        ]),
        div(
          classes: 'donation-buttons-grid',
          [
            a(
              href: 'https://www.buymeacoffee.com/documentacao',
              target: Target.blank,
              classes: 'donation-btn coffee-btn',
              [
                text('☕ Buy Me a Coffee'),
              ],
            ),
            a(
              href: '#',
              classes: 'donation-btn pix-btn',
              [
                text('💳 Doar via PIX'),
              ],
            ),
          ],
        ),
        raw('''
<style>
.donation-section {
  margin: 3rem 0;
  padding: 2rem;
  background: linear-gradient(135deg, rgba(0, 217, 255, 0.05), rgba(0, 102, 255, 0.05));
  border: 2px solid #00D9FF;
  border-radius: 16px;
}

.donation-section h3 {
  margin-top: 0;
  color: #00D9FF;
  font-size: 1.5rem;
  margin-bottom: 1rem;
}

.donation-section p {
  margin-bottom: 1rem;
  line-height: 1.6;
}

.donation-section ul {
  margin: 1rem 0 2rem 0;
  padding-left: 1.5rem;
}

.donation-section li {
  margin-bottom: 0.5rem;
}

.donation-buttons-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1rem;
  margin-top: 2rem;
}

.donation-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  padding: 1.25rem 1.5rem;
  border-radius: 12px;
  text-decoration: none;
  transition: all 0.3s ease;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  font-weight: 600;
  font-size: 1rem;
}

.donation-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.coffee-btn {
  background-color: #FFDD00;
  color: #000000;
}

.pix-btn {
  background: linear-gradient(135deg, #00D9FF, #0066ff);
  color: white;
}

@media (max-width: 768px) {
  .donation-buttons-grid {
    grid-template-columns: 1fr;
  }
}
</style>
'''),
      ],
    );
  }
}
