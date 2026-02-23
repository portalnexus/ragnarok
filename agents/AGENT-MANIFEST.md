# 🤖 RAGNAROK - Agent System Manifest

> Sistema de agentes especializados para expansão autônoma da Wiki Qwen CLI

---

## 📋 Visão Geral

Este diretório contém **agentes especializados** em formato `.md` que podem ser executados por qualquer LLM CLI (Qwen, Gemini CLI, etc.) para realizar tarefas específicas de manutenção e expansão da wiki.

### Como Funciona

```bash
# Executar um agente específico
qwen "@agents/content-writer.md"

# Ou com Gemini CLI
gemini "@agents/code-analyst.md"

# Executar fluxo autônomo
qwen "@agents/flows/daily-expansion.md"
```

---

## 👥 Equipe de Agentes

| Agente | Arquivo | Responsabilidade |
|--------|---------|------------------|
| 📝 **Content Writer** | `content-writer.md` | Expandir documentação, criar novas seções |
| 🔍 **Code Analyst** | `code-analyst.md` | Analisar código, extrair comandos, documentar APIs |
| 🎨 **Web Developer** | `web-developer.md` | Manter e melhorar o index.html |
| ✅ **QA Reviewer** | `qa-reviewer.md` | Validar conteúdo, verificar links, revisar ortografia |
| 🧭 **Researcher** | `researcher.md` | Descobrir novos recursos, flags, comandos |

---

## 🔄 Fluxos Autônomos

| Fluxo | Arquivo | Descrição |
|-------|---------|-----------|
| **Daily Expansion** | `flows/daily-expansion.md` | Expande 1 seção por dia automaticamente |
| **Weekly Review** | `flows/weekly-review.md` | Revisão semanal de todo conteúdo |
| **On Commit** | `flows/on-commit.md` | Atualiza wiki após commits no código fonte |

---

## 📐 Estrutura de um Agente

Cada agente segue o template `AGENT-TEMPLATE.md`:

```markdown
# 🏷️ [NOME DO AGENTE]

## 🎯 Objetivo
[Descrição clara do propósito]

## 📥 Input Esperado
[O que o agente deve receber/ler]

## 🛠️ Ferramentas Disponíveis
[Comandos/APIs que pode usar]

## 📤 Output Esperado
[Resultado esperado após execução]

## 📋 Checklist de Tarefas
- [ ] Tarefa 1
- [ ] Tarefa 2

## ⚠️ Restrições
[O que NÃO fazer]

## 📊 Critérios de Sucesso
[Como validar se o trabalho foi bem feito]
```

---

## 🚀 Quick Start

### Para Humanos
```bash
# 1. Escolha um agente baseado na tarefa
# 2. Execute com o LLM CLI
# 3. Revise as mudanças sugeridas
# 4. Aceite ou rejeite
```

### Para Automação
```bash
# Adicionar ao crontab ou CI/CD
0 2 * * * qwen "@agents/flows/daily-expansion.md" --yolo
```

---

## 📈 Métricas da Wiki

| Métrica | Valor Alvo |
|---------|------------|
| Seções documentadas | 100% |
| Exemplos de código | 3+ por seção |
| Links verificados | 100% válidos |
| Atualização pós-release | < 24h |

---

## 🔗 Links Relacionados

- [Documentação Principal](../dicas-qwen.md)
- [Wiki Web](../index.html)
- [Template de Agente](./AGENT-TEMPLATE.md)

---

*Última atualização: 2026-02-23*
*Versão: 1.0.0*
