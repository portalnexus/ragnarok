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

## 🔐 Segurança e Gerenciamento de API

### Gerenciamento de Chaves API

| Comando | Descrição |
|---------|-----------|
| `qwen --auth login` | Inicia processo de autenticação |
| `qwen --auth logout` | Remove credenciais salvas |
| `qwen --auth status` | Verifica status da autenticação |
| `qwen --auth rotate` | Rotaciona chave API atual |
| `qwen --secure-mode` | Habilita modo seguro (sem logs) |

### Exemplos Práticos

```bash
# Login interativo com salvamento seguro
qwen --auth login

# Verificar se autenticação está ativa
qwen --auth status

# Logout e limpeza de credenciais
qwen --auth logout

# Rotacionar chave API (invalida anterior)
qwen --auth rotate

# Modo seguro para ambientes compartilhados
qwen --secure-mode "analise este código sensível"

# Usar chave temporária (não salva)
QWEN_API_KEY_TEMP="chave-temp" qwen "pergunta única"

# Verificar permissões da chave atual
qwen --auth permissions
```

### Boas Práticas de Segurança

```bash
# Nunca commitar chaves no git
echo "QWEN_API_KEY" >> .gitignore

# Usar variáveis de ambiente em CI/CD
# GitHub Actions example:
# - name: Qwen Task
#   env:
#     QWEN_API_KEY: ${{ secrets.QWEN_API_KEY }}
#   run: qwen "analise o PR"

# Limpar histórico do shell após uso sensível
history -c && history -w

# Usar vault de secrets em produção
qwen --vault aws-secrets-manager "use chave do vault"
```

---

## 🎨 Personalização de Output e Temas

### Temas e Formatação

| Flag/Comando | Descrição |
|--------------|-----------|
| `--theme <nome>` | Aplica tema de cores (dark/light/minimal) |
| `--font-size <tamanho>` | Ajusta tamanho da fonte no REPL |
| `--syntax <linguagem>` | Força syntax highlighting específico |
| `--no-colors` | Desabilita cores no output |
| `--compact` | Output compacto, menos linhas em branco |
| `/theme` | Muda tema dentro do REPL |

### Exemplos Práticos

```bash
# Aplicar tema escuro para sessões noturnas
qwen --theme dark "explique este código"

# Tema minimalista para capturas de tela
qwen --theme minimal "gere snippet de exemplo"

# Ajustar fonte para apresentações
qwen --font-size 16 --theme high-contrast "demonstre funcionalidade"

# Forçar syntax highlighting para linguagem específica
qwen --syntax python --file script.py "otimize este código"

# Output sem cores para logs automatizados
qwen --no-colors --json "status do sistema" > log.json

# Modo compacto para terminal pequeno
qwen --compact "resumo das mudanças no git"

# Mudar tema dinamicamente no REPL
/theme solarized-dark
```

### Templates de Output

```bash
# Template para documentação técnica
qwen --template docs "gere documentação da API"

# Template para changelog
qwen --template changelog --git "o que mudou?"

# Template para release notes
qwen --template release --git "prepare release notes v2.0"

# Template para email técnico
qwen --template email "resuma o bug fix para o cliente"

# Template para apresentação
qwen --template slides "crie slides sobre arquitetura"
```

---

## 🤝 Colaboração e Exportação

### Formatos de Exportação

| Comando | Descrição |
|---------|-----------|
| `qwen --export pdf <session>` | Exporta sessão como PDF |
| `qwen --export html <session>` | Exporta sessão como HTML |
| `qwen --export markdown <session>` | Exporta sessão como Markdown |
| `qwen --export json <session>` | Exporta sessão como JSON |
| `qwen --share <session>` | Gera link compartilhável |
| `qwen --publish <session>` | Publica em workspace da equipe |

### Exemplos Práticos

```bash
# Exportar sessão de debugging como PDF
qwen --export pdf session-123 > debug-report.pdf

# Exportar conversa técnica em HTML
qwen --export html session-456 > knowledge-base.html

# Exportar para Markdown (compatível com wikis)
qwen --export markdown session-789 > doc.md

# Exportar dados estruturados em JSON
qwen --export json session-000 > analysis.json

# Gerar link compartilhável (expira em 7 dias)
qwen --share session-abc
# Output: https://qwen.dev/share/abc123xyz

# Publicar no workspace da equipe
qwen --publish session-def --workspace "engineering"

# Exportar com metadados completos
qwen --export json --with-metadata session-ghi > full-export.json

# Exportar apenas código gerado
qwen --export code-only session-jkl > generated-code.zip
```

### Colaboração em Equipe

```bash
# Criar workspace compartilhado
qwen --workspace create "projeto-alpha"

# Adicionar membros ao workspace
qwen --workspace add-member user @email.com

# Compartilhar contexto do projeto
qwen --workspace share-context "projeto-alpha"

# Sessão colaborativa em tempo real
qwen --collab-session start --room "room-123"

# Exportar histórico do workspace
qwen --workspace export-history "projeto-alpha" > team-history.json

# Gerar relatório de atividade
qwen --workspace report "projeto-alpha" --period "last-week"
```

---

## ⌨️ Atalhos de Teclado no REPL

### Navegação e Edição

| Atalho | Ação |
|--------|------|
| `Ctrl + P` / `↑` | Comando anterior no histórico |
| `Ctrl + N` / `↓` | Próximo comando no histórico |
| `Ctrl + R` | Busca reversa no histórico |
| `Ctrl + G` | Cancelar busca |
| `Ctrl + A` / `Home` | Início da linha |
| `Ctrl + E` / `End` | Fim da linha |
| `Ctrl + K` | Cortar até fim da linha |
| `Ctrl + U` | Cortar linha inteira |
| `Ctrl + Y` | Colar último corte |
| `Ctrl + W` | Cortar palavra anterior |
| `Alt + D` | Cortar próxima palavra |
| `Ctrl + L` | Limpar tela |

### Comandos Especiais

| Atalho | Ação |
|--------|------|
| `Ctrl + D` | Sair do REPL (EOF) |
| `Ctrl + C` | Cancelar comando atual |
| `Ctrl + Z` | Suspender sessão |
| `Ctrl + T` | Transpor caracteres |
| `Alt + T` | Transpor palavras |
| `Ctrl + _` | Desfazer (undo) |
| `Ctrl + Shift + Z` | Refazer (redo) |
| `F1` | Abrir ajuda contextual |
| `F2` | Salvar sessão rápida |
| `F3` | Carregar última sessão |
| `F5` | Refresh do contexto |
| `F12` | Toggle debug mode |

### Exemplos Práticos

```bash
# Usar busca reversa para encontrar comando antigo
# Pressione Ctrl+R e digite "git" para buscar comandos com git

# Editar comando longo sem redigitar
# Use Ctrl+A para ir ao início, edite, Enter para executar

# Copiar e colar dentro do REPL
# Ctrl+K corta até fim, Ctrl+Y cola

# Navegar histórico eficientemente
# Ctrl+P repetidamente para comandos anteriores

# Limpar tela sem perder histórico
# Ctrl+L limpa visual, /clear limpa memória

# Salvar sessão rapidamente durante trabalho
# F2, digite nome, Enter

# Acessar ajuda sem sair do fluxo
# F1 mostra comandos disponíveis no contexto atual
```

---

## ♿ Acessibilidade

### Recursos de Acessibilidade

| Flag/Comando | Descrição |
|--------------|-----------|
| `--screen-reader` | Output otimizado para leitores de tela |
| `--high-contrast` | Tema de alto contraste |
| `--large-text` | Aumenta tamanho do texto |
| `--verbose-errors` | Mensagens de erro detalhadas |
| `--audio-feedback` | Feedback sonoro para ações |
| `--dyslexia-font` | Usa fonte amigável para dislexia |

### Exemplos Práticos

```bash
# Otimizar output para VoiceOver/NVDA
qwen --screen-reader "explique o código"

# Sessão com alto contraste
qwen --high-contrast --theme dark "analise este arquivo"

# Aumentar texto para melhor legibilidade
qwen --large-text --font-size 20 "demonstre exemplos"

# Erros detalhados para melhor compreensão
qwen --verbose-errors "execute esta tarefa"

# Feedback sonoro para confirmações
qwen --audio-feedback --yolo "corrija os erros"

# Fonte especializada para dislexia
qwen --dyslexia-font "gere documentação clara"

# Combinação para máxima acessibilidade
qwen --screen-reader --high-contrast --large-text --verbose-errors "ajuda completa"
```

### Configuração Permanente

```bash
# Adicionar ao ~/.qwenrc para acessibilidade persistente
{
  "accessibility": {
    "screenReader": true,
    "highContrast": true,
    "fontSize": 18,
    "dyslexiaFont": true,
    "verboseErrors": true
  }
}

# Variáveis de ambiente para acessibilidade
export QWEN_ACCESSIBILITY_SCREEN_READER=true
export QWEN_ACCESSIBILITY_HIGH_CONTRAST=true
export QWEN_FONT_SIZE=18
```

---

## 🔌 Integrações e Extensões

### Integração com IDEs

| Integração | Comando/Setup |
|------------|---------------|
| VS Code | `qwen --install-extension vscode` |
| JetBrains | `qwen --install-extension jetbrains` |
| Vim/Neovim | `qwen --install-extension vim` |
| Emacs | `qwen --install-extension elpa` |
| Sublime | `qwen --install-extension sublime` |

### Integração com CI/CD

| Plataforma | Exemplo |
|------------|---------|
| GitHub Actions | `uses: qwen/action @v1` |
| GitLab CI | `image: qwen/cli:latest` |
| Jenkins | `qwen --ci-analyze` |
| CircleCI | `qwen --orb` |
| Azure DevOps | `qwen --task` |

### Exemplos Práticos

```bash
# Instalar extensão VS Code
qwen --install-extension vscode

# Instalar plugin Vim
qwen --install-extension vim
# Adicionar ao .vimrc: nnoremap <leader>q :!qwen %<CR>

# Usar no GitHub Actions
# .github/workflows/qwen.yml:
# - uses: qwen/action@v1
#   with:
#     prompt: "Code review das mudanças"
#     api-key: ${{ secrets.QWEN_API_KEY }}

# Análise automática no CI
qwen --ci-analyze --fail-on-warnings

# Integração com pre-commit hooks
# .pre-commit-config.yaml:
# - repo: https://github.com/qwen/pre-commit
#   hooks:
#     - id: qwen-review

# Pipeline GitLab CI
# image: qwen/cli:latest
# review:
#   script:
#     - qwen --git "code review"

# Jenkins pipeline
# stage('Qwen Review') {
#   steps {
#     sh 'qwen --ci-analyze src/'
#   }
# }

# Hook de pre-push
# .git/hooks/pre-push:
# qwen --git "validate commit messages" || exit 1
```

### Webhooks e APIs

```bash
# Configurar webhook para notificações
qwen --webhook configure --url "https://api.slack.com/..."

# Disparar notificação após tarefa longa
qwen --notify --webhook "tarefa completada"

# Integração com Slack
qwen --slack-channel "#dev" --notify "build completado"

# Integração com Discord
qwen --discord-webhook "url" --notify "review pronto"

# API REST para automação
curl -X POST http://localhost:8080/qwen \
  -H "Content-Type: application/json" \
  -d '{"prompt": "analise o código", "file": "src/app.js"}'
```

---

## 🧠 Engenharia de Prompt

### Técnicas de Prompting

| Técnica | Descrição | Exemplo |
|---------|-----------|---------|
| Zero-shot | Prompt direto sem exemplos | "Traduza para Python" |
| Few-shot | Com exemplos de entrada/saída | "Ex1: ... Ex2: ... Agora:" |
| Chain-of-thought | Pedir raciocínio passo a passo | "Pense passo a passo" |
| Role-playing | Atribuir papel específico | "Atue como senior dev" |
| Template | Usar estrutura padronizada | Contexto, Tarefa, Formato |

### Exemplos Práticos

```bash
# Zero-shot prompting (direto)
qwen "otimize esta função para performance"

# Few-shot prompting (com exemplos)
qwen "converta para funcional:
Ex1: function soma(a,b){return a+b} → const soma = (a,b) => a+b
Ex2: function mult(a,b){return a*b} → const mult = (a,b) => a*b
Agora: function divide(a,b){return a/b}"

# Chain-of-thought (raciocínio explícito)
qwen "pense passo a passo para debugar este erro: $(cat error.log)"

# Role-playing (papel específico)
qwen "atue como tech lead sênior e faça code review deste PR"

# Template estruturado
qwen "
CONTEXTO: Desenvolvimento de API REST
TAREFA: Criar endpoint de autenticação
REQUISITOS: JWT, refresh token, rate limiting
FORMATO: Código + explicação
"

# Prompt iterativo (refinamento)
qwen "gere função de validação de email"
# ... após resposta ...
qwen "agora adicione validação de domínio corporativo"

# Prompt com restrições
qwen "explique recursão sem usar analogias de bonecas russas"

# Prompt para debugging sistemático
qwen "
1. Identifique o erro
2. Explique a causa raiz
3. Sugira 3 soluções
4. Implemente a melhor solução
"
```

### Padrões de Prompt Avançados

```bash
# Prompt de decomposição
qwen "quebre esta tarefa em subtarefas executáveis: implementar auth completa"

# Prompt de verificação
qwen "verifique se este código trata todos os edge cases: $(cat code.js)"

# Prompt de comparação
qwen "compare estas 3 abordagens e recomende a melhor: A) ... B) ... C) ..."

# Prompt de expansão
qwen "expanda este pseudocódigo para implementação completa: $(cat pseudo.txt)"

# Prompt de contração
qwen "resuma esta documentação em 5 pontos-chave: $(cat docs.md)"

# Prompt de transformação
qwen "transforme este código procedural em orientado a objetos: $(cat code.py)"

# Prompt de geração de testes
qwen "gere testes que cubram 100% dos branches deste código"

# Prompt de documentação
qwen "gere docs no formato: descrição, params, retorno, exemplos, erros"
```

---

## 🔄 Gerenciamento de Sessões Avançado

### Comandos de Sessão

| Comando | Descrição |
|---------|-----------|
| `qwen --session new <nome>` | Cria nova sessão nomeada |
| `qwen --session list` | Lista todas as sessões |
| `qwen --session load <nome>` | Carrega sessão existente |
| `qwen --session save <nome>` | Salva sessão atual |
| `qwen --session delete <nome>` | Remove sessão |
| `qwen --session export <nome>` | Exporta sessão |
| `qwen --session fork <nome>` | Cria cópia da sessão |
| `qwen --session merge <a> <b>` | Mescla duas sessões |

### Exemplos Práticos

```bash
# Criar sessão para projeto específico
qwen --session new "projeto-auth"

# Listar sessões disponíveis
qwen --session list

# Carregar sessão anterior
qwen --session load "projeto-auth"

# Salvar ponto de checkpoint
qwen --session save "checkpoint-pre-refactor"

# Fork para experimentação
qwen --session fork "projeto-auth" --name "projeto-auth-experimental"

# Mesclar sessões de diferentes branches
qwen --session merge "feature-a" "feature-b"

# Exportar sessão para backup
qwen --session export "projeto-auth" --format json > backup.json

# Carregar sessão e continuar
qwen --session load "projeto-auth" --continue

# Sessões temporárias (auto-delete após 1h)
qwen --session new "temp-debug" --ttl 3600

# Taggear sessões para organização
qwen --session tag "projeto-auth" --tags "auth,security,backend"

# Buscar sessão por tag
qwen --session find --tag "auth"
```

### Sessões Paralelas

```bash
# Múltiplas sessões em paralelo
qwen --session new "session-1" &
qwen --session new "session-2" &

# Alternar entre sessões no REPL
/session switch "session-1"

# Copiar contexto entre sessões
/session copy-context from:"session-1" to:"session-2"

# Comparar sessões
qwen --session compare "session-a" "session-b"

# Sincronizar sessões
qwen --session sync "session-1" "session-2" --direction both
```

---

## 🎯 Workflows de Produtividade

### Workflow de Code Review

```bash
# 1. Setup do review
qwen --session new "review-$(date +%Y%m%d)"

# 2. Carregar contexto do PR
qwen --git --dir src/ "contexto completo do PR"

# 3. Análise estática
qwen "analise padrões de código e anti-padrões"

# 4. Verificação de segurança
qwen "identifique vulnerabilidades potenciais"

# 5. Checagem de performance
qwen "aponte possíveis gargalos de performance"

# 6. Sugestão de melhorias
qwen "liste 5 melhorias prioritárias"

# 7. Gerar comentário para PR
qwen --template pr-comment "resumo do review"

# 8. Salvar para referência
qwen --session save "review-completo"
```

### Workflow de Onboarding

```bash
# 1. Explicar estrutura do projeto
qwen --dir . "explique a estrutura deste projeto"

# 2. Mapear dependências
qwen "mapeie o grafo de dependências"

# 3. Identificar pontos de entrada
qwen "quais são os arquivos principais para começar?"

# 4. Configurar ambiente
qwen "gere guia de setup do ambiente"

# 5. Primeiras tarefas
qwen "sugira 3 tarefas boas para iniciantes"

# 6. Documentar convenções
qwen --dir src/ "extraia convenções de código deste projeto"

# 7. Criar cheat sheet
qwen --export markdown "gere cheat sheet do projeto"
```

### Workflow de Migração

```bash
# 1. Análise do código legado
qwen --dir legacy/ "analise arquitetura atual"

# 2. Planejar migração
qwen "plano de migração para TypeScript em 5 fases"

# 3. Migrar arquivo piloto
qwen --file legacy/app.js "converta para TypeScript"

# 4. Validar migração
qwen "verifique se há erros de tipo"

# 5. Gerar scripts de migração
qwen "crie script para migrar arquivos em lote"

# 6. Documentar mudanças
qwen "documente breaking changes da migração"

# 7. Criar guia de rollback
qwen "gere procedimento de rollback se necessário"
```

### Workflow de Documentação

```bash
# 1. Extrair estrutura de código
qwen --dir src/ "liste todas as classes e funções públicas"

# 2. Gerar docs de API
qwen --template api-docs "documente toda a API"

# 3. Criar exemplos de uso
qwen "gere exemplos de uso para cada função"

# 4. Validar documentação
qwen "verifique se há funções sem documentação"

# 5. Gerar README
qwen --template readme "crie README completo"

# 6. Criar changelog
qwen --template changelog --git "gere changelog desde v1.0"

# 7. Publicar docs
qwen --export html --output docs/ "documentação completa"
```

---

## 🔐 Segurança e Gerenciamento de API

### Autenticação

| Comando | Descrição |
|---------|-----------|
| `qwen --auth login` | Inicia login interativo |
| `qwen --auth logout` | Remove credenciais locais |
| `qwen --auth status` | Verifica status da autenticação |
| `qwen --auth rotate` | Rotaciona chave de API |

### Exemplos

```bash
# Login interativo
qwen --auth login

# Verificar status
qwen --auth status
# Output: Authenticated as user@example.com (expires in 29 days)

# Rotacionar chave (útil após vazamento)
qwen --auth rotate
# Gera nova chave e invalida a anterior

# Login com chave específica
qwen --auth login --key $QWEN_API_KEY
```

### Modo Seguro

```bash
# Habilitar modo seguro (não salva histórico sensível)
qwen --secure-mode "analise este código com credenciais"

# Usar com password manager
qwen --file <(pass show api-key) "use esta chave para..."
```

### Integração com Password Managers

```bash
# 1Password
qwen --file <(op read "op://vault/api-key") "analise"

# KeePass
qwen --file <(keepassxc-cli show database key) "analise"

# LastPass
qwen --file <(lpass show api-key --clip) "analise"
```

### Variáveis de Ambiente

```bash
# Configurar chave via env
export QWEN_API_KEY="sk-..."
qwen "mensagem"

# Ou usar arquivo .env
source .env && qwen "mensagem"
```

---

## 🎨 Personalização de Output e Temas

### Temas Disponíveis

| Tema | Descrição | Comando |
|------|-----------|---------|
| `cyberpunk` | Verde neon, fundo escuro (default) | `--theme cyberpunk` |
| `light` | Tema claro padrão | `--theme light` |
| `dark` | Tema escuro padrão | `--theme dark` |
| `matrix` | Verde matrix, preto | `--theme matrix` |
| `sunset` | Tons quentes laranja/roxo | `--theme sunset` |
| `monochrome` | Preto e branco | `--theme monochrome` |
| `high-contrast` | Alto contraste | `--theme high-contrast` |
| `dracula` | Tema Dracula popular | `--theme dracula` |

### Exemplos de Uso

```bash
# Usar tema específico
qwen --theme matrix "explique código"

# Mudar tema no REPL
/theme cyberpunk

# Configurar tema padrão
qwen --config-set theme "dark"

# Listar temas disponíveis
qwen --theme list
```

### Templates de Output

```bash
# Output formatado para documentação
qwen --template docs "gere documentação desta função"

# Output para changelog
qwen --template changelog "resumo das mudanças"

# Output para release notes
qwen --template release "notas de release"

# Output para email
qwen --template email "resumo para stakeholders"

# Output para slides
qwen --template slides "pontos principais da apresentação"
```

### Opções de Formatação

| Opção | Descrição |
|-------|-----------|
| `--font-size <n>` | Tamanho da fonte (8-24) |
| `--syntax <tema>` | Tema de syntax highlighting |
| `--no-colors` | Output sem cores |
| `--compact` | Modo compacto, menos espaçamento |

```bash
# Aumentar fonte para apresentação
qwen --font-size 16 "mostre código"

# Syntax highlighting específico
qwen --syntax monokai "código colorido"

# Output sem cores (para logs)
qwen --no-colors "mensagem" > log.txt

# Modo compacto
qwen --compact "resumo breve"
```

---

## 🤝 Colaboração e Exportação

### Exportação de Conversas

| Formato | Comando | Descrição |
|---------|---------|-----------|
| PDF | `--export pdf` | Exporta como PDF formatado |
| HTML | `--export html` | Exporta como página HTML |
| Markdown | `--export markdown` | Exporta como .md |
| JSON | `--export json` | Exporta como JSON estruturado |

### Exemplos de Exportação

```bash
# Exportar sessão atual como PDF
qwen --session export "minha-sessao" --format pdf > sessao.pdf

# Exportar como HTML
qwen --export html --output docs/conversa.html "resumo"

# Exportar como Markdown
qwen --export markdown > conversa.md

# Exportar como JSON (para processamento)
qwen --export json > dados.json
```

### Compartilhamento

```bash
# Compartilhar conversa por email
qwen --share user@example.com "sessao-completa"

# Publicar como gist público
qwen --publish --platform gist "snippet"

# Publicar como documento Notion
qwen --export notion --page-id="abc123" "documentação"
```

### Workspaces Colaborativos

```bash
# Criar workspace compartilhado
qwen --workspace create "projeto-x" --members user1,user2

# Listar workspaces
qwen --workspace list

# Entrar em workspace
qwen --workspace join "projeto-x"

# Sair do workspace
qwen --workspace leave "projeto-x"

# Compartilhar contexto no workspace
qwen --workspace share-context "arquivo-importante.js"
```

---

## ⌨️ Atalhos de Teclado no REPL

### Navegação

| Atalho | Ação |
|--------|------|
| `Ctrl+P` | Histórico anterior (Previous) |
| `Ctrl+N` | Histórico próximo (Next) |
| `Ctrl+R` | Buscar no histórico (Reverse search) |
| `Ctrl+G` | Ir para linha/comando específico |
| `Ctrl+A` | Ir para início da linha (Beginning) |
| `Ctrl+E` | Ir para fim da linha (End) |
| `Ctrl+K` | Cortar do cursor até fim da linha |
| `Ctrl+U` | Cortar do início até o cursor |
| `Ctrl+Y` | Colar último corte (Yank) |
| `Ctrl+W` | Cortar palavra anterior |

### Edição

| Atalho | Ação |
|--------|------|
| `Alt+D` | Cortar palavra seguinte |
| `Ctrl+L` | Limpar tela |
| `Ctrl+_` | Desfazer (Undo) |

### Sistema

| Atalho | Ação |
|--------|------|
| `Ctrl+D` | Sair do REPL (EOF) |
| `Ctrl+C` | Cancelar comando atual |
| `Ctrl+Z` | Suspender (background) |
| `Ctrl+T` | Transpor caracteres |
| `Alt+T` | Transpor palavras |

### Ajuda e Informações

| Atalho | Ação |
|--------|------|
| `F1` | Ajuda geral |
| `F2` | Lista de comandos |
| `F3` | Histórico |
| `F4` | Status do contexto |
| `F5` | Refresh/retry |
| `F12` | Debug mode |
| `Shift+Z` | Zen mode (sem distrações) |

### Exemplos de Uso

```bash
# Workflow eficiente de edição
1. Digite comando longo
2. Ctrl+A para ir ao início
3. Ctrl+R para buscar no histórico
4. Ctrl+K para cortar parte indesejada
5. Ctrl+Y para colar em outro lugar

# Navegação rápida no histórico
qwen> Ctrl+R
(busca) git
# Mostra último comando com "git"
# Enter para usar, Ctrl+R para próximo match
```

---

## ♿ Acessibilidade

### Comandos de Acessibilidade

| Comando | Descrição |
|---------|-----------|
| `--screen-reader` | Otimiza output para leitores de tela |
| `--high-contrast` | Habilita modo alto contraste |
| `--large-text` | Aumenta tamanho da fonte |
| `--verbose-errors` | Mensagens de erro detalhadas |
| `--audio-feedback` | Feedback sonoro para ações |
| `--dyslexia-font` | Fonte especial para dislexia |

### Exemplos de Configuração

```bash
# Modo screen reader
qwen --screen-reader "explique este código"

# Alto contraste
qwen --high-contrast "mensagem"

# Texto grande
qwen --large-text --font-size 18 "código"

# Erros detalhados
qwen --verbose-errors "comando complexo"

# Feedback de áudio
qwen --audio-feedback "tarefa longa"
```

### Configuração Persistente

```json
// ~/.qwen/config.json
{
  "accessibility": {
    "screenReader": true,
    "highContrast": false,
    "fontSize": 16,
    "verboseErrors": true,
    "audioFeedback": false,
    "dyslexiaFont": "OpenDyslexic"
  }
}
```

### Variáveis de Ambiente

```bash
# Configurar via env vars
export QWEN_SCREEN_READER=true
export QWEN_HIGH_CONTRAST=true
export QWEN_FONT_SIZE=16
export QWEN_VERBOSE_ERRORS=true

qwen "mensagem"
```

### Leitores de Tela Suportados

| Leitor | Sistema | Status |
|--------|---------|--------|
| NVDA | Windows | ✅ Testado |
| JAWS | Windows | ✅ Testado |
| VoiceOver | macOS | ✅ Testado |
| Orca | Linux | ✅ Testado |

---

## 🔌 Integrações e Extensões

### IDEs e Editores

| IDE | Plugin/Extensão | Instalação |
|-----|-----------------|------------|
| VS Code | Qwen CLI Integration | `ext install qwen.cli-integration` |
| JetBrains | Qwen Assistant | `Plugins → Qwen` |
| Vim/Neovim | qwen.vim | `Plug 'qwen/qwen.vim'` |
| Emacs | qwen-mode | `M-x package-install qwen` |
| Sublime | QwenCLI | `Package Control → QwenCLI` |

### Exemplos de Integração VS Code

```json
// settings.json
{
  "qwen.defaultModel": "qwen-max",
  "qwen.autoSaveContext": true,
  "qwen.theme": "cyberpunk"
}
```

```json
// keybindings.json
{
  "key": "ctrl+shift+q",
  "command": "qwen.explainSelection",
  "when": "editorHasSelection"
}
```

### CI/CD

#### GitHub Actions

```yaml
# .github/workflows/ai-review.yml
name: AI Code Review

on: [pull_request]

jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: AI Review
        run: |
          qwen --file ${{ github.event.pull_request.diff }} \
            "faça code review focando em segurança e performance" \
            --export markdown > review.md
      
      - name: Comment PR
        uses: actions/github-script@v6
        with:
          script: |
            const fs = require('fs')
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: fs.readFileSync('review.md', 'utf8')
            })
```

#### GitLab CI

```yaml
# .gitlab-ci.yml
ai-review:
  stage: review
  script:
    - qwen --git "analise mudanças deste MR"
    - qwen --file src/ "verifique padrões de código"
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
```

#### Jenkins

```groovy
// Jenkinsfile
pipeline {
    agent any
    stages {
        stage('AI Review') {
            steps {
                sh '''
                    qwen --file $(git diff --name-only HEAD~1) \
                        "analise mudanças"
                '''
            }
        }
    }
}
```

### Webhooks

#### Slack

```json
{
  "webhooks": {
    "incoming": {
      "slack": {
        "url": "https://hooks.slack.com/services/XXX/YYY/ZZZ",
        "events": ["task.started", "task.completed"]
      }
    }
  }
}
```

#### Discord

```json
{
  "webhooks": {
    "incoming": {
      "discord": {
        "url": "https://discord.com/api/webhooks/XXX/YYY",
        "events": ["task.completed"]
      }
    }
  }
}
```

#### Payload Exemplo

```json
{
  "event": "task.completed",
  "timestamp": "2026-02-22T10:30:00Z",
  "data": {
    "taskId": "abc-123",
    "result": "success",
    "output": "Análise concluída com 3 recomendações"
  }
}
```

---

## 🧠 Engenharia de Prompt

### Técnicas Fundamentais

| Técnica | Descrição | Exemplo |
|---------|-----------|---------|
| Zero-shot | Prompt direto sem exemplos | "Traduza para Python" |
| Few-shot | Com exemplos de entrada/saída | "Ex1: ... Ex2: ... Agora:" |
| Chain-of-thought | Pede raciocínio passo-a-passo | "Pense passo-a-passo" |
| Role-playing | Atribui papel específico | "Atue como senior dev" |
| Template-based | Usa estrutura padronizada | Ver templates abaixo |

### Padrões Avançados

| Padrão | Uso | Exemplo |
|--------|-----|---------|
| Decomposition | Divide problema complexo | "Quebre em sub-tarefas" |
| Verification | Pede verificação | "Verifique se há erros" |
| Comparison | Compara abordagens | "REST vs GraphQL" |
| Expansion | Expande explicação | "Explique como para iniciante" |
| Contraction | Resume conteúdo | "Resuma em 3 pontos" |
| Transformation | Transforma formato | "Converta para JSON" |

### Templates de Prompt

```bash
# Template para code review
qwen "
CONTEXTO: Code review de pull request
FOCO: Segurança, performance, legibilidade
FORMATO: Lista de issues com prioridade

CÓDIGO:
$(cat src/novo-arquivo.js)
"

# Template para debugging
qwen "
PROBLEMA: $(cat erro.log)
CONTEXTO: Aplicação Node.js, última mudança foi X
TENTATIVAS: Já tentei A, B, C

SAÍDA ESPERADA: Causa raiz e solução passo-a-passo
"

# Template para geração de código
qwen "
TAREFA: Criar função de autenticação JWT
REQUISITOS: 
  - Node.js com Express
  - Refresh tokens
  - Rate limiting
RESTRIÇÕES:
  - Sem dependências externas além de jsonwebtoken
  - TypeScript

SAÍDA: Código completo + testes unitários
"
```

### Exemplos Práticos

```bash
# Few-shot prompting
qwen "
Exemplo 1:
Input: 'hello world'
Output: 'HELLO WORLD'

Exemplo 2:
Input: 'foo bar'
Output: 'FOO BAR'

Agora converta: 'test case'
"

# Chain-of-thought
qwen "
Analise este código passo-a-passo:
1. Identifique o propósito
2. Liste dependências
3. Aponte problemas potenciais
4. Sugira melhorias

$(cat src/app.js)
"

# Role-playing
qwen "
Atue como um engenheiro de segurança sênior.
Revise este código focando em:
- Injeção de SQL
- XSS
- CSRF
- Vazamento de dados

$(cat src/api.js)
"
```

### Dicas de Prompt Eficiente

1. **Seja específico**: "Explique closures" → "Explique closures em JavaScript para iniciante"
2. **Dê contexto**: Inclua versão, framework, restrições
3. **Defina formato**: "Lista", "Tabela", "Código + explicação"
4. **Itere**: Comece amplo, refine baseado na resposta
5. **Use exemplos**: Few-shot melhora qualidade significativamente

---

## 🔄 Gerenciamento de Sessões Avançado

### Comandos de Sessão

| Comando | Descrição |
|---------|-----------|
| `--session new <nome>` | Cria nova sessão nomeada |
| `--session list` | Lista sessões disponíveis |
| `--session load <id>` | Carrega sessão existente |
| `--session save <nome>` | Salva sessão atual |
| `--session delete <id>` | Remove sessão |
| `--session export <id>` | Exporta sessão (json/md/pdf) |
| `--session fork <id>` | Cria cópia da sessão |
| `--session merge <id1> <id2>` | Mescla duas sessões |

### Exemplos de Uso

```bash
# Criar sessão para projeto
qwen --session new "projeto-alpha"

# Listar sessões
qwen --session list
# Output:
# projeto-alpha (2.3MB, última atividade: 5min atrás)
# projeto-beta (1.1MB, última atividade: 1h atrás)

# Carregar sessão
qwen --session load "projeto-alpha"

# Salvar checkpoint
qwen --session save "checkpoint-pre-migration"

# Exportar sessão
qwen --session export "projeto-alpha" --format pdf > relatorio.pdf
```

### Sessões Paralelas

```bash
# Múltiplas sessões em paralelo
qwen --session new "analise-seguranca" &
qwen --session new "analise-performance" &

# Alternar entre sessões no REPL
/session switch "analise-seguranca"

# Copiar contexto entre sessões
/session copy-context from:"analise-seguranca" to:"relatorio-final"
```

### Fork e Merge

```bash
# Fork para experimentação
qwen --session fork "sessao-original" --name "sessao-experimental"

# Merge de sessões
qwen --session merge "sessao-a" "sessao-b" --output "sessao-combinada"

# Merge com filtro
qwen --session merge "a" "b" --max-tokens=50000

# Comparar sessões
qwen --session compare "sessao-a" "sessao-b"
```

### Troubleshooting

#### Erro: "Session not found"

```bash
# Causa: ID incorreto ou sessão expirada
# Solução:
qwen --session list
qwen --session load <id-correto>
```

#### Erro: "Merge conflict"

```bash
# Causa: Contextos incompatíveis
# Solução:
qwen --session export session-a > a.json
qwen --session export session-b > b.json
jq -s '.[0] * .[1]' a.json b.json | qwen --session import
```

#### Erro: "Context size exceeded"

```bash
# Causa: Sessão muito grande
# Solução:
qwen --session merge --max-tokens=50000 session-a session-b
```

---

## ❓ FAQ - Perguntas Frequentes

### 1. Como inicio uma nova sessão?
```bash
qwen --session new "nome-da-sessao"
```

### 2. Como vejo o histórico de conversas?
```bash
qwen --history
# Ou dentro do REPL: /history
```

### 3. O que é o modo --yolo?
O modo `--yolo` executa comandos sem pedir confirmação. Útil para automação.

### 4. Como exporto uma conversa?
```bash
qwen --session export "nome" > conversa.json
```

### 5. Posso usar offline?
Sim! Use `qwen --offline` para usar o modelo local.

### 6. Como troco de modelo?
```bash
qwen --model=qwen-max "tarefa complexa"
qwen --model=qwen-turbo "tarefa simples"
qwen --model=qwen-coder "programação"
```

### 7. O que é contexto persistente?
É a capacidade de manter contexto entre sessões automaticamente.

### 8. Como limpo o cache?
```bash
qwen --cache-mode=clear
```

### 9. Posso processar múltiplos arquivos?
Sim! Use `--batch` ou `--files`:
```bash
qwen --batch "analise" --files *.js
```

### 10. Como configuro webhooks?
Edite o arquivo de configuração ou use:
```bash
qwen --config-set webhooks.incoming.slack.url "URL"
```

### 11. O que são plugins?
Plugins são extensões que adicionam funcionalidades ao Qwen.

### 12. Como instalo um plugin?
```bash
qwen --plugin install nome-do-plugin
```

### 13. Posso usar com Notion?
Sim! Use `--export notion` para exportar diretamente.

### 14. Como vejo uso de tokens?
```bash
qwen --token-count
# Ou no REPL: /tokens
```

### 15. Como reporto bugs?
Abra uma issue no GitHub: https://github.com/qwen/qwen-cli/issues

---

## 📋 Guia de Referência Rápida

### Comandos Mais Usados

| Comando | Descrição | Exemplo |
|---------|-----------|---------|
| `qwen "msg"` | Mensagem única | `qwen "explique isso"` |
| `qwen --file` | Incluir arquivo | `qwen --file app.js "analise"` |
| `qwen --yolo` | Sem confirmação | `qwen --yolo "refatore"` |
| `qwen --session` | Gerenciar sessão | `qwen --session new "proj"` |
| `qwen --batch` | Processar em lote | `qwen --batch "teste" --files *.py` |
| `qwen --export` | Exportar conversa | `qwen --export pdf > doc.pdf` |

### Flags Essenciais

| Flag | Alias | Uso |
|------|-------|-----|
| `--yolo` | `-y` | Executa sem confirmar |
| `--dry-run` | `-n` | Simula execução |
| `--verbose` | `-v` | Output detalhado |
| `--debug` | `-d` | Log de debug |
| `--quiet` | `-q` | Modo silencioso |
| `--force` | `-f` | Força execução |

### Atalhos REPL

| Atalho | Ação |
|--------|------|
| `Ctrl+D` | Sair |
| `Ctrl+L` | Limpar tela |
| `Ctrl+P` | Histórico anterior |
| `Ctrl+N` | Histórico próximo |
| `Ctrl+R` | Buscar no histórico |
| `Ctrl+A` | Início da linha |
| `Ctrl+E` | Fim da linha |
| `Ctrl+K` | Cortar até fim |
| `Ctrl+U` | Cortar do início |
| `Ctrl+Y` | Colar |

### Códigos de Erro Comuns

| Erro | Causa | Solução |
|------|-------|---------|
| `ERR_AUTH` | Não autenticado | `qwen --auth login` |
| `ERR_CONTEXT` | Contexto muito grande | `--max-tokens` ou nova sessão |
| `ERR_SESSION` | Sessão inválida | `qwen --session list` |
| `ERR_NETWORK` | Sem conexão | `qwen --offline` |
| `ERR_RATE` | Limite excedido | Aguardar ou aumentar limite |

### Modelos Disponíveis

| Modelo | Uso Recomendado | Contexto |
|--------|-----------------|----------|
| `qwen-max` | Tarefas complexas | 256K tokens |
| `qwen-turbo` | Tarefas simples | 128K tokens |
| `qwen-coder` | Programação | 256K tokens |
| `qwen-vision` | Análise de imagens | 128K tokens |

---

## 🔄 Migração de Outros CLIs

### De Gemini CLI

| Gemini CLI | Qwen CLI |
|------------|----------|
| `gemini "msg"` | `qwen "msg"` |
| `gemini -p` | `qwen --continue` |
| `gemini --show-tool-use` | `qwen --verbose` |
| `gemini --model` | `qwen --model` |

**Diferenças principais:**
- Qwen tem contexto maior (256K vs 128K)
- Qwen suporta múltiplos modelos
- Qwen tem modo offline
- Qwen é mais barato ($20 vs $25/mês)

### De Claude Code

| Claude Code | Qwen CLI |
|-------------|----------|
| `claude "msg"` | `qwen "msg"` |
| `claude resume` | `qwen --resume` |
| `claude /clear` | `qwen /clear` |
| `claude /help` | `qwen /help` |

**Diferenças principais:**
- Qwen é mais rápido em tarefas simples
- Qwen tem melhor gerenciamento de sessões
- Claude tem melhor integração enterprise
- Qwen tem mais opções de exportação

### De Cursor CLI

| Cursor | Qwen CLI |
|--------|----------|
| `cursor ask "msg"` | `qwen "msg"` |
| `cursor edit` | `qwen --file` |
| `cursor chat` | `qwen --session` |

**Diferenças principais:**
- Cursor é focado em IDE
- Qwen é standalone CLI
- Qwen tem mais integrações
- Cursor tem melhor UX de editor

---

## 🔗 Recursos Adicionais

- **Documentação Oficial**: `qwen --help`
- **Versão**: `qwen --version`
- **Config**: `qwen /config`
- **Histórico**: `qwen /history`
- **Community**: Discord/Slack da comunidade
- **Status Page**: https://status.qwen.dev
- **Changelog**: https://github.com/qwen/cli/releases
- **Feature Requests**: https://github.com/qwen/cli/issues
- **Awesome Qwen**: https://github.com/qwen/awesome-qwen
- **Guia de Migração**: https://qwen.ai/docs/migration-guide

---

> 💡 **Dica Pro**: Combine `--yolo` com `--dry-run` primeiro para ver o que seria feito, depois execute de verdade.

> 🎯 **Dica de Produtividade**: Use sessões nomeadas para contextos diferentes (ex: `--session new "projeto-a"`) e alterne entre eles sem perder o contexto.

> 🔒 **Dica de Segurança**: Em ambientes compartilhados, sempre use `--secure-mode` e limpe o histórico do shell após sessões sensíveis.

> ♿ **Dica de Acessibilidade**: Configure `--screen-reader` e `--verbose-errors` para melhor experiência com leitores de tela.

> 🎨 **Dica de Personalização**: Use `--template docs` ou `--template changelog` para outputs formatados prontos para uso.

---

# 🟡 Micro Editor - Guia Completo

> Editor de texto moderno para terminal com suporte a mouse e atalhos convencionais

---

## 📦 Instalação

### Linux

```bash
# Método recomendado (todos os distros)
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin/

# Ubuntu/Debian (Snap)
sudo snap install micro --classic

# Arch Linux
sudo pacman -S micro

# Fedora
sudo dnf install micro

# openSUSE
sudo zypper install micro
```

### macOS

```bash
# Homebrew (recomendado)
brew install micro

# MacPorts
sudo port install micro
```

### Windows

```powershell
# Scoop (recomendado)
scoop install micro

# Chocolatey
choco install micro-editor

# Winget
winget install zyedidia.micro
```

### Verificar Instalação

```bash
# Verificar versão
micro --version

# Verificar ajuda
micro --help
```

---

## 🎯 Comandos de Linha de Comando

### Sintaxe Básica

```bash
micro [opções] <arquivo>[:<linha>:<coluna>] [...]
```

### Flags e Opções

| Flag | Alias | Descrição | Exemplo |
|------|-------|-----------|---------|
| `+<linha>:<coluna>` | `-startpos` | Posição inicial do cursor | `micro +10:5 file.txt` |
| `-diff` | | Modo diff entre arquivos | `micro -diff a.txt b.txt` |
| `-readonly` | | Abre em modo somente leitura | `micro -readonly config.json` |
| `-nomouse` | | Desabilita suporte a mouse | `micro -nomouse file.txt` |
| `-syntax <lang>` | | Define sintaxe manualmente | `micro -syntax python script.py` |
| `-config <dir>` | | Diretório de configuração | `micro -config ~/.config/micro` |
| `-debug` | | Modo de debug | `micro -debug file.txt` |
| `--help` | `-h` | Mostra ajuda | `micro --help` |
| `--version` | `-v` | Mostra versão | `micro --version` |

### Exemplos de Uso

```bash
# Abrir arquivo simples
micro arquivo.txt

# Abrir na linha 42
micro +42 arquivo.txt

# Abrir múltiplos arquivos (abas)
micro arquivo1.txt arquivo2.txt arquivo3.txt

# Modo diff
micro -diff original.txt modificado.txt

# Somente leitura
micro -readonly /etc/config.json

# Abrir com sintaxe específica
micro -syntax python script.py

# Abrir arquivo em diretório específico
micro /path/to/file.txt
```

---

## ⌨️ Atalhos de Teclado

### Básicos

| Atalho | Ação |
|--------|------|
| `Ctrl+S` | Salvar |
| `Ctrl+Q` | Sair |
| `Ctrl+O` | Salvar como |
| `Ctrl+N` | Novo arquivo |
| `Ctrl+Z` | Desfazer |
| `Ctrl+Y` | Refazer |
| `Ctrl+C` | Copiar |
| `Ctrl+X` | Cortar |
| `Ctrl+V` | Colar |
| `Ctrl+F` | Localizar |
| `Ctrl+H` | Localizar e substituir |
| `Ctrl+K` | Cortar linha |
| `Ctrl+J` | Colar linha |

### Navegação

| Atalho | Ação |
|--------|------|
| `Setas` | Mover cursor |
| `Ctrl+A` | Início da linha |
| `Ctrl+E` | Fim da linha |
| `Ctrl+Home` | Início do arquivo |
| `Ctrl+End` | Fim do arquivo |
| `Ctrl+P` | Página anterior |
| `Ctrl+N` | Próxima página |
| `Alt+<` | Início do arquivo |
| `Alt+>` | Fim do arquivo |
| `Ctrl+D` | Meia página abaixo |
| `Ctrl+U` | Meia página acima |

### Seleção

| Atalho | Ação |
|--------|------|
| `Shift+Setas` | Selecionar texto |
| `Ctrl+Shift+A` | Selecionar até início da linha |
| `Ctrl+Shift+E` | Selecionar até fim da linha |
| `Ctrl+Shift+Home` | Selecionar até início do arquivo |
| `Ctrl+Shift+End` | Selecionar até fim do arquivo |
| `Alt+Shift+<` | Selecionar tudo |
| `Ctrl+Shift+I` | Selecionar palavra atual |

### Múltiplos Cursores

| Atalho | Ação |
|--------|------|
| `Alt+Shift+Setas` | Adicionar cursor |
| `Alt+Click` | Adicionar cursor com mouse |
| `Ctrl+Shift+Up/Down` | Adicionar cursor acima/abaixo |
| `Esc` | Remover cursores extras |

### Janelas e Abas

| Atalho | Ação |
|--------|------|
| `Ctrl+E, vsplit` | Divisão vertical |
| `Ctrl+E, hsplit` | Divisão horizontal |
| `Ctrl+Tab` | Alternar abas |
| `Ctrl+Shift+Tab` | Alternar abas (reverso) |
| `Ctrl+W, q` | Fechar janela |
| `Ctrl+W, v` | Dividir vertical |
| `Ctrl+W, s` | Dividir horizontal |

### Comandos Internos (Ctrl+E)

| Comando | Descrição |
|---------|-----------|
| `vsplit` | Dividir verticalmente |
| `hsplit` | Dividir horizontalmente |
| `termon` | Abrir terminal interno |
| `termoff` | Fechar terminal interno |
| `save` | Salvar arquivo |
| `saveas <file>` | Salvar como |
| `open <file>` | Abrir arquivo |
| `tab <file>` | Abrir em nova aba |
| `goto <linha>` | Ir para linha |
| `find <texto>` | Localizar texto |
| `replace <a> <b>` | Substituir a por b |
| `set <opção> <valor>` | Configurar opção |
| `plugin install <nome>` | Instalar plugin |
| `plugin remove <nome>` | Remover plugin |
| `quit` | Sair |

---

## 🔌 Plugins

### Instalação de Plugins

```bash
# Dentro do Micro (Ctrl+E)
plugin install <nome-do-plugin>

# Exemplos
plugin install autospell
plugin install markdown
plugin install gofmt
```

### Plugins Essenciais

| Plugin | Descrição | Instalação |
|--------|-----------|------------|
| `autospell` | Verificação ortográfica automática | `plugin install autospell` |
| `markdown` | Preview de Markdown | `plugin install markdown` |
| `gofmt` | Formatação automática de Go | `plugin install gofmt` |
| `python-indent` | Indentação Python inteligente | `plugin install python-indent` |
| `comment` | Comentários rápidos | `plugin install comment` |
| `multiple-cursors` | Múltiplos cursores avançados | `plugin install multiple-cursors` |
| `open` | Abrir arquivos com sistema | `plugin install open` |
| `rainbow` | Parênteses coloridos | `plugin install rainbow` |

### Gerenciando Plugins

```bash
# Listar plugins instalados
plugin list

# Atualizar todos os plugins
plugin update all

# Remover plugin
plugin remove <nome>

# Verificar atualizações
plugin update
```

---

## ⚙️ Configuração

### Arquivo de Configuração

**Localização:** `~/.config/micro/settings.json`

### Configurações Principais

```json
{
  "colorscheme": "monokai",
  "tabsize": 4,
  "tabstospaces": true,
  "softwrap": true,
  "autosave": 30,
  "backup": true,
  "ignorecase": false,
  "incsearch": true,
  "hlsearch": true,
  "number": true,
  "relativenumber": false,
  "colorcolumn": 80,
  "autoindent": true,
  "smartpaste": true,
  "splitright": true,
  "splitbottom": true,
  "mouse": true,
  "syntax": true
}
```

### Temas Disponíveis

```bash
# Listar temas
ls ~/.config/micro/colorschemes/

# Temas incluídos:
# - default
# - monokai
# - solarized-dark
# - solarized-light
# - dracula
# - nord
# - gruvbox
# - one-dark
# - atom-one-dark
# - zenburn
```

### Mudar Tema

```bash
# Dentro do Micro (Ctrl+E)
set colorscheme dracula

# Ou no settings.json
{
  "colorscheme": "dracula"
}
```

### Bindings Personalizados

**Arquivo:** `~/.config/micro/bindings.json`

```json
{
  "Ctrl-S": "command:save",
  "Ctrl-Q": "command:quit",
  "Ctrl-/": "command:comment",
  "F5": "command:termon",
  "Alt-h": "command:hsplit",
  "Alt-v": "command:vsplit"
}
```

---

## 🔄 Comparativo: Micro vs Outros Editores

### Micro vs Nano

| Feature | Micro | Nano |
|---------|-------|------|
| Suporte a mouse | ✅ | ❌ (novo: sim) |
| Syntax highlighting | ✅ | ✅ |
| Plugins | ✅ | ❌ |
| Múltiplos cursores | ✅ | ❌ |
| Divisão de janelas | ✅ | ❌ |
| Abas | ✅ | ✅ |
| Curva de aprendizado | Baixa | Baixa |
| Tamanho | ~5MB | ~200KB |

**Veredito:** Micro é melhor para desenvolvimento, Nano para edições rápidas.

### Micro vs Vim

| Feature | Micro | Vim |
|---------|-------|-----|
| Atalhos convencionais | ✅ | ❌ |
| Suporte a mouse | ✅ | ⚠️ (limitado) |
| Curva de aprendizado | Baixa | Alta |
| Poder/flexibilidade | Médio | Alto |
| Plugins | ✅ | ✅ (mais) |
| Modo visual | ✅ | ✅ |
| Macros | ⚠️ | ✅ |
| Registradores | ❌ | ✅ |

**Veredito:** Micro para produtividade imediata, Vim para poder máximo.

### Micro vs VS Code

| Feature | Micro | VS Code |
|---------|-------|---------|
| Leveza | ✅ (5MB) | ❌ (500MB+) |
| Inicialização | ✅ (<1s) | ❌ (5-10s) |
| Terminal nativo | ✅ | ⚠️ (integrado) |
| SSH/Remote | ✅ | ⚠️ (extensão) |
| Extensões | ⚠️ (limitadas) | ✅ (milhares) |
| Debug | ❌ | ✅ |
| Git | ⚠️ (básico) | ✅ |

**Veredito:** Micro para edição rápida em terminal, VS Code para IDE completa.

---

## 🐛 Troubleshooting

### Problemas Comuns

#### 1. Micro não abre arquivos grandes

```bash
# Solução: desabilitar syntax highlighting para arquivos grandes
micro -syntax off arquivo-grande.log

# Ou no settings.json
{
  "syntax": false
}
```

#### 2. Mouse não funciona

```bash
# Verificar se mouse está habilitado
set mouse

# Habilitar mouse
set mouse true

# Ou iniciar com
micro -nomouse arquivo.txt  # Para desabilitar
```

#### 3. Plugins não carregam

```bash
# Listar plugins instalados
plugin list

# Reinstalar plugins
plugin remove all
plugin install <nome>

# Verificar diretório de plugins
ls ~/.config/micro/plugins/
```

#### 4. Cores não aparecem corretamente

```bash
# Verificar tipo de terminal
echo $TERM

# Deve ser xterm-256color ou similar
export TERM=xterm-256color

# Adicionar ao ~/.bashrc ou ~/.zshrc
```

#### 5. Atalhos não funcionam

```bash
# Verificar bindings
# Ctrl+E, then type: show bindings

# Resetar bindings
rm ~/.config/micro/bindings.json
```

#### 6. Syntax highlighting não funciona

```bash
# Forçar sintaxe
micro -syntax python arquivo.py

# Verificar se arquivo tem extensão reconhecida
# Ou adicionar no settings.json
{
  "syntax": true
}
```

#### 7. Micro trava com arquivos grandes

```bash
# Desabilitar features pesadas
micro -syntax off -autosave 0 arquivo-grande.log

# Ou usar alternativas para arquivos muito grandes
head -100 arquivo-grande.log | micro
```

#### 8. Configurações não persistem

```bash
# Verificar permissões do arquivo
ls -la ~/.config/micro/settings.json

# Corrigir permissões
chmod 644 ~/.config/micro/settings.json

# Verificar se JSON é válido
cat ~/.config/micro/settings.json | python -m json.tool
```

---

## ❓ FAQ - Micro Editor

### 1. Como copiar e colar no terminal?
Use `Ctrl+Shift+C` e `Ctrl+Shift+V` no terminal, ou `Ctrl+C` e `Ctrl+V` dentro do Micro.

### 2. Como habilitar números de linha?
```bash
# Dentro do Micro
set number

# Ou no settings.json
{"number": true}
```

### 3. Como mudar o tamanho do tab?
```bash
set tabsize 2  # ou 4, 8, etc.
```

### 4. Como habilitar word wrap?
```bash
set softwrap true
```

### 5. Como abrir arquivo em linha específica?
```bash
micro +42 arquivo.txt  # Linha 42
micro +10:5 arquivo.txt  # Linha 10, coluna 5
```

### 6. Como comparar dois arquivos?
```bash
micro -diff arquivo1.txt arquivo2.txt
```

### 7. Como instalar plugins?
```bash
# Dentro do Micro (Ctrl+E)
plugin install <nome>
```

### 8. Onde ficam as configurações?
`~/.config/micro/settings.json`

### 9. Como criar macros?
Micro não suporta macros nativamente, mas use o plugin `multiple-cursors`.

### 10. Como habilitar autosave?
```bash
set autosave 30  # Salva a cada 30 segundos
```

### 11. Como abrir terminal interno?
```bash
# Ctrl+E, depois digite:
termon
```

### 12. Como sair do Micro?
```bash
Ctrl+Q
```

---

## 💡 Dicas de Produtividade

1. **Use múltiplos cursores** para editar várias linhas simultaneamente
2. **Habilite números de linha** para navegação rápida
3. **Use `goto` (Ctrl+E, goto)** para pular para linhas específicas
4. **Aprenda atalhos de seleção** para editar blocos rapidamente
5. **Instale o plugin `comment`** para comentar código rapidamente
6. **Use `vsplit` e `hsplit`** para comparar arquivos lado a lado
7. **Habilite `autosave`** para não perder trabalho
8. **Personalize bindings** para atalhos que você mais usa
9. **Use o terminal interno** para rodar comandos sem sair do editor
10. **Instale tema que reduz fadiga ocular** para sessões longas

---

## 🔗 Recursos Adicionais

- **Site Oficial**: https://micro-editor.github.io/
- **GitHub**: https://github.com/zyedidia/micro
- **Documentação**: https://github.com/zyedidia/micro/blob/master/runtime/help/help.md
- **Plugins**: https://github.com/micro-editor/plugin-channel
- **Fórum**: https://github.com/zyedidia/micro/discussions

---
