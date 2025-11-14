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
    <img src="/images/qrcode-pix.png" alt="QR Code PIX" class="qr-code">
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
  margin: 1rem auto;
  display: block;
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
