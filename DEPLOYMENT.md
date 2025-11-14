# 🚀 Guia de Deploy - Firebase Hosting

Este guia explica como configurar o deploy automático para o Firebase Hosting usando GitHub Actions.

## 🔐 Segurança

Use sempre GitHub Secrets para armazenar informações sensíveis. Nunca commite credenciais no repositório.

## 📋 Pré-requisitos

1. Conta no [Firebase](https://firebase.google.com/)
2. Projeto Firebase criado (`transliteradu`)
3. Firebase CLI instalado localmente (opcional, para testes)

## 🔐 Configuração do GitHub Secrets

### Passo 1: Criar Service Account

1. Acesse o [Google Cloud Console](https://console.cloud.google.com/)
2. Selecione seu projeto `transliteradu`
3. Vá em **IAM & Admin** → **Service Accounts**
4. Clique em **Create Service Account**
5. Nome: `github-actions-deploy`
6. Descrição: `Service account para deploy via GitHub Actions`
7. Clique em **Create and Continue**
8. Adicione as seguintes roles:
   - **Firebase Hosting Admin** (`roles/firebasehosting.admin`)
   - **Service Account User** (`roles/iam.serviceAccountUser`)
9. Clique em **Continue** → **Done**
10. Na lista de service accounts, clique na que você criou
11. Vá na aba **Keys**
12. Clique em **Add Key** → **Create new key**
13. Escolha **JSON**
14. Clique em **Create** - o arquivo será baixado automaticamente

### Passo 2: Adicionar Secret no GitHub

1. Vá para o seu repositório no GitHub
2. Clique em **Settings** → **Secrets and variables** → **Actions**
3. Clique em **New repository secret**
4. Nome: `FIREBASE_SERVICE_ACCOUNT`
5. Valor: Cole o **conteúdo completo** do arquivo JSON baixado
6. Clique em **Add secret**

**Importante:** Após adicionar o secret no GitHub, **delete o arquivo JSON** do seu computador por segurança.

## 🔄 Como Funciona o Deploy Automático

O deploy acontece automaticamente quando:

- ✅ Você faz push para a branch `main` (deploy em produção)
- ✅ Você abre ou atualiza um Pull Request (deploy de preview)
- ✅ Você executa manualmente via GitHub Actions

### Deploy de Produção (main)

Quando você faz push para a branch `main`, o site é deployado para produção em:
- `https://documentacaodev.web.app`
- `https://documentacaodev.firebaseapp.com`

### Deploy de Preview (Pull Requests)

Quando você abre ou atualiza um Pull Request:
- 🚀 Um deploy de preview é criado automaticamente
- 💬 O bot comenta no PR com a URL do preview
- 🔄 **O comentário é atualizado** automaticamente em cada novo commit (não cria comentários duplicados)
- 🗑️ O preview é deletado quando o PR é fechado ou mergeado

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

**Solução:** Verifique se a service account tem as roles necessárias:
- `Firebase Hosting Admin` (`roles/firebasehosting.admin`)
- `Service Account User` (`roles/iam.serviceAccountUser`)

Verifique também se o JSON no GitHub Secret está completo e correto.

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
