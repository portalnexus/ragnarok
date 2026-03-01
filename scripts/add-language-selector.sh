#!/bin/bash
# ============================================
# Script para adicionar Language Selector em todas as páginas
# ============================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CONTENT_DIR="$PROJECT_ROOT/content"

echo "🌐 Adicionando Language Selector em todas as páginas..."

# Função para obter o nome base do arquivo sem extensão
get_base_name() {
    local file="$1"
    local base=$(basename "$file" .html)
    # Remove .pt-br se existir
    base="${base%.pt-br}"
    echo "$base"
}

# Função para obter o sufixo do idioma
get_lang_suffix() {
    local file="$1"
    if [[ "$file" == *".pt-br.html" ]]; then
        echo "pt-br"
    else
        echo "en"
    fi
}

# Função para gerar links de idioma
generate_lang_links() {
    local file="$1"
    local base_name=$(get_base_name "$file")
    local lang_suffix=$(get_lang_suffix "$file")
    local dir=$(dirname "$file")
    local rel_path=$(realpath --relative-to="$dir" "$PROJECT_ROOT")
    
    if [ "$lang_suffix" == "pt-br" ]; then
        # Página PT-BR
        echo "        <!-- Language Selector -->
        <div class=\"language-selector\">
            <a href=\"${rel_path}${base_name}.html\" class=\"lang-link\" title=\"English\">🇺🇸 EN</a>
            <a href=\"${rel_path}${base_name}.pt-br.html\" class=\"lang-link active\" title=\"Português\">🇧🇷 PT-BR</a>
        </div>"
    else
        # Página EN
        echo "        <!-- Language Selector -->
        <div class=\"language-selector\">
            <a href=\"${rel_path}${base_name}.html\" class=\"lang-link active\" title=\"English\">🇺🇸 EN</a>
            <a href=\"${rel_path}${base_name}.pt-br.html\" class=\"lang-link\" title=\"Português\">🇧🇷 PT-BR</a>
        </div>"
    fi
}

# Processar todas as páginas de conteúdo
process_page() {
    local file="$1"
    local temp_file=$(mktemp)
    
    # Verificar se já possui language-selector
    if grep -q "language-selector" "$file"; then
        echo "  ⏭️  Skip: $(basename "$file") (já possui)"
        return
    fi
    
    # Gerar language selector
    local lang_selector=$(generate_lang_links "$file")
    
    # Inserir após o theme-toggle
    awk -v selector="$lang_selector" '
    /<div class="theme-toggle">/,/<\/div>/ {
        print
        if (/<\/div>/) {
            print selector
        }
        next
    }
    { print }
    ' "$file" > "$temp_file"
    
    # Substituir arquivo original
    mv "$temp_file" "$file"
    echo "  ✅ Added: $(basename "$file")"
}

# Encontrar e processar todas as páginas HTML
echo ""
echo "📁 Processando tutoriais..."
find "$CONTENT_DIR/tutorials" -name "*.html" -type f | while read -r file; do
    process_page "$file"
done

echo ""
echo "📁 Processando frameworks..."
find "$CONTENT_DIR/frameworks" -name "*.html" -type f | while read -r file; do
    process_page "$file"
done

echo ""
echo "📁 Processando best-practices..."
find "$CONTENT_DIR/best-practices" -name "*.html" -type f | while read -r file; do
    process_page "$file"
done

echo ""
echo "📁 Processando snippets..."
find "$CONTENT_DIR/snippets" -name "*.html" -type f | while read -r file; do
    process_page "$file"
done

echo ""
echo "✅ Language Selector adicionado com sucesso!"
