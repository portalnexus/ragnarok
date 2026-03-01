#!/bin/bash
# ============================================
# TUI/CLI Wiki - Translation Script
# Automates PT-BR translation workflow
# ============================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
I18N_DIR="${PROJECT_ROOT}/i18n"
TRANSLATION_DICT="${I18N_DIR}/pt-br.json"

print_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

show_help() {
    cat << EOF
${CYAN}TUI/CLI Wiki - Translation Script${NC}

${YELLOW}USAGE:${NC}
    $0 --page <file> --target <locale>
    $0 --dir <directory> --target <locale>
    $0 --list-translated
    $0 --list-pending
    $0 --help

${YELLOW}OPTIONS:${NC}
    -p, --page <file>      Translate a specific page
    -d, --dir <directory>  Translate all HTML files in directory
    -t, --target <locale>  Target locale (default: pt-br)
    -l, --list-translated  List all translated pages
    -L, --list-pending     List pages pending translation
    -h, --help             Show this help message

${YELLOW}EXAMPLES:${NC}
    # Translate index.html to PT-BR
    $0 --page index.html --target pt-br

    # Translate all tutorials
    $0 --dir content/tutorials --target pt-br

    # List translated pages
    $0 --list-translated

EOF
}

# Create PT-BR translation of a page
translate_page() {
    local source_file="$1"
    local target_locale="${2:-pt-br}"
    
    if [ ! -f "$source_file" ]; then
        print_error "File not found: $source_file"
        exit 1
    fi
    
    # Generate target filename
    local basename="${source_file%.html}"
    local target_file="${basename}.${target_locale}.html"
    
    print_info "Translating: $source_file -> $target_file"
    
    # Copy file as base
    cp "$source_file" "$target_file"
    
    # Update lang attribute
    sed -i "s/<html lang=\"en\"/<html lang=\"${target_locale}\"/" "$target_file"
    
    # Update title with PT-BR suffix (temporary, until fully translated)
    sed -i 's/<title>\(.*\)<\/title>/<title>\1 (PT-BR)<\/title>/' "$target_file"
    
    # Add language selector placeholder before </body>
    local lang_selector='
    <!-- Language Selector -->
    <div class="language-selector">
        <a href="'${source_file}'" class="lang-link" title="English">🇺🇸 EN</a>
        <a href="'${target_file}'" class="lang-link active" title="Português">🇧🇷 PT-BR</a>
    </div>
'
    
    # Insert before closing body tag (for pages with full body)
    if grep -q "</body>" "$target_file"; then
        sed -i "/<\/body>/i $lang_selector" "$target_file" 2>/dev/null || true
    fi
    
    print_success "Created: $target_file"
    print_info "Next step: Translate content manually or invoke Odin agent"
}

# List translated pages
list_translated() {
    print_info "Translated pages (PT-BR):"
    echo ""
    find "$PROJECT_ROOT" -name "*.pt-br.html" -type f 2>/dev/null | sort | while read -r file; do
        local rel_path="${file#$PROJECT_ROOT/}"
        echo "  ✓ $rel_path"
    done
    
    local count=$(find "$PROJECT_ROOT" -name "*.pt-br.html" -type f 2>/dev/null | wc -l)
    echo ""
    print_info "Total: $count page(s) translated"
}

# List pending pages
list_pending() {
    print_info "Pages pending translation (PT-BR):"
    echo ""
    
    find "$PROJECT_ROOT/content" -name "*.html" -type f ! -name "*.pt-br.html" 2>/dev/null | sort | while read -r file; do
        local rel_path="${file#$PROJECT_ROOT/}"
        local pt_br_file="${file%.html}.pt-br.html"
        
        if [ ! -f "$pt_br_file" ]; then
            echo "  ⏳ $rel_path"
        fi
    done
    
    local total=$(find "$PROJECT_ROOT/content" -name "*.html" -type f ! -name "*.pt-br.html" 2>/dev/null | wc -l)
    local translated=$(find "$PROJECT_ROOT/content" -name "*.pt-br.html" -type f 2>/dev/null | wc -l)
    local pending=$((total - translated))
    
    echo ""
    print_info "Total: $total pages | Translated: $translated | Pending: $pending"
}

# Create i18n dictionary
create_i18n_dict() {
    print_info "Creating i18n dictionary..."
    
    cat > "$TRANSLATION_DICT" << 'EOF'
{
  "locale": "pt-BR",
  "language": "Português Brasileiro",
  "translations": {
    "nav": {
      "home": "Início",
      "gettingStarted": "Primeiros Passos",
      "whatIsTui": "O que é TUI?",
      "cliBasics": "Fundamentos de CLI",
      "frameworks": "Frameworks",
      "bestPractices": "Melhores Práticas",
      "snippets": "Trechos de Código",
      "tutorials": "Tutoriais"
    },
    "common": {
      "search": "Buscar...",
      "searchPlaceholder": "Buscar documentação... (Pressione / para focar)",
      "toggleTheme": "Alternar tema",
      "toggleSidebar": "Alternar menu",
      "copyCode": "Copiar código",
      "copied": "Copiado!",
      "loading": "Carregando...",
      "welcome": "Bem-vindo(a)",
      "overview": "Visão Geral",
      "installation": "Instalação",
      "usage": "Uso",
      "examples": "Exemplos",
      "resources": "Recursos",
      "seeAlso": "Veja Também"
    },
    "home": {
      "title": "Bem-vindo à TUI/CLI Wiki",
      "subtitle": "Seu guia completo para construir belas Text User Interfaces e Command Line Interfaces em múltiplas linguagens de programação.",
      "startLearning": "Começar a Aprender →",
      "browseFrameworks": "Navegar Frameworks"
    },
    "features": {
      "whyTuiCli": "Por que TUI/CLI?",
      "lightningFast": "Ultra Rápido",
      "lightningFastDesc": "Sem overhead de navegador. Execute diretamente no seu terminal com inicialização instantânea.",
      "remoteReady": "Pronto para Remoto",
      "remoteReadyDesc": "SSH em qualquer servidor e tenha uma interface interativa completa na ponta dos dedos.",
      "accessible": "Acessível",
      "accessibleDesc": "Design focado em teclado torna TUIs naturalmente acessíveis para todos os usuários.",
      "lightweight": "Leve",
      "lightweightDesc": "Dependências mínimas e bundles pequenos, perfeito para qualquer ambiente."
    },
    "team": {
      "meetTheTeam": "Conheça a Equipe",
      "agentManager": "Gerente de Agentes",
      "frontendDev": "Desenvolvedor Frontend",
      "tuiEngineer": "Engenheiro TUI/CLI",
      "techWriter": "Redator Técnico",
      "devOps": "DevOps & Integração"
    }
  }
}
EOF
    
    print_success "Created: $TRANSLATION_DICT"
}

# Main function
main() {
    local page=""
    local dir=""
    local target="pt-br"
    local list_translated_flag=false
    local list_pending_flag=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -p|--page)
                page="$2"
                shift 2
                ;;
            -d|--dir)
                dir="$2"
                shift 2
                ;;
            -t|--target)
                target="$2"
                shift 2
                ;;
            -l|--list-translated)
                list_translated_flag=true
                shift
                ;;
            -L|--list-pending)
                list_pending_flag=true
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    # Execute requested action
    if [ "$list_translated_flag" = true ]; then
        list_translated
        exit 0
    fi
    
    if [ "$list_pending_flag" = true ]; then
        list_pending
        exit 0
    fi
    
    if [ -n "$page" ]; then
        # Ensure i18n directory exists
        mkdir -p "$I18N_DIR"
        
        # Create i18n dictionary if not exists
        if [ ! -f "$TRANSLATION_DICT" ]; then
            create_i18n_dict
        fi
        
        translate_page "$page" "$target"
        exit 0
    fi
    
    if [ -n "$dir" ]; then
        mkdir -p "$I18N_DIR"
        if [ ! -f "$TRANSLATION_DICT" ]; then
            create_i18n_dict
        fi
        
        print_info "Translating all HTML files in: $dir"
        
        find "$dir" -name "*.html" -type f ! -name "*.pt-br.html" | while read -r file; do
            translate_page "$file" "$target"
        done
        
        exit 0
    fi
    
    # No action specified
    print_error "No action specified"
    show_help
    exit 1
}

main "$@"
