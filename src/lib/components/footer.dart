import 'package:jaspr/jaspr.dart';

/// Component that displays a custom footer with Jaspr logo
class CustomFooter extends StatelessComponent {
  const CustomFooter({super.key});

  @override
  Component build(BuildContext context) {
    return raw('''
<footer class="custom-footer">
  <div class="footer-content">
    <p>Feito com ❤️ pela comunidade brasileira de desenvolvedores</p>
    <a href="https://github.com/schultek/jaspr" target="_blank" rel="noopener noreferrer" class="footer-logo">
      <img src="/images/jaspr-logo.svg" alt="Feito com Jaspr" width="106" height="40">
    </a>
  </div>
</footer>

<style>
.custom-footer {
  margin-top: 4rem;
  padding: 2rem 1rem;
  text-align: center;
  border-top: 1px solid #e5e7eb;
  background: linear-gradient(to bottom, transparent, rgba(0, 217, 255, 0.03));
}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
}

.footer-content p {
  margin: 0;
  color: #6b7280;
  font-size: 0.95rem;
}

.footer-logo {
  display: inline-block;
  transition: transform 0.2s ease, opacity 0.2s ease;
  opacity: 0.9;
}

.footer-logo:hover {
  transform: translateY(-2px);
  opacity: 1;
}

@media (prefers-color-scheme: dark) {
  .custom-footer {
    border-top-color: #374151;
    background: linear-gradient(to bottom, transparent, rgba(0, 217, 255, 0.05));
  }

  .footer-content p {
    color: #9ca3af;
  }
}
</style>
''');
  }
}
