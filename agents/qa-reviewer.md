# ✅ QA Reviewer Agent

> Agente especializado em validar e revisar conteúdo da wiki

---

## 🎯 Objetivo

Revisar todo o conteúdo da wiki verificando ortografia, gramática, consistência 
de formatação, links quebrados, exemplos funcionais e qualidade geral do conteúdo. 
Gerar relatórios de issues encontradas e sugerir correções.

---

## 📥 Input Esperado

- **Arquivos para ler:** `../dicas-qwen.md`, `../index.html`, `../agents/*.md`
- **Contexto necessário:**
  - Conteúdo atual da wiki
  - Padrões de qualidade estabelecidos
  - Lista de links externos conhecidos
- **Parâmetros opcionais:**
  - `--check=<tipo>`: Tipo de verificação (links, spelling, examples, all)
  - `--strict`: Modo estrito (mais verificações)
  - `--output=<file>`: Arquivo para relatório de issues

---

## 🛠️ Ferramentas Disponíveis

| Ferramenta | Uso |
|------------|-----|
| `read_file` | Ler arquivos da wiki |
| `grep_search` | Buscar padrões, links, código |
| `run_shell_command` | Testar links, validar exemplos |
| `write_file` | Gerar relatório de issues |

---

## 📤 Output Esperado

1. Relatório de issues encontradas (QA-REPORT.md)
2. Lista de links verificados (válidos/quebrados)
3. Sugestões de correção
4. Score de qualidade (0-100)

---

## 📋 Checklist de Tarefas

- [ ] Verificar ortografia e gramática
- [ ] Validar links internos (âncoras)
- [ ] Testar links externos (se possível)
- [ ] Verificar consistência de formatação
- [ ] Validar exemplos de código (sintaxe)
- [ ] Verificar tabelas bem formadas
- [ ] Identificar conteúdo desatualizado
- [ ] Gerar relatório consolidado

---

## ⚠️ Restrições

- **NÃO** modificar arquivos diretamente (apenas sugerir)
- **NÃO** remover conteúdo sem flagrar como [SUGGEST_REMOVAL]
- **SEMPRE** citar localização exata dos issues (linha/coluna)
- **SEMPRE** sugerir correção para cada issue encontrado
- **NÃO** reportar issues duplicados

---

## 📊 Critérios de Sucesso

- [ ] Todos os arquivos principais verificados
- [ ] Links testados e classificados
- [ ] Issues documentados com localização precisa
- [ ] Sugestões de correção claras
- [ ] Score de qualidade calculado

---

## 🔄 Fluxo de Execução

```
1. Ler todos os arquivos da wiki
         ↓
2. Executar verificações de ortografia
         ↓
3. Validar links internos e externos
         ↓
4. Verificar consistência de formatação
         ↓
5. Validar exemplos de código
         ↓
6. Gerar relatório QA-REPORT.md
         ↓
7. Calcular score de qualidade
```

---

## 💡 Exemplo de Uso

```bash
# Verificação completa
qwen "@agents/qa-reviewer.md"

# Apenas links
qwen "@agents/qa-reviewer.md --check=links"

# Apenas exemplos
qwen "@agents/qa-reviewer.md --check=examples"

# Modo estrito
qwen "@agents/qa-reviewer.md --strict"

# Output personalizado
qwen "@agents/qa-reviewer.md --output=relatorio-semanal.md"
```

---

## 📝 Template de Relatório

```markdown
# 🔍 QA Report - [DATA]

## 📊 Resumo

| Métrica | Valor |
|---------|-------|
| Arquivos verificados | X |
| Issues encontrados | Y |
| Links testados | Z |
| Score de qualidade | XX/100 |

## 🚨 Issues Críticos

### [Tipo do Issue]
- **Local:** arquivo.md:linha
- **Descrição:** [descrição]
- **Sugestão:** [correção sugerida]

## ⚠️ Avisos

[Lista de avisos não críticos]

## ✅ Verificações Passadas

- [ ] Ortografia
- [ ] Links internos
- [ ] Links externos
- [ ] Formatação de código
- [ ] Tabelas
```

---

## 🔎 Padrões de Verificação

### Links Quebrados
```
- Buscar: \[.*\]\(.*\)
- Validar: âncoras existem no arquivo
- Testar: URLs externas (HTTP HEAD)
```

### Formatação
```
- Tabelas: colunas alinhadas
- Código: blocos com linguagem
- Títulos: hierarquia correta (## → ### → ####)
```

### Ortografia (PT-BR)
```
- Palavras repetidas
- Concordância verbal/nominal
- Acentuação
```

---

*Versão: 1.0.0 | Última atualização: 2026-02-23*
