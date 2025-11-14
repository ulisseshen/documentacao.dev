---
title: Como Contribuir
description: Guia para contribuir com o projeto Documentação.dev
---

# Como Contribuir

Esta documentação é mantida pela comunidade! Existem várias formas de contribuir para tornar este projeto ainda melhor.

## 🐛 Reportar Bugs

Encontrou um erro ou problema na documentação?

### Como Reportar

1.  Vá até a [página de issues no GitHub](https://github.com/ulisseshen/documentacao.dev/issues)
2.  Clique em "New Issue"
3.  Descreva o problema claramente:
    *   Onde você encontrou o erro
    *   O que estava esperando ver
    *   O que realmente viu
    *   Prints de tela, se possível

### Exemplo de um Bom Report

```
**Página:** /conceitos
**Problema:** Link quebrado na seção "Estado"
**Esperado:** Link deveria levar para /componentes
**Atual:** Link retorna erro 404
**Screenshot:** [anexar imagem]
```

## ✍️ Melhorar Traduções

Ajude a melhorar a qualidade das traduções existentes!

### O que Revisar

*   ❌ Erros de português
*   ❌ Traduções literais que não fazem sentido
*   ❌ Termos técnicos incorretos
*   ❌ Inconsistências na nomenclatura

### Como Contribuir com Traduções

1.  Fork o repositório
2.  Edite os arquivos markdown em `content/`
3.  Envie um Pull Request

<Info>
  **Dica:** Mantenha a consistência! Use sempre os mesmos termos para os mesmos conceitos.
</Info>

### Glossário de Termos

| Inglês | Português |
|--------|-----------|
| Component | Componente |
| State | Estado |
| Props | Propriedades |
| Hook | Hook (mantém em inglês) |
| Render | Renderizar |
| Build | Construir |

## 🌐 Solicitar Novas Traduções

Precisa da tradução de uma documentação específica que ainda não está disponível?

### Como Solicitar

[**📝 Clique aqui para solicitar uma tradução**](https://github.com/ulisseshen/documentacao.dev/issues/new?assignees=&labels=tradução%2Cdocumentação&template=solicitacao-traducao.yml&title=%5BTradução%5D+)

Ao solicitar uma tradução, você precisará fornecer:

*   **Título da documentação original** - Nome completo do documento
*   **Link da documentação original** - URL direta para a documentação
*   **Tipo de documentação** - Framework, linguagem, ferramenta, etc.
*   **Justificativa** - Por que esta tradução é importante para a comunidade
*   **Prioridade** - Urgência da solicitação

<Info>
  **Importante:** Antes de solicitar, verifique se a tradução já não foi solicitada nas [issues abertas](https://github.com/ulisseshen/documentacao.dev/issues?q=is%3Aissue+is%3Aopen+label%3Atradução).
</Info>

### Você Pode Ajudar?

Se você pode contribuir com a tradução solicitada, marque a opção correspondente no formulário. Traduções colaborativas são sempre bem-vindas!

## 📝 Adicionar Conteúdo

Quer adicionar novos artigos ou expandir os existentes?

### Estrutura de um Artigo

```
---
title: Título do Artigo
description: Breve descrição do conteúdo
---

# Título Principal

Introdução ao tema...

## Seção 1

Conteúdo da seção...

### Subseção

Detalhes adicionais...

## Exemplos

\`\`\`dart
// Código de exemplo
\`\`\`

## Próximos Passos

Links relacionados...
```

### Diretrizes de Escrita

*   ✅ Use linguagem clara e objetiva
*   ✅ Inclua exemplos práticos
*   ✅ Adicione diagramas quando útil
*   ✅ Organize com cabeçalhos hierárquicos
*   ✅ Use blockquotes para destacar dicas
*   ✅ Teste todos os exemplos de código

## 🎨 Melhorar o Design

Contribua com melhorias visuais e de UX!

### Áreas para Contribuir

*   Design de componentes
*   Cores e tipografia
*   Responsividade mobile
*   Acessibilidade
*   Performance

### Processo

1.  Abra uma issue descrevendo a melhoria
2.  Aguarde feedback da comunidade
3.  Implemente as mudanças
4.  Envie um Pull Request com screenshots

## 💰 Contribuir Financeiramente

Suas doações nos ajudam a:

*   ✅ Manter as traduções sincronizadas
*   ✅ Adicionar documentação de novas tecnologias
*   ✅ Melhorar infraestrutura e hospedagem
*   ✅ Cobrir custos de domínio e certificados

<DonationButtons/>

## 🔧 Desenvolvimento

### Configurando o Ambiente

1.  Clone o repositório:

```
git clone https://github.com/ulisseshen/documentacao.dev.git
cd documentacao.dev
```

2.  Instale as dependências:

```
dart pub get
```

3.  Inicie o servidor de desenvolvimento:

```
jaspr serve
```

4.  Acesse `http://localhost:8080`

### Estrutura do Projeto

<pre>
documentacao.dev/
├── content/          # Arquivos markdown da documentação
│   ├── _data/       # Configurações YAML
│   └── *.md         # Páginas da documentação
├── lib/             # Código Dart
│   ├── components/  # Componentes customizados
│   └── main.dart    # Ponto de entrada
├── web/             # Assets estáticos
└── pubspec.yaml     # Dependências
</pre>

### Fluxo de Trabalho

1.  Crie uma branch para sua feature:

```
git checkout -b feature/minha-feature
```

2.  Faça suas alterações

3.  Teste localmente:

```
jaspr serve
```

4.  Commit suas mudanças:

```
git add .
git commit -m "Adiciona [descrição]"
```

5.  Push para o GitHub:

```
git push origin feature/minha-feature
```

6.  Abra um Pull Request

### Padrões de Código

*   Use formatação Dart padrão: `dart format .`
*   Siga as convenções de nomenclatura
*   Adicione comentários quando necessário
*   Escreva código testável

## 📢 Divulgar o Projeto

Ajude a comunidade a crescer!

### Como Divulgar

*   ⭐ Dê uma estrela no GitHub
*   📱 Compartilhe nas redes sociais
*   💬 Fale sobre o projeto em comunidades
*   ✍️ Escreva artigos sobre a documentação
*   🎥 Crie vídeos tutoriais

## 🤝 Código de Conduta

Este projeto segue um código de conduta. Esperamos que todos os contribuidores:

*   Sejam respeitosos e inclusivos
*   Aceitem críticas construtivas
*   Foquem no que é melhor para a comunidade
*   Demonstrem empatia com outros membros

## 📜 Licença

Ao contribuir, você concorda que suas contribuições serão licenciadas sob a mesma licença do projeto (MIT).

## 💬 Precisa de Ajuda?

*   💬 Entre no nosso [Discord](https://discord.gg/documentacao)
*   🐦 Siga-nos no [Twitter](https://twitter.com/documentacaodev)
*   📧 Envie um email para: contato@documentacao.dev

## 🙏 Agradecimentos

Agradecemos a todos os contribuidores que ajudam a manter este projeto vivo e atualizado!

[Ver lista de contribuidores →](https://github.com/ulisseshen/documentacao.dev/graphs/contributors)

---

**Sua contribuição faz a diferença! Obrigado por fazer parte desta comunidade. 🇧🇷**
