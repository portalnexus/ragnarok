# ⚡ TUI/CLI Wiki

Uma wiki estática abrangente para desenvolvimento de **Text User Interface (TUI)** e **Command Line Interface (CLI)**. Construída com HTML/CSS/JavaScript puro para máxima performance e simplicidade.

![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-blue?logo=github)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-success)
![Languages](https://img.shields.io/badge/Languages-EN%20%7C%20PT--BR-orange)

## 🌟 Features

- **⚡ Ultra Rápida** - HTML/CSS/JS estático, sem build process
- **🎨 Tema Terminal-Moderno** - Dark mode nativo, inspirado em Dracula/Gruvbox
- **📱 Totalmente Responsiva** - Funciona em desktop, tablet e mobile
- **🔍 Busca Client-Side** - Busca indexada rápida sem servidor
- **♿ Acessível** - Navegação por teclado, screen reader friendly
- **🌙 Light/Dark Theme** - Alternância instantânea de temas
- **📋 Copiar Código** - Cópia de código com um clique
- **🌐 Bilingue** - Português e Inglês

## 📚 Conteúdo

### Tutoriais
- [O que é TUI?](content/tutorials/what-is-tui.pt-br.html) | [EN](content/tutorials/what-is-tui.html)
- [Fundamentos de CLI](content/tutorials/cli-basics.pt-br.html) | [EN](content/tutorials/cli-basics.html)

### Frameworks
| Linguagem | Framework | PT-BR | EN |
|-----------|-----------|-------|-----|
| 🐍 Python | [Textual](content/frameworks/python-textual.pt-br.html) | ✅ | [✅](content/frameworks/python-textual.html) |
| 🐍 Python | [Rich](content/frameworks/python-rich.pt-br.html) | ✅ | [✅](content/frameworks/python-rich.html) |
| 🦀 Rust | [Ratatui](content/frameworks/rust-ratatui.pt-br.html) | ✅ | [✅](content/frameworks/rust-ratatui.html) |
| 🔵 Go | [Bubble Tea](content/frameworks/go-bubbletea.pt-br.html) | ✅ | [✅](content/frameworks/go-bubbletea.html) |
| 🟢 Node.js | [Ink](content/frameworks/nodejs-ink.pt-br.html) | ✅ | [✅](content/frameworks/nodejs-ink.html) |

### Melhores Práticas
- [Análise de Argumentos CLI](content/best-practices/cli-parsing.pt-br.html) | [EN](content/best-practices/cli-parsing.html)
- [Acessibilidade em TUI](content/best-practices/tui-accessibility.pt-br.html) | [EN](content/best-practices/tui-accessibility.html)
- [Esquemas de Cores](content/best-practices/color-schemes.pt-br.html) | [EN](content/best-practices/color-schemes.html)

### Trechos de Código
- [Spinners de Carregamento](content/snippets/loading-spinners.pt-br.html) | [EN](content/snippets/loading-spinners.html)
- [Barras de Progresso](content/snippets/progress-bars.pt-br.html) | [EN](content/snippets/progress-bars.html)
- [Tabelas de Dados](content/snippets/tables.pt-br.html) | [EN](content/snippets/tables.html)

## 🚀 Quick Start

### Desenvolvimento Local

1. Clone o repositório:
```bash
git clone https://github.com/yourusername/ragnarok.git
cd ragnarok
```

2. Abra `index.html` ou `index.pt-br.html` no navegador, ou use um servidor local:
```bash
# Python
python -m http.server 8000

# Node.js
npx serve .

# Go
python -m http.server 8000
```

3. Acesse `http://localhost:8000`

### GitHub Pages Deployment

A wiki é automaticamente deployada para GitHub Pages ao fazer push na branch `main`.

1. Vá em **Settings** → **Pages**
2. Configure **Source** como "GitHub Actions"
3. Faça push das mudanças para triggerar o deploy

Sua wiki estará disponível em: `https://yourusername.github.io/ragnarok`

## 🤖 Equipe de Agentes

Esta wiki é mantida por uma equipe de agentes de IA coordenados por **Ragnarok**:

| Agente | Papel | Especialidade |
|--------|-------|---------------|
| 🧙 Ragnarok | Gerente de Agentes | Coordenação geral |
| 🦊 Loki | Desenvolvedor Frontend | HTML, CSS, JavaScript |
| ⚡ Thor | Engenheiro TUI/CLI | Exemplos de código |
| 📜 Odin | Redator Técnico | Documentação, tradução |
| 👁️ Heimdall | DevOps & Integração | Scripts, automação |

### Invocando Agentes

Use o script unificado de invocação:

```bash
# Invocar Loki (Frontend) via QWEN CLI
./scripts/invoke.sh --agent loki --cli qwen --task "Criar nova página"

# Invocar Thor (TUI Expert) via GEMINI CLI
./scripts/invoke.sh --agent thor --cli gemini --task "Revisar código exemplo"

# Invocar Odin (Writer) para tradução
./scripts/invoke.sh --agent odin --cli qwen --task "Traduzir página para PT-BR"

# Listar agentes disponíveis
./scripts/invoke.sh --list-agents
```

## 📁 Estrutura do Projeto

```
ragnarok/
├── index.html                 # Página inicial (EN)
├── index.pt-br.html           # Página inicial (PT-BR)
├── PLANO ESTRATEGICO.md       # Plano estratégico 2026
├── README.md
├── css/
│   ├── style.css              # Estilos globais
│   └── terminal-theme.css     # Tema terminal
├── js/
│   ├── main.js                # Interações UI
│   └── search.js              # Busca + índice PT-BR/EN
├── content/
│   ├── tutorials/             # Tutoriais (EN + PT-BR)
│   ├── frameworks/            # Documentação frameworks
│   ├── best-practices/        # Melhores práticas
│   └── snippets/              # Trechos de código
├── scripts/
│   ├── invoke.sh              # Invocação de agentes
│   ├── translate.sh           # Tradução automatizada
│   ├── agents.json            # Configuração agentes
│   └── session_log.md         # Log de sessões
├── i18n/
│   ├── pt-br.json             # Dicionário PT-BR
│   └── TRADUCAO_PT_BR.md      # Plano de tradução
└── assets/
    └── fonts/                 # Fontes customizadas
```

## 🌐 Idiomas

A wiki está disponível em:

| Idioma | Código | Status | Páginas |
|--------|--------|--------|---------|
| 🇺🇸 Inglês | EN | ✅ Completo | 14 |
| 🇧🇷 Português | PT-BR | ✅ Completo | 14 |
| 🇪🇸 Espanhol | ES | 📋 Planejado | Q3 2026 |

### Alternar Idioma

Use o seletor de idioma no canto superior direito de qualquer página, ou:

- **Início em Português:** [`index.pt-br.html`](index.pt-br.html)
- **Home in English:** [`index.html`](index.html)

## ⌨️ Atalhos de Teclado

| Tecla | Ação |
|-------|------|
| `/` | Focar busca |
| `t` | Alternar tema |
| `b` | Alternar sidebar |
| `Esc` | Fechar sidebar/busca |

## 🛠️ Scripts Disponíveis

### invoke.sh
Invoca agentes de IA para tarefas específicas.

```bash
./scripts/invoke.sh --agent <nome> --cli <tipo> --task "<descrição>"
```

### translate.sh
Automatiza traduções PT-BR.

```bash
# Traduzir página específica
./scripts/translate.sh --page index.html --target pt-br

# Listar páginas traduzidas
./scripts/translate.sh --list-translated

# Listar páginas pendentes
./scripts/translate.sh --list-pending
```

## 📊 Estatísticas

| Categoria | EN | PT-BR | Total |
|-----------|----|-------|-------|
| Tutoriais | 2 | 2 | 4 |
| Frameworks | 5 | 5 | 10 |
| Best Practices | 3 | 3 | 6 |
| Snippets | 3 | 3 | 6 |
| **Total** | **13** | **13** | **26** |

## 📄 Licença

Licença MIT - Veja [LICENSE](LICENSE) para detalhes.

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se livre para submeter um Pull Request.

1. Fork o repositório
2. Crie sua branch de feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📞 Suporte

- **Issues:** [GitHub Issues](https://github.com/yourusername/ragnarok/issues)
- **Discussões:** [GitHub Discussions](https://github.com/yourusername/ragnarok/discussions)
- **Plano Estratégico:** [PLANO ESTRATEGICO.md](PLANO%20ESTRATEGICO.md)

---

Construído com ⚡ pela **Equipe Ragnarok** | Hospedado no GitHub Pages

*Última atualização: 2026-03-01*
