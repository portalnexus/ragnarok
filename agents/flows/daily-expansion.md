# 🔄 Daily Expansion Flow

> Fluxo autônomo para expansão diária automática da wiki

---

## 🎯 Objetivo

Executar diariamente uma tarefa de expansão da wiki de forma autônoma, 
rotacionando entre diferentes agentes para cobertura completa do conteúdo.

---

## 📅 Agenda Semanal

| Dia | Agente | Foco |
|-----|--------|------|
| **Segunda** | `content-writer.md` | Expandir seção de comandos |
| **Terça** | `content-writer.md` | Adicionar exemplos práticos |
| **Quarta** | `code-analyst.md` | Analisar código por novas features |
| **Quinta** | `researcher.md` | Pesquisar tendências/comparações |
| **Sexta** | `qa-reviewer.md` | Revisão semanal de qualidade |
| **Sábado** | `web-developer.md` | Melhorias na interface web |
| **Domingo** | `content-writer.md` | Preencher lacunas identificadas |

---

## 📥 Input Esperado

- **Arquivos para ler:** `../dicas-qwen.md`, `../agents/AGENT-MANIFEST.md`
- **Contexto necessário:**
  - Dia da semana (para selecionar agente)
  - Estado atual da wiki
  - Histórico de execuções anteriores
- **Parâmetros opcionais:**
  - `--force-agent=<nome>`: Forçar agente específico
  - `--dry-run`: Simular execução sem modificar
  - `--verbose`: Output detalhado

---

## 🛠️ Ferramentas Disponíveis

| Ferramenta | Uso |
|------------|-----|
| `read_file` | Ler wiki e configurações |
| `write_file` | Criar/modificar arquivos |
| `run_shell_command` | Executar agentes, git commands |
| `grep_search` | Analisar conteúdo existente |

---

## 📤 Output Esperado

1. Modificações na wiki (dicas-qwen.md ou index.html)
2. Log de execução em `logs/daily-expansion.log`
3. Commit git com as mudanças (opcional)
4. Relatório diário em `logs/daily-report-YYYY-MM-DD.md`

---

## 📋 Checklist de Execução

- [ ] Determinar dia da semana e agente correspondente
- [ ] Ler estado atual da wiki
- [ ] Identificar prioridades do dia
- [ ] Executar agente selecionado
- [ ] Validar mudanças realizadas
- [ ] Criar log da execução
- [ ] (Opcional) Commit das mudanças

---

## ⚠️ Restrições

- **NÃO** executar múltiplos agentes simultaneamente
- **NÃO** modificar sem validar primeiro
- **SEMPRE** criar backup antes de modificar
- **SEMPRE** registrar log da execução
- **NÃO** commitar sem revisão em modo production

---

## 📊 Critérios de Sucesso

- [ ] Agente correto executado para o dia
- [ ] Mudanças válidas e consistentes
- [ ] Log registrado com timestamp
- [ ] Wiki expandida ou melhorada
- [ ] Erros reportados claramente

---

## 🔄 Fluxo de Execução

```
1. Determinar dia da semana
         ↓
2. Selecionar agente da tabela semanal
         ↓
3. Ler wiki atual e identificar prioridades
         ↓
4. Executar agente com parâmetros apropriados
         ↓
5. Validar mudanças realizadas
         ↓
6. Registrar log e relatório
         ↓
7. (Opcional) Criar commit git
```

---

## 💡 Exemplo de Uso

```bash
# Execução diária automática (cron)
qwen "@agents/flows/daily-expansion.md"

# Simular execução
qwen "@agents/flows/daily-expansion.md --dry-run"

# Forçar agente específico
qwen "@agents/flows/daily-expansion.md --force-agent=qa-reviewer"

# Modo verbose
qwen "@agents/flows/daily-expansion.md --verbose"
```

---

## 🔧 Configuração Cron

### Adicionar ao crontab
```bash
# Executar diariamente às 2:00 AM
0 2 * * * cd ~/github/ragnarok && qwen "@agents/flows/daily-expansion.md" --yolo

# Executar apenas dias úteis às 3:00 AM
0 3 * * 1-5 cd ~/github/ragnarok && qwen "@agents/flows/daily-expansion.md" --yolo
```

### Systemd Timer
```ini
# /etc/systemd/system/ragnarok-daily.timer
[Unit]
Description=Daily RAGNAROK Wiki Expansion

[Timer]
OnCalendar=*-*-* 02:00:00
Persistent=true

[Install]
WantedBy=timers.target
```

---

## 📝 Template de Log Diário

```markdown
# 📝 Daily Expansion Log - YYYY-MM-DD

## Info
- **Dia:** [Dia da semana]
- **Agente:** [Nome do agente]
- **Início:** [HH:MM:SS]
- **Fim:** [HH:MM:SS]

## Execução

### Tarefa do Dia
[Descrição da tarefa baseada no agente]

### Ações Realizadas
1. [Ação 1]
2. [Ação 2]

### Mudanças
- Arquivos modificados: [lista]
- Linhas adicionadas: X
- Linhas removidas: Y

## Status: ✅ SUCESSO / ❌ FALHO

### Erros (se houver)
[Descrição de erros]

### Próximos Passos
[Sugestões para próxima execução]
```

---

## 🎯 Prioridades por Agente

### Content Writer (Seg/Ter/Qui)
1. Seções com menos de 3 exemplos
2. Comandos documentados sem exemplos
3. Features novas não documentadas
4. Lacunas identificadas pelo QA

### Code Analyst (Qua)
1. Último release/changelog
2. Código fonte modificado recentemente
3. Novos arquivos no src/
4. Issues/PRs merged

### Researcher (Qui)
1. Release notes de ferramentas similares
2. Trending topics na comunidade
3. Feature requests populares
4. Comparativos solicitados

### QA Reviewer (Sex)
1. Arquivos modificados na semana
2. Links adicionados recentemente
3. Exemplos de código novos
4. Consistência geral

### Web Developer (Sáb)
1. Sync com dicas-qwen.md
2. Melhorias de UI solicitadas
3. Novos temas
4. Correções de bugs visuais

### Content Writer (Dom)
1. Lacunas identificadas na semana
2. Tópicos mais acessados
3. Requests da comunidade
4. Conteúdo evergreen

---

*Versão: 1.0.0 | Última atualização: 2026-02-23*
