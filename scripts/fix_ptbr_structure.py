#!/usr/bin/env python3
"""
Script para corrigir estrutura das páginas PT-BR
- Language selector na posição correta
- Sidebar com links todos em PT-BR
- Títulos e textos em PT-BR
"""

import os
import re
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent
CONTENT_DIR = PROJECT_ROOT / "content"

# Mapeamento de traduções de sidebar
SIDEBAR_TRANSLATIONS = {
    # Nav sections
    '📚 Getting Started': '📚 Primeiros Passos',
    '🔧 Frameworks': '🔧 Frameworks',
    '✨ Best Practices': '✨ Melhores Práticas',
    '📝 Snippets': '📝 Trechos de Código',
    '👶 Beginner Examples': '👶 Exemplos para Iniciantes',
    '🥧 Raspberry Pi': '🥧 Raspberry Pi',
    
    # Nav links EN -> PT-BR
    'Home': 'Início',
    'What is TUI?': 'O que é TUI?',
    'CLI Basics': 'Fundamentos de CLI',
    'Python Basics': 'Python Básico',
    'Rust Basics': 'Rust Básico',
    'Go Basics': 'Go Básico',
    'Node.js Basics': 'Node.js Básico',
    'Raspberry Pi 3B': 'Raspberry Pi 3B',
    'Hardware Overview': 'Visão Geral do Hardware',
    'OS Installation': 'Instalação do SO',
    'First Boot': 'Primeira Inicialização',
    'Python Textual': 'Python Textual',
    'Python Rich': 'Python Rich',
    'Rust Ratatui': 'Rust Ratatui',
    'Go Bubble Tea': 'Go Bubble Tea',
    'Node.js Ink': 'Node.js Ink',
    'CLI Argument Parsing': 'Análise de Argumentos CLI',
    'TUI Accessibility': 'Acessibilidade em TUI',
    'Color Schemes': 'Esquemas de Cores',
    'Loading Spinners': 'Spinners de Carregamento',
    'Progress Bars': 'Barras de Progresso',
    'Data Tables': 'Tabelas de Dados',
}

def fix_page_structure(file_path):
    """Corrige a estrutura de uma página PT-BR"""
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    changes = 0
    
    # 1. Corrigir language selector mal formatado
    # Padrão incorreto: dentro do header, sem fechamento correto
    bad_lang_pattern = r'</div>\s*<!-- Language Selector -->\s*<div class="language-selector">[^<]+<a href="index-en\.html"[^<]+</a>\s*<a href="index\.html"[^<]+</a>\s*</div>\s*</header>'
    
    good_lang = '''</div>
        </header>

        <!-- Language Selector -->
        <div class="language-selector">
            <a href="index-en.html" class="lang-link" title="English">🇺🇸 EN</a>
            <a href="index.html" class="lang-link active" title="Português">🇧🇷 PT-BR</a>
        </div>'''
    
    if re.search(bad_lang_pattern, content):
        content = re.sub(bad_lang_pattern, good_lang, content)
        changes += 1
        print(f"  🔧 Language selector corrigido em {file_path.name}")
    
    # 2. Atualizar sidebar para PT-BR
    for en_text, pt_text in SIDEBAR_TRANSLATIONS.items():
        # Atualizar apenas se estiver em contexto de nav-link ou nav-section-title
        pattern = f'>([\\s\\n]*{re.escape(en_text)}[\\s\\n]*)<'
        replacement = f'>{pt_text}<'
        
        if en_text in content and f'class="nav-link"' in content or f'class="nav-section-title"' in content:
            content = re.sub(pattern, replacement, content)
            changes += 1
    
    # 3. Corrigir links da sidebar para garantir .pt-br.html
    # Exceto index.html que agora é PT-BR
    content = re.sub(r'href="([^"]*\.en\.html)"', r'href="\1"', content)
    
    # 4. Salvar arquivo
    if changes > 0:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
    
    return changes

def main():
    print("🔧 Corrigindo estrutura das páginas PT-BR...\n")
    
    total_changes = 0
    
    # Processar todos os diretórios
    for subdir in ['tutorials', 'frameworks', 'best-practices', 'snippets', 'beginner', 'raspberry-pi', 'raspberry-pi/getting-started']:
        dir_path = CONTENT_DIR / subdir
        if not dir_path.exists():
            continue
            
        print(f"📁 {subdir}/")
        
        for html_file in dir_path.glob('*.pt-br.html'):
            changes = fix_page_structure(html_file)
            if changes > 0:
                print(f"  ✅ {html_file.name} ({changes} correções)")
                total_changes += changes
    
    print(f"\n✅ {total_changes} correções realizadas!")

if __name__ == '__main__':
    main()
