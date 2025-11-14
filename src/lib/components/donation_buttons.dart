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
            // Comentado temporariamente - setup complicado
            // a(
            //   href: 'https://buymeacoffee.com/documentacaodev',
            //   target: Target.blank,
            //   classes: 'donation-btn coffee-btn',
            //   [
            //     text('☕ Buy Me a Coffee'),
            //   ],
            // ),
            button(
              classes: 'donation-btn pix-btn',
              id: 'pix-btn',
              [
                text('💳 Doar via PIX'),
              ],
            ),
          ],
        ),
        // Modal do QR Code Pix
        raw('''
<div id="pix-modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>PIX - QR Code</h2>
    <p>Escaneie o QR Code abaixo para doar:</p>
    <img src="data:image/png;base64,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" alt="QR Code PIX" class="qr-code">
    <p>Obrigado pelo seu apoio! 💚</p>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const modal = document.getElementById('pix-modal');
  const btn = document.getElementById('pix-btn');
  const span = document.getElementsByClassName('close')[0];

  if (btn && modal && span) {
    btn.onclick = function() {
      modal.style.display = 'block';
    }

    span.onclick = function() {
      modal.style.display = 'none';
    }

    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = 'none';
      }
    }
  }
});
</script>
'''),
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

/* Modal do Pix */
.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.6);
}

.modal-content {
  background-color: #fefefe;
  margin: 5% auto;
  padding: 2rem;
  border: 1px solid #888;
  border-radius: 16px;
  width: 90%;
  max-width: 500px;
  text-align: center;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.modal-content h2 {
  color: #00D9FF;
  margin-top: 0;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
  line-height: 20px;
}

.close:hover,
.close:focus {
  color: #000;
}

.qr-code {
  max-width: 100%;
  height: auto;
  margin: 1rem 0;
  border-radius: 8px;
}

/* Cursor pointer para o botão */
.pix-btn {
  cursor: pointer;
  border: none;
}
</style>
'''),
      ],
    );
  }
}
