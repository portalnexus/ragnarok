#!/bin/bash
# ============================================
# Script para corrigir Language Selector nas páginas
# ============================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🔧 Corrigindo Language Selector..."

# Função para corrigir uma página
fix_page() {
    local file="$1"
    local base_name=$(basename "$file" .html)
    base_name="${base_name%.pt-br}"
    
    # Verificar se é PT-BR ou EN
    if [[ "$file" == *".pt-br.html" ]]; then
        # PT-BR page
        sed -i "s|<a href=\".*${base_name}\.html\" class=\"lang-link active\"|<a href=\"${base_name}.html\" class=\"lang-link\"|g" "$file"
        sed -i "s|<a href=\".*${base_name}\.pt-br\.html\" class=\"lang-link\"|<a href=\"${base_name}.pt-br.html\" class=\"lang-link active\"|g" "$file"
    else
        # EN page
        sed -i "s|<a href=\".*${base_name}\.html\" class=\"lang-link\"|<a href=\"${base_name}.html\" class=\"lang-link active\"|g" "$file"
        sed -i "s|<a href=\".*${base_name}\.pt-br\.html\" class=\"lang-link active\"|<a href=\"${base_name}.pt-br.html\" class=\"lang-link\"|g" "$file"
    fi
    
    echo "  ✅ Fixed: $(basename "$file")"
}

# Processar todas as páginas
find "$PROJECT_ROOT/content" -name "*.html" -type f | while read -r file; do
    if grep -q "language-selector" "$file"; then
        fix_page "$file"
    fi
done

echo "✅ Correção concluída!"
