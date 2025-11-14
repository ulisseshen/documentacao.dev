---
title: Instalação
description: Guia de instalação para começar com as ferramentas de desenvolvimento
---

# Instalação

Este guia irá ajudá-lo a instalar as ferramentas necessárias para começar a desenvolver.

## Pré-requisitos

Antes de começar, certifique-se de que você tem o seguinte instalado:

*   Sistema operacional: Windows, macOS ou Linux
*   Pelo menos 4GB de RAM
*   Conexão com a internet

## Instalação Rápida

### Usando npm

```
npm install @exemplo/pacote
```

### Usando yarn

```
yarn add @exemplo/pacote
```

### Usando pnpm

```
pnpm add @exemplo/pacote
```

<Info>
  **Recomendação:** Utilizamos o pnpm por ser mais rápido e eficiente no uso de espaço em disco.
</Info>

## Verificando a Instalação

Após a instalação, você pode verificar se tudo está funcionando corretamente:

```
npx exemplo --version
```

Se a instalação foi bem-sucedida, você verá a versão instalada.

## Configuração Inicial

Crie um novo projeto usando o comando:

```
npx create-exemplo meu-projeto
cd meu-projeto
```

### Estrutura do Projeto

Após criar o projeto, você terá a seguinte estrutura:

<pre>
meu-projeto/
├── src/
│   ├── index.js
│   └── App.js
├── public/
│   └── index.html
├── package.json
└── README.md
</pre>

## Próximos Passos

Agora que você instalou tudo, você pode:

*   📖 Ler sobre [conceitos básicos](/conceitos)
*   🧩 Explorar [componentes](/componentes)
*   🚀 Começar a desenvolver sua aplicação

## Problemas Comuns

### Erro de Permissão

Se você encontrar erros de permissão ao instalar pacotes globalmente, tente:

```
sudo npm install -g @exemplo/pacote
```

### Versão do Node.js

Certifique-se de estar usando Node.js versão 18 ou superior:

```
node --version
```

Se necessário, atualize o Node.js usando [nvm](https://github.com/nvm-sh/nvm) ou baixando a versão mais recente do [site oficial](https://nodejs.org/).

---

Precisa de ajuda? Visite nossa [comunidade](/about) ou abra uma issue no GitHub.
