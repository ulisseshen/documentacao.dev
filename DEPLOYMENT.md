# 🚀 Guia de Deploy - Firebase Hosting

Este guia explica como configurar o deploy automático para o Firebase Hosting usando GitHub Actions.

## 🔐 Segurança

Use sempre GitHub Secrets para armazenar informações sensíveis. Nunca commite credenciais no repositório.

## 📋 Pré-requisitos

1. Conta no [Firebase](https://firebase.google.com/)
2. Projeto Firebase criado (`transliteradu`)
3. Firebase CLI instalado localmente (opcional, para testes)

## 🔐 Configuração do GitHub Secrets

### Passo 1: Obter o Firebase Token

**Método 1: Usando Firebase CLI (Recomendado para CI/CD)**

```bash
# Instale o Firebase CLI
npm install -g firebase-tools

# Faça login e gere um token CI
firebase login:ci
```

Isso gerará um token. Copie-o para usar no próximo passo.

**Método 2: Usando Service Account**

1. Acesse o [Google Cloud Console](https://console.cloud.google.com/)
2. Selecione seu projeto `transliteradu`
3. Vá em **IAM & Admin** → **Service Accounts**
4. Clique em **Create Service Account**
5. Nome: `github-actions-deploy`
6. Dê a role: **Firebase Hosting Admin**
7. Clique em **Create Key** → escolha **JSON**
8. Baixe o arquivo JSON

### Passo 2: Adicionar Secret no GitHub

1. Vá para o seu repositório no GitHub
2. Clique em **Settings** → **Secrets and variables** → **Actions**
3. Clique em **New repository secret**
4. Nome: `FIREBASE_TOKEN`
5. Valor:
   - **Método 1**: Cole o token gerado pelo `firebase login:ci`
   - **Método 2**: Cole o conteúdo completo do arquivo JSON da service account
6. Clique em **Add secret**

## 🔄 Como Funciona o Deploy Automático

O deploy acontece automaticamente quando:

- ✅ Você faz push para a branch `main`
- ✅ Você executa manualmente via GitHub Actions

### Workflow

```
1. Checkout do código
2. Setup Dart SDK
3. Instala Jaspr CLI
4. Instala dependências (dart pub get)
5. Build do projeto Jaspr
6. Deploy para Firebase Hosting
```

## 🧪 Testando Localmente

Antes de fazer deploy, teste localmente:

```bash
# 1. Build do projeto
cd src
jaspr build

# 2. Instale Firebase CLI (se ainda não tiver)
npm install -g firebase-tools

# 3. Login no Firebase
firebase login

# 4. Teste localmente
firebase serve

# 5. Deploy manual (opcional)
firebase deploy --only hosting
```

## 📂 Estrutura de Arquivos

```
documentacao.dev/
├── .github/
│   └── workflows/
│       └── deploy-firebase.yml    # Workflow de deploy
└── src/
    ├── .firebaserc                # Config do projeto Firebase
    ├── firebase.json              # Config do Firebase Hosting
    └── build/
        └── jaspr/                 # Output do build (deployado)
```

## ⚙️ Configuração do Firebase

### firebase.json

```json
{
  "hosting": {
    "public": "build/jaspr",        // Diretório de build do Jaspr
    "cleanUrls": true,              // Remove .html das URLs
    "trailingSlash": false,         // Sem barra no final
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"  // SPA routing
      }
    ]
  }
}
```

## 🔍 Monitoramento

Após cada push para `main`:

1. Vá em **Actions** no GitHub
2. Veja o progresso do workflow
3. Se houver erro, clique no job para ver logs
4. Após sucesso, seu site estará em:
   - `https://transliteradu.web.app`
   - `https://transliteradu.firebaseapp.com`

## 🐛 Troubleshooting

### Erro: "Permission denied"

**Solução:** Verifique se o token tem permissões corretas:
- Role: `Firebase Hosting Admin`
- ou use um token gerado via `firebase login:ci`

### Erro: "Project not found"

**Solução:** Verifique se o projeto `transliteradu` existe no Firebase e se o `.firebaserc` está correto.

### Erro: "Build failed"

**Solução:** Teste o build localmente:
```bash
cd src
jaspr build
```

### Deploy manual

Se precisar fazer deploy manual:

```bash
cd src
jaspr build
firebase deploy --only hosting
```

## 🔒 Boas Práticas de Segurança

- ✅ Use GitHub Secrets para armazenar tokens
- ✅ Não commite arquivos de credenciais (`.json`, `.env`)
- ✅ Use service accounts com permissões mínimas necessárias
- ✅ Mantenha o `.gitignore` atualizado para excluir arquivos sensíveis

## 📞 Suporte

Se tiver problemas:

1. Verifique os logs no GitHub Actions
2. Teste o build localmente
3. Verifique as permissões do Firebase
4. Abra uma issue no repositório

## 🎉 Deploy Bem-Sucedido!

Após configurar tudo corretamente, cada push para `main` deployará automaticamente para:

**🌐 https://transliteradu.web.app**

---

**Dica:** Configure um domínio customizado no Firebase Console para usar `documentacao.dev`!
