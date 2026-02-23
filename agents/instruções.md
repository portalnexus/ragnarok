    📁 Estrutura Criada

      1 ragnarok/
      2 ├── dicas-qwen.md
      3 ├── index.html
      4 └── agents/
      5     ├── AGENT-MANIFEST.md      # Visão geral do sistema
      6     ├── AGENT-TEMPLATE.md      # Template para novos agentes
      7     ├── content-writer.md      # 📝 Expansão de documentação
      8     ├── code-analyst.md        # 🔍 Análise de código fonte
      9     ├── web-developer.md       # 🎨 Manutenção do index.html
     10     ├── qa-reviewer.md         # ✅ Validação e revisão
     11     ├── researcher.md          # 🧭 Pesquisa de novas features
     12     └── flows/
     13         └── daily-expansion.md # 🔄 Fluxo autônomo diário

    🚀 Como Usar

     1 # Executar um agente específico
     2 qwen "@agents/content-writer.md"
     3 qwen "@agents/qa-reviewer.md --check=links"
     4 
     5 # Executar fluxo autônomo (cron)
     6 qwen "@agents/flows/daily-expansion.md"
     7 
     8 # Com Gemini CLI
     9 gemini "@agents/researcher.md --compare=gemini-cli"

    📅 Agenda Semanal Automática


    ┌─────┬────────────────┬────────────────────┐
    │ Dia │ Agente         │ Tarefa             │
    ├─────┼────────────────┼────────────────────┤
    │ Seg │ Content Writer │ Expandir comandos  │
    │ Ter │ Content Writer │ Adicionar exemplos │
    │ Qua │ Code Analyst   │ Analisar código    │
    │ Qui │ Researcher     │ Pesquisar trends   │
    │ Sex │ QA Reviewer    │ Revisão semanal    │
    │ Sáb │ Web Developer  │ Melhorias UI       │
    │ Dom │ Content Writer │ Preencher lacunas  │
    └─────┴────────────────┴────────────────────┘
