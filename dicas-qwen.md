# 📚 Qwen CLI - Wiki de Comandos e Técnicas

> Guia completo de utilização do Qwen via linha de comando

---

## 🚀 Inicialização

| Comando | Descrição |
|---------|-----------|
| `qwen` | Inicia o modo interativo (REPL) |
| `qwen "mensagem"` | Envia mensagem única e recebe resposta |
| `qwen -c "mensagem"` | Executa comando rápido (alias para mensagem única) |
| `qwen --continue` | Continua a última conversa do histórico |
| `qwen --resume <id>` | Retoma conversa específica pelo ID |

---

## ⚡ Flags e Opções

### Execução e Controle

| Flag | Alias | Descrição |
|------|-------|-----------|
| `--yolo` | `-y` | Executa sem pedir confirmação |
| `--dry-run` | `-n` | Simula execução sem aplicar mudanças |
| `--force` | `-f` | Força execução mesmo com avisos |
| `--quiet` | `-q` | Modo silencioso, menos output |
| `--verbose` | `-v` | Modo detalhado, mais output |
| `--debug` | `-d` | Habilita logs de debug |

### Contexto e Arquivos

| Flag | Descrição |
|------|-----------|
| `--file <path>` | Inclui arquivo específico no contexto |
| `--dir <path>` | Inclui diretório no contexto |
| `--ignore <pattern>` | Ignora arquivos/padrões específicos |
| `--git` | Inclui histórico e status do git no contexto |
| `--no-context` | Não carrega contexto automático do projeto |

### Formato de Saída

| Flag | Descrição |
|------|-----------|
| `--json` | Output em formato JSON |
| `--markdown` | Output formatado em Markdown |
| `--raw` | Output cru, sem formatação |
| `--stream` | Streama resposta em tempo real |

---

## 🔮 Comandos Especiais (Dentro do REPL)

```
/comando          Descrição
─────────────────────────────────────────────────
/help             Mostra lista de comandos
/exit, /quit      Sai do Qwen (Ctrl+D também funciona)
/clear            Limpa o histórico da sessão
/history          Mostra histórico de conversas
/undo             Desfaz última ação do Qwen
/status           Mostra status do contexto atual
/files            Lista arquivos no contexto
/git              Mostra status do git
/config           Abre arquivo de configuração
/retry            Tenta novamente o último comando
/save <nome>      Salva conversa atual
/load <nome>      Carrega conversa salva
/token-count      Mostra contagem de tokens usados
/context          Mostra resumo do contexto atual
```

---

## 🎯 Padrões de Uso Avançados

### Pipes e Redirecionamentos

```bash
# Pipe de output de comando para o Qwen
git diff | qwen "explique as mudanças"

# Pipe para o Qwen analisar erro
npm run build 2>&1 | qwen "como corrigir estes erros?"

# Redirecionar output para arquivo
qwen "gere um template de README" > README.md

# Append ao arquivo existente
qwen "adicione seção de instalação" >> docs/guia.md

# Pipe chain
cat erro.log | qwen "analise" | qwen "resuma em português"
```

### Substituição de Comando

```bash
# Inserir conteúdo de arquivo na mensagem
qwen "refatore este código: $(cat src/app.js)"

# Múltiplos arquivos
qwen "compare estes arquivos: $(cat a.js) vs $(cat b.js)"

# Output de git
qwen "resuma este commit: $(git log -1 --pretty=%B)"
```

### Processamento em Lote

```bash
# Processar múltiplos arquivos
for f in *.py; do qwen --file "$f" "analise este arquivo"; done

# Buscar e processar
grep -r "TODO" src/ | qwen "organize estas tarefas"

# Todos os arquivos JS
qwen --dir src/ "liste todas as funções exportadas"
```

---

## 🛠️ Casos de Uso Comuns

### Desenvolvimento

```bash
# Gerar boilerplate
qwen "crie estrutura de projeto React com TypeScript"

# Explicar código legado
qwen --file legado.py "explique o que esta função faz"

# Refatoração assistida
qwen --yolo "converta callbacks para Promises em src/"

# Gerar testes
qwen "crie testes unitários para $(cat src/calculadora.js)"

# Documentação automática
qwen --file api.js "gere JSDoc para todas as funções"
```

### Debug e Troubleshooting

```bash
# Analisar stack trace
qwen "debug: $(cat crash.log)"

# Explicar erro de build
webpack 2>&1 | qwen "o que está causando este erro?"

# Sugerir fixes
qwen --git "quais problemas este commit pode causar?"

# Performance
qwen --file app.py "sugira otimizações de performance"
```

### Git e Versionamento

```bash
# Gerar mensagem de commit
git diff --staged | qwen "gere mensagem de commit concisa"

# Explicar mudanças
qwen --git "resumo das mudanças desde a última tag"

# Code review
qwen --git "quais riscos você vê nestas mudanças?"

# Preparar PR
qwen --git "gere descrição para pull request"
```

### Aprendizado e Pesquisa

```bash
# Explicar conceitos
qwen "explique closures em JavaScript com exemplos"

# Comparar abordagens
qwen "REST vs GraphQL: prós e contras para API de e-commerce"

# Traduzir código
qwen "converta este Python para Go: $(cat script.py)"

# Boilerplate de padrões
qwen "implemente Singleton pattern em TypeScript"
```

---

## 📁 Gerenciamento de Contexto

### Incluindo Arquivos

```bash
# Arquivo único
qwen --file config.json "valide este JSON"

# Múltiplos arquivos
qwen --file a.js --file b.js "compare as implementações"

# Diretório inteiro
qwen --dir src/components "liste todos os componentes"

# Com padrão glob
qwen --dir src/ --ignore "*.test.js" "analise o código"
```

### Contexto do Git

```bash
# Incluir diff atual
qwen --git "o que mudou?"

# Histórico recente
qwen --git "analise os últimos 5 commits"

# Branch específica
qwen --git "diff entre main e develop"
```

---

## ⚙️ Configuração

### Arquivo de Config (~/.qwenrc ou .qwenrc no projeto)

```json
{
  "model": "qwen-plus",
  "temperature": 0.7,
  "maxTokens": 4096,
  "autoContext": true,
  "defaultIgnore": ["node_modules", ".git", "dist"],
  "aliases": {
    "review": "--git code review",
    "fix": "--yolo analyze and fix",
    "test": "generate unit tests"
  }
}
```

### Variáveis de Ambiente

```bash
export QWEN_MODEL="qwen-max"
export QWEN_TEMPERATURE="0.5"
export QWEN_MAX_TOKENS="8192"
export QWEN_API_KEY="sua-chave-aqui"
```

---

## 🎨 Aliases e Atalhos (Shell)

Adicione ao seu `~/.bashrc` ou `~/.zshrc`:

```bash
# Atalhos úteis
alias q='qwen'
alias qy='qwen --yolo'
alias qd='qwen --dry-run'
alias qg='qwen --git'

# Funções personalizadas
qwen-review() { git diff --staged | qwen "code review: $*" }
qwen-fix() { qwen --yolo "analise e corrija: $*" }
qwen-test() { qwen "crie testes para: $*" }
qwen-doc() { qwen --file "$1" "gere documentação" }

# Commit message automática
qwen-commit() {
  git diff --staged | qwen "gere mensagem de commit convencional" | git commit -F -
}
```

---

## 📊 Comparação de Modelos

| Modelo | Uso Recomendado | Tokens | Velocidade |
|--------|-----------------|--------|------------|
| `qwen-turbo` | Tarefas rápidas, simples | ~32K | ⚡⚡⚡ |
| `qwen-plus` | Uso geral, balanceado | ~128K | ⚡⚡ |
| `qwen-max` | Tarefas complexas, análise profunda | ~256K | ⚡ |

---

## 🐛 Troubleshooting

### Problemas Comuns

```bash
# Contexto muito grande
qwen --no-context "pergunta específica"

# Timeout em operações longas
export QWEN_TIMEOUT=300000  # 5 minutos

# Limpar cache
qwen /clear-cache

# Resetar configuração
rm ~/.qwenrc && qwen --init
```

### Logs e Debug

```bash
# Habilitar logs detalhados
qwen --debug "sua pergunta"

# Ver logs em tempo real
tail -f ~/.qwen/qwen.log

# Reportar bug
qwen --debug "report: descreva o problema"
```

---

## 📝 Exemplos de Workflow

### Workflow de Feature Nova

```bash
# 1. Planejar
qwen "planeje implementação de autenticação JWT"

# 2. Gerar boilerplate
qwen --yolo "crie estrutura de auth com os arquivos necessários"

# 3. Implementar
qwen --file src/auth.js "complete a função login"

# 4. Testar
qwen --file src/auth.test.js "crie testes para auth"

# 5. Review
qwen --git "review das mudanças de auth"

# 6. Commit
git diff --staged | qwen "mensagem de commit" | git commit -F -
```

### Workflow de Bug Fix

```bash
# 1. Analisar erro
cat error.log | qwen "qual a causa raiz?"

# 2. Localizar problema
qwen --dir src/ "onde pode estar o bug de null pointer?"

# 3. Corrigir
qwen --yolo --file src/buggy.js "corrija o null pointer"

# 4. Validar
qwen --git "esta correção pode quebrar algo?"

# 5. Testar
qwen "crie teste que reproduz e valida o fix"
```

---

## 🔗 Recursos Adicionais

- **Documentação Oficial**: `qwen --help`
- **Versão**: `qwen --version`
- **Config**: `qwen /config`
- **Histórico**: `qwen /history`
- **Community**: Discord/Slack da comunidade

---

> 💡 **Dica Pro**: Combine `--yolo` com `--dry-run` primeiro para ver o que seria feito, depois execute de verdade.
