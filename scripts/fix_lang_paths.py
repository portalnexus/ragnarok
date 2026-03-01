#!/usr/bin/env python3
"""
Script para corrigir os paths do Language Selector em todas as páginas HTML
"""

import os
import re
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent
CONTENT_DIR = PROJECT_ROOT / "content"

def fix_language_selector(file_path):
    """Corrige os links do language selector em um arquivo HTML"""
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Verificar se tem language-selector
    if 'language-selector' not in content:
        return False
    
    # Extrair nome base do arquivo
    file_name = file_path.name
    base_name = file_name.replace('.pt-br.html', '').replace('.html', '')
    is_pt_br = '.pt-br.html' in file_name
    
    # Padrão para encontrar os links
    en_pattern = r'<a href="[^"]*{}\.html" class="lang-link([^"]*)">'.format(base_name.replace('-', r'\-'))
    ptbr_pattern = r'<a href="[^"]*{}\.pt-br\.html" class="lang-link([^"]*)">'.format(base_name.replace('-', r'\-'))
    
    # Substituir links EN
    def replace_en(match):
        classes = match.group(1)
        active = ' active' if not is_pt_br else ''
        return f'<a href="{base_name}.html" class="lang-link{active}"'
    
    # Substituir links PT-BR
    def replace_ptbr(match):
        classes = match.group(1)
        active = ' active' if is_pt_br else ''
        return f'<a href="{base_name}.pt-br.html" class="lang-link{active}"'
    
    content = re.sub(en_pattern, replace_en, content)
    content = re.sub(ptbr_pattern, replace_ptbr, content)
    
    # Salvar arquivo
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    return True

def main():
    print("🔧 Corrigindo Language Selector paths...\n")
    
    fixed_count = 0
    
    # Processar todos os diretórios de conteúdo
    for subdir in ['tutorials', 'frameworks', 'best-practices', 'snippets']:
        dir_path = CONTENT_DIR / subdir
        if not dir_path.exists():
            continue
            
        print(f"📁 {subdir}/")
        
        for html_file in dir_path.glob('*.html'):
            if fix_language_selector(html_file):
                print(f"  ✅ {html_file.name}")
                fixed_count += 1
    
    print(f"\n✅ {fixed_count} arquivos corrigidos!")

if __name__ == '__main__':
    main()
