#!/bin/bash
# ============================================
# TUI/CLI Wiki - Agent Invocation Script
# Unified interface for QWEN CLI and GEMINI CLI
# ============================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="${SCRIPT_DIR}/agents.json"
LOG_FILE="${SCRIPT_DIR}/session_log.md"

# Default values
DEFAULT_AGENT="loki"
DEFAULT_CLI="qwen"

# Print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_agent() {
    echo -e "${CYAN}[AGENT:$1]${NC} $2"
}

# Show help
show_help() {
    cat << EOF
${CYAN}TUI/CLI Wiki - Agent Invocation Script${NC}

${YELLOW}USAGE:${NC}
    $0 --agent <name> --cli <type> --task "<description>"
    $0 --list-agents
    $0 --list-clis
    $0 --help

${YELLOW}OPTIONS:${NC}
    -a, --agent <name>     Agent to invoke (loki, thor, odin, heimdall)
    -c, --cli <type>       CLI interface to use (qwen, gemini)
    -t, --task "<desc>"    Task description for the agent
    -l, --list-agents      List available agents with descriptions
    -L, --list-clis        List available CLI interfaces
    -o, --output <file>    Output file for the result
    -v, --verbose          Enable verbose output
    -h, --help             Show this help message

${YELLOW}EXAMPLES:${NC}
    # Invoke Loki (Frontend) via QWEN CLI
    $0 --agent loki --cli qwen --task "Create index.html with hero section"

    # Invoke Thor (TUI Expert) via GEMINI CLI
    $0 --agent thor --cli gemini --task "Review ratatui example code"

    # Invoke Odin (Writer) with output file
    $0 --agent odin --cli qwen --task "Write tutorial for CLI basics" --output cli-basics.md

    # List all agents
    $0 --list-agents

${YELLOW}AGENTS:${NC}
    loki      - Frontend Developer (HTML, CSS, JavaScript)
    thor      - TUI/CLI Engineer (Code examples, best practices)
    odin      - Technical Writer (Documentation, tutorials)
    heimdall  - DevOps & Integration (Scripts, automation)

${YELLOW}CLI INTERFACES:${NC}
    qwen    - QWEN CLI interface
    gemini  - GEMINI CLI interface

EOF
}

# List available agents
list_agents() {
    if [ -f "$CONFIG_FILE" ]; then
        print_info "Available Agents:"
        echo ""
        cat "$CONFIG_FILE" | python3 -c "
import sys, json
data = json.load(sys.stdin)
for agent in data['agents']:
    print(f\"  {agent['id']:12} - {agent['role']}\")
    print(f\"               {agent['description']}\")
    print()
"
    else
        print_warning "Config file not found: $CONFIG_FILE"
        echo ""
        echo "  loki      - Frontend Developer (HTML, CSS, JavaScript)"
        echo "  thor      - TUI/CLI Engineer (Code examples, best practices)"
        echo "  odin      - Technical Writer (Documentation, tutorials)"
        echo "  heimdall  - DevOps & Integration (Scripts, automation)"
    fi
}

# List available CLIs
list_clis() {
    print_info "Available CLI Interfaces:"
    echo ""
    echo "  qwen    - QWEN CLI (qwen-code)"
    echo "  gemini  - GEMINI CLI (gemini-cli)"
    echo ""
    print_info "Note: Ensure the respective CLI is installed and configured."
}

# Get agent config
get_agent_config() {
    local agent_id="$1"
    if [ -f "$CONFIG_FILE" ]; then
        python3 -c "
import json
with open('$CONFIG_FILE') as f:
    data = json.load(f)
    for agent in data['agents']:
        if agent['id'] == '$agent_id':
            print(json.dumps(agent))
            exit(0)
print('')
"
    fi
}

# Build prompt for agent
build_prompt() {
    local agent_id="$1"
    local task="$2"
    local agent_config=$(get_agent_config "$agent_id")
    
    if [ -z "$agent_config" ]; then
        print_error "Agent '$agent_id' not found in configuration"
        exit 1
    fi
    
    local system_prompt=$(echo "$agent_config" | python3 -c "import sys,json; print(json.load(sys.stdin)['system_prompt'])")
    
    cat << EOF
${system_prompt}

---
TASK: ${task}
---

Please complete this task following your role and the project conventions.
The project is a TUI/CLI Wiki built with HTML/CSS/JS.
EOF
}

# Log interaction
log_interaction() {
    local agent="$1"
    local cli="$2"
    local task="$3"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    cat >> "$LOG_FILE" << EOF

## ${timestamp}

- **Agent:** ${agent}
- **CLI:** ${cli}
- **Task:** ${task}

---

EOF
}

# Invoke QWEN CLI
invoke_qwen() {
    local prompt="$1"
    local output_file="$2"
    
    print_info "Invoking QWEN CLI..."
    
    if command -v qwen &> /dev/null; then
        if [ -n "$output_file" ]; then
            echo "$prompt" | qwen >> "$output_file"
        else
            echo "$prompt" | qwen
        fi
    else
        print_error "QWEN CLI not found. Please install it first."
        print_info "Visit: https://github.com/QwenLM/qwen-code"
        exit 1
    fi
}

# Invoke GEMINI CLI
invoke_gemini() {
    local prompt="$1"
    local output_file="$2"
    
    print_info "Invoking GEMINI CLI..."
    
    if command -v gemini &> /dev/null; then
        if [ -n "$output_file" ]; then
            echo "$prompt" | gemini >> "$output_file"
        else
            echo "$prompt" | gemini
        fi
    else
        print_error "GEMINI CLI not found. Please install it first."
        print_info "Visit: https://github.com/google/gemini-cli"
        exit 1
    fi
}

# Main function
main() {
    local agent=""
    local cli=""
    local task=""
    local output_file=""
    local verbose=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -a|--agent)
                agent="$2"
                shift 2
                ;;
            -c|--cli)
                cli="$2"
                shift 2
                ;;
            -t|--task)
                task="$2"
                shift 2
                ;;
            -o|--output)
                output_file="$2"
                shift 2
                ;;
            -l|--list-agents)
                list_agents
                exit 0
                ;;
            -L|--list-clis)
                list_clis
                exit 0
                ;;
            -v|--verbose)
                verbose=true
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
    
    # Validate required arguments
    if [ -z "$agent" ] || [ -z "$cli" ] || [ -z "$task" ]; then
        print_error "Missing required arguments"
        echo ""
        echo "Usage: $0 --agent <name> --cli <type> --task \"<description>\""
        echo ""
        echo "Run '$0 --help' for more information."
        exit 1
    fi
    
    # Set defaults if needed
    agent=${agent:-$DEFAULT_AGENT}
    cli=${cli:-$DEFAULT_CLI}
    
    # Print invocation info
    echo ""
    echo -e "${CYAN}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}  ${GREEN}TUI/CLI Wiki - Agent Invocation${NC}"
    echo -e "${CYAN}╠════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  Agent: ${YELLOW}${agent}${NC}"
    echo -e "${CYAN}║${NC}  CLI:   ${YELLOW}${cli}${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Build prompt
    print_info "Building prompt for agent '${agent}'..."
    local prompt=$(build_prompt "$agent" "$task")
    
    if [ "$verbose" = true ]; then
        print_info "Prompt:"
        echo "$prompt"
        echo ""
    fi
    
    # Log interaction
    log_interaction "$agent" "$cli" "$task"
    
    # Invoke appropriate CLI
    case $cli in
        qwen)
            invoke_qwen "$prompt" "$output_file"
            ;;
        gemini)
            invoke_gemini "$prompt" "$output_file"
            ;;
        *)
            print_error "Unknown CLI interface: $cli"
            print_info "Available: qwen, gemini"
            exit 1
            ;;
    esac
    
    if [ -n "$output_file" ]; then
        print_success "Output written to: $output_file"
    fi
    
    print_success "Agent invocation complete!"
}

# Run main function
main "$@"
