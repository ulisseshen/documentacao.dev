# 📚 Documentação.dev

> Plataforma de documentação técnica de alta qualidade em Português do Brasil

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

## 🌟 Sobre o Projeto

O **Documentação.dev** é uma iniciativa da comunidade brasileira para fornecer documentação técnica traduzida e de alta qualidade em Português do Brasil. Acreditamos que quebrar a barreira do idioma é essencial para democratizar o acesso ao conhecimento em tecnologia.

### ✨ Características

- 🎨 **Design Moderno e Responsivo** - Interface limpa e amigável que funciona em todos os dispositivos
- 🌓 **Tema Claro/Escuro** - Alternar entre temas para melhor conforto visual
- 🔍 **Busca Inteligente** - Encontre rapidamente o que precisa (Ctrl/Cmd + K)
- 📱 **Mobile-First** - Otimizado para dispositivos móveis
- ⚡ **Performance** - Site estático ultra-rápido
- 🇧🇷 **100% em Português** - Todo o conteúdo em PT-BR

## 🚀 Como Usar

### Visualizar Localmente

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/documentacao.dev.git
cd documentacao.dev
```

2. Abra o arquivo `index.html` no seu navegador ou use um servidor local:

```bash
# Usando Python 3
python -m http.server 8000

# Usando Node.js (http-server)
npx http-server

# Usando PHP
php -S localhost:8000
```

3. Acesse `http://localhost:8000` no seu navegador

## 📁 Estrutura do Projeto

```
documentacao.dev/
├── index.html          # Página principal
├── styles.css          # Estilos e temas
├── script.js           # Funcionalidades interativas
├── README.md           # Este arquivo
└── LICENSE            # Licença MIT
```

## 🎨 Personalização

### Cores e Temas

As cores podem ser personalizadas editando as variáveis CSS em `styles.css`:

```css
:root {
    --accent-color: #00D9FF;
    --accent-hover: #00b8d4;
    /* ... outras variáveis */
}
```

### Adicionando Conteúdo

Para adicionar novas seções de documentação:

1. Adicione uma nova `<section>` em `index.html`:
```html
<section id="nova-secao">
    <h2>Nova Seção</h2>
    <p>Conteúdo aqui...</p>
</section>
```

2. Adicione o link na navegação lateral:
```html
<li><a href="#nova-secao">Nova Seção</a></li>
```

3. Adicione ao array de busca em `script.js`:
```javascript
{ title: 'Nova Seção', section: 'nova-secao', content: 'palavras-chave' }
```

## 💝 Como Apoiar

Este projeto é mantido pela comunidade e depende de doações para:

- ✅ Manter traduções atualizadas
- ✅ Adicionar documentação de novas tecnologias
- ✅ Melhorar a qualidade das traduções existentes
- ✅ Cobrir custos de hospedagem e infraestrutura

### Formas de Contribuir

- ☕ **Buy Me a Coffee**: [buymeacoffee.com/documentacao](https://www.buymeacoffee.com/documentacao)
- 💳 **PIX**: `documentacao@dev.com.br`
- 🔧 **Contribua com código**: Envie Pull Requests!
- 📝 **Melhore traduções**: Ajude a revisar e melhorar
- 🐛 **Reporte bugs**: Abra issues com sugestões

## 🤝 Como Contribuir

Contribuições são muito bem-vindas! Veja como você pode ajudar:

1. Faça um Fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

### Diretrizes

- Use português claro e objetivo
- Siga o guia de estilo existente
- Teste suas alterações em diferentes navegadores
- Mantenha o código limpo e bem documentado

## 🛠️ Tecnologias Utilizadas

- HTML5
- CSS3 (Variables, Grid, Flexbox)
- JavaScript (ES6+)
- Google Fonts (Inter, JetBrains Mono)

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🌍 Comunidade

- **GitHub**: [github.com/seu-usuario/documentacao.dev](https://github.com/seu-usuario/documentacao.dev)
- **Discord**: Em breve
- **Twitter**: Em breve

## 🙏 Agradecimentos

Agradecemos a todos os contribuidores que ajudam a manter este projeto vivo e atualizado!

---

Feito com ❤️ pela comunidade brasileira de desenvolvedores