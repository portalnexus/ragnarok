#!/usr/bin/env python3
"""
Script para atualizar todas as páginas PT-BR para usar index.html como página principal
e corrigir links de navegação
"""

import os
import re
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent
CONTENT_DIR = PROJECT_ROOT / "content"

def update_ptbr_page(file_path):
    """Atualiza uma página PT-BR para usar links corretos"""
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Contador de substituições
    changes = 0
    
    # Atualizar link para index.pt-br.html -> index.html
    if 'index.pt-br.html' in content:
        content = content.replace('index.pt-br.html', 'index.html')
        changes += 1
    
    # Atualizar language selector - garantir que PT-BR seja ativo
    # Padrão: lang-link" title="English">🇺🇸 EN</a>
    #          lang-link active" title="Português">🇧🇷 PT-BR</a>
    lang_pattern = r'(<div class="language-selector">.*?<a href="[^"]+\.html" class="lang-link)([^"]*)" title="English">🇺🇸 EN</a>\s*<a href="[^"]+\.pt-br\.html" class="lang-link([^"]*)" title="Português">🇧🇷 PT-BR</a>(.*?</div>)'
    
    def fix_lang_selector(match):
        return f'''<div class="language-selector">
            <a href="index-en.html" class="lang-link" title="English">🇺🇸 EN</a>
            <a href="index.html" class="lang-link active" title="Português">🇧🇷 PT-BR</a>
        </div>'''
    
    if re.search(lang_pattern, content, re.DOTALL):
        content = re.sub(lang_pattern, fix_lang_selector, content, flags=re.DOTALL)
        changes += 1
    
    # Salvar arquivo se houve mudanças
    if changes > 0:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        return True, changes
    return False, 0

def main():
    print("🔄 Atualizando páginas PT-BR para usar index.html como principal...\n")
    
    total_changes = 0
    
    # Processar todos os diretórios de conteúdo
    for subdir in ['tutorials', 'frameworks', 'best-practices', 'snippets', 'beginner', 'raspberry-pi', 'raspberry-pi/getting-started']:
        dir_path = CONTENT_DIR / subdir
        if not dir_path.exists():
            continue
            
        print(f"📁 {subdir}/")
        
        for html_file in dir_path.glob('*.pt-br.html'):
            updated, changes = update_ptbr_page(html_file)
            if updated:
                print(f"  ✅ {html_file.name} ({changes} mudanças)")
                total_changes += changes
    
    print(f"\n✅ {total_changes} alterações realizadas!")

if __name__ == '__main__':
    main()
