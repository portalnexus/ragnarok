# 🇧🇷 Plano de Tradução PT-BR - TUI/CLI Wiki

## 📋 Visão Geral

Este documento descreve o plano completo para traduzir a TUI/CLI Wiki do inglês para Português do Brasil (PT-BR).

---

## 🎯 Objetivos

1. Traduzir todo o conteúdo da wiki mantendo a precisão técnica
2. Preservar termos técnicos universalmente reconhecidos (ex: "CLI", "TUI", "framework")
3. Manter a consistência de terminologia em todas as páginas
4. Criar estrutura i18n escalável para futuras traduções

---

## 📁 Estrutura de Diretórios PT-BR

```
ragnarok/
├── index.html              # Página principal (EN)
├── index.pt-br.html        # Página principal (PT-BR)
├── css/
├── js/
├── content/
│   ├── tutorials/
│   │   ├── what-is-tui.html        # EN
│   │   └── what-is-tui.pt-br.html  # PT-BR
│   ├── frameworks/
│   ├── best-practices/
│   └── snippets/
├── scripts/
└── i18n/
    └── pt-br.json          # Dicionário de traduções
```

---

## 📝 Glossário de Tradução

### Termos Técnicos (Manter em Inglês)

| Termo | Justificativa |
|-------|---------------|
| CLI | Termo universal, amplamente conhecido |
| TUI | Termo universal, amplamente conhecido |
| Framework | Não tem tradução adequada |
| Widget | Termo padrão da indústria |
| Backend/Frontend | Termos consolidados |
| Code/Code block | Manter "código" apenas em texto corrido |
| Build | Termo consolidado |
| Deploy | Termo consolidado |
| Script | Termo consolidado |

### Termos para Traduzir

| Inglês | Português (PT-BR) |
|--------|-------------------|
| Home | Início |
| Getting Started | Primeiros Passos |
| Tutorials | Tutoriais |
| Frameworks | Frameworks (manter) |
| Best Practices | Melhores Práticas |
| Snippets | Trechos de Código |
| Search | Buscar |
| Toggle theme | Alternar tema |
| Toggle sidebar | Alternar menu |
| Copy code | Copiar código |
| Quick Start | Início Rápido |
| Overview | Visão Geral |
| Installation | Instalação |
| Usage | Uso |
| Examples | Exemplos |
| See Also | Veja Também |
| Resources | Recursos |
| Loading... | Carregando... |
| Welcome | Bem-vindo(a) |
| Features | Recursos |
| Documentation | Documentação |

---

## 🔄 Processo de Tradução

### Fase 1: Estrutura Base (Prioridade Alta)

| Arquivo | Status | Responsável |
|---------|--------|-------------|
| `index.pt-br.html` | ⏳ Pendente | Loki + Odin |
| `i18n/pt-br.json` | ⏳ Pendente | Heimdall |
| `js/search.pt-br.js` | ⏳ Pendente | Loki |

### Fase 2: Tutoriais (Prioridade Alta)

| Arquivo | Status | Responsável |
|---------|--------|-------------|
| `content/tutorials/what-is-tui.pt-br.html` | ⏳ Pendente | Odin |
| `content/tutorials/cli-basics.pt-br.html` | ⏳ Pendente | Odin |

### Fase 3: Frameworks (Prioridade Média)

| Arquivo | Status | Responsável |
|---------|--------|-------------|
| `content/frameworks/python-textual.pt-br.html` | ⏳ Pendente | Thor + Odin |
| `content/frameworks/python-rich.pt-br.html` | ⏳ Pendente | Thor + Odin |
| `content/frameworks/rust-ratatui.pt-br.html` | ⏳ Pendente | Thor + Odin |
| `content/frameworks/go-bubbletea.pt-br.html` | ⏳ Pendente | Thor + Odin |
| `content/frameworks/nodejs-ink.pt-br.html` | ⏳ Pendente | Thor + Odin |

### Fase 4: Melhores Práticas (Prioridade Média)

| Arquivo | Status | Responsável |
|---------|--------|-------------|
| `content/best-practices/cli-parsing.pt-br.html` | ⏳ Pendente | Thor + Odin |
| `content/best-practices/tui-accessibility.pt-br.html` | ⏳ Pendente | Thor + Odin |
| `content/best-practices/color-schemes.pt-br.html` | ⏳ Pendente | Thor + Odin |

### Fase 5: Snippets (Prioridade Baixa)

| Arquivo | Status | Responsável |
|---------|--------|-------------|
| `content/snippets/loading-spinners.pt-br.html` | ⏳ Pendente | Thor |
| `content/snippets/progress-bars.pt-br.html` | ⏳ Pendente | Thor |
| `content/snippets/tables.pt-br.html` | ⏳ Pendente | Thor |

---

## 🛠️ Script de Tradução Automatizada

O script `scripts/translate.sh` será usado para:

1. Criar cópias dos arquivos com sufixo `.pt-br.html`
2. Extrair texto traduzível para `i18n/pt-br.json`
3. Aplicar traduções do dicionário
4. Marcar conteúdo para revisão manual

### Uso do Script

```bash
# Traduzir página específica
./scripts/translate.sh --page index.html --target pt-br

# Traduzir todo o diretório
./scripts/translate.sh --dir content/tutorials --target pt-br

# Listar páginas traduzidas
./scripts/translate.sh --list-translated

# Verificar páginas pendentes
./scripts/translate.sh --list-pending
```

---

## ✅ Checklist de Qualidade

Cada página traduzida deve passar por:

- [ ] Tradução completa do texto visível
- [ ] Manutenção dos blocos de código em inglês
- [ ] Links internos atualizados para versões PT-BR
- [ ] Meta tags traduzidas (title, description)
- [ ] Atributos `lang="pt-br"` no HTML
- [ ] Revisão de terminologia técnica
- [ ] Teste de navegação entre páginas EN/PT-BR
- [ ] Validação de HTML

---

## 🔗 Navegação Entre Idiomas

Cada página terá um seletor de idioma:

```html
<div class="language-selector">
    <a href="index.html" class="lang-link en">🇺🇸 EN</a>
    <a href="index.pt-br.html" class="lang-link pt-br">🇧🇷 PT-BR</a>
</div>
```

---

## 📊 Cronograma Estimado

| Fase | Duração Estimada | Dependências |
|------|------------------|--------------|
| Fase 1 | 1-2 dias | Nenhuma |
| Fase 2 | 2-3 dias | Fase 1 completa |
| Fase 3 | 3-4 dias | Fase 1 completa |
| Fase 4 | 2-3 dias | Fase 2 completa |
| Fase 5 | 1-2 dias | Fase 3 completa |

**Total estimado:** 9-14 dias úteis

---

## 🤖 Alocação da Equipe

| Agente | Responsabilidades |
|--------|-------------------|
| **Ragnarok** | Coordenação geral, revisão final |
| **Loki** | Estrutura HTML, CSS, JS, seletor de idioma |
| **Thor** | Revisão de termos técnicos, código |
| **Odin** | Tradução de texto, glossário, consistência |
| **Heimdall** | Scripts de automação, i18n JSON |

---

## 📝 Comandos para Iniciar Tradução

```bash
# 1. Invocar Odin para traduzir página inicial
./scripts/invoke.sh --agent odin --cli qwen \
  --task "Traduzir index.html para PT-BR seguindo o plano em i18n/TRADUCAO_PT_BR.md"

# 2. Invocar Loki para criar estrutura i18n
./scripts/invoke.sh --agent loki --cli gemini \
  --task "Criar seletor de idioma e estrutura i18n no CSS/JS"

# 3. Invocar Heimdall para script de tradução
./scripts/invoke.sh --agent heimdall --cli qwen \
  --task "Criar script translate.sh para automação de traduções"
```

---

## 🎉 Critérios de Conclusão

A tradução PT-BR será considerada completa quando:

1. ✅ Todas as 14 páginas estiverem traduzidas
2. ✅ Navegação entre idiomas funcionar em todas as páginas
3. ✅ Busca funcionar em ambos os idiomas
4. ✅ Glossário de termos técnicos estiver documentado
5. ✅ README.md tiver versão PT-BR

---

**Documento criado por:** Ragnarok  
**Data:** 2026-03-01  
**Versão:** 1.0
