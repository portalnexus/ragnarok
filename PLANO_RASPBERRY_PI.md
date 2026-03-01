# 🥧 Raspberry Pi Section - Plano de Conteúdo

> **Foco Principal:** Raspberry Pi 3B  
> **Público-alvo:** Iniciantes em TUI/CLI que desejam usar Raspberry Pi como plataforma de aprendizado  
> **Status:** Planejamento

---

## 📋 Visão Geral

A seção Raspberry Pi da TUI/CLI Wiki será dedicada a ensinar desenvolvimento de aplicações de terminal usando o Raspberry Pi 3B como plataforma principal. Esta seção é ideal para:

- Iniciantes em programação que querem um hardware acessível
- Entusiastas de home automation
- Desenvolvedores interessados em projetos IoT com interface de terminal
- Educadores procurando plataformas para ensino de programação

---

## 🎯 Objetivos de Aprendizado

Ao final desta seção, o leitor será capaz de:

1. Configurar um Raspberry Pi 3B para desenvolvimento
2. Acessar e navegar o terminal Linux
3. Instalar linguagens de programação e frameworks TUI
4. Criar aplicações TUI simples para projetos práticos
5. Integrar TUIs com GPIO e sensores
6. Deploy de aplicações TUI em projetos reais

---

## 📁 Estrutura de Diretórios Proposta

```
content/
└── raspberry-pi/
    ├── getting-started/
    │   ├── index.html + .pt-br.html      # Introdução ao Raspberry Pi 3B
    │   ├── hardware-overview.html + .pt-br.html
    │   ├── os-installation.html + .pt-br.html
    │   └── first-boot.html + .pt-br.html
    │
    ├── terminal-basics/
    │   ├── accessing-terminal.html + .pt-br.html
    │   ├── basic-commands.html + .pt-br.html
    │   ├── file-management.html + .pt-br.html
    │   └── ssh-setup.html + .pt-br.html
    │
    ├── programming-setup/
    │   ├── python-setup.html + .pt-br.html
    │   ├── rust-setup.html + .pt-br.html
    │   ├── go-setup.html + .pt-br.html
    │   └── nodejs-setup.html + .pt-br.html
    │
    ├── gpio-with-tui/
    │   ├── gpio-intro.html + .pt-br.html
    │   ├── led-control.html + .pt-br.html
    │   ├── button-input.html + .pt-br.html
    │   ├── sensor-display.html + .pt-br.html
    │   └── status-dashboard.html + .pt-br.html
    │
    ├── projects/
    │   ├── system-monitor.html + .pt-br.html
    │   ├── weather-station.html + .pt-br.html
    │   ├── smart-home-control.html + .pt-br.html
    │   ├── network-scanner.html + .pt-br.html
    │   └── retro-gaming-launcher.html + .pt-br.html
    │
    └── advanced/
        ├── performance-optimization.html + .pt-br.html
        ├── headless-operation.html + .pt-br.html
        ├── auto-start-tui.html + .pt-br.html
        └── deployment-tips.html + .pt-br.html
```

---

## 📝 Conteúdo Detalhado por Página

### 1. Getting Started (Introdução)

#### 1.1 Introdução ao Raspberry Pi 3B
- O que é Raspberry Pi 3B
- Especificações técnicas (CPU, RAM, GPIO, ports)
- Casos de uso para desenvolvimento TUI/CLI
- Comparação com outros modelos (Pi 4, Pi Zero, Pi 5)
- Onde comprar e custos estimados

#### 1.2 Hardware Overview
- Layout da placa Pi 3B
- Portas e conectores
- Pinout GPIO (40 pins)
- Requisitos de energia
- Opções de armazenamento (SD card)
- Acessórios recomendados

#### 1.3 OS Installation
- Raspberry Pi OS (antigo Raspbian)
- Raspberry Pi Imager
- Outras distribuições (Ubuntu, DietPi)
- Gravando imagem no cartão SD
- Configurações iniciais

#### 1.4 First Boot
- Boot sequence
- Configuração inicial (wifi, locale, timezone)
- Atualização de sistema
- Habilitando SSH
- Segurança básica

---

### 2. Terminal Basics

#### 2.1 Accessing Terminal
- Terminal direto (teclado + monitor)
- Terminal via SSH
- Serial console
- VNC para modo gráfico
- Diferenças entre console e terminal emulator

#### 2.2 Basic Commands
- Navegação (pwd, ls, cd)
- Manipulação de arquivos (cp, mv, rm, mkdir)
- Visualização (cat, less, head, tail)
- Edição de texto (nano, vim)
- Help e documentação (man, --help)

#### 2.3 File Management
- Estrutura de diretórios Linux
- Permissões (chmod, chown)
- Usuários e grupos
- Links simbólicos
- Mounting drives

#### 2.4 SSH Setup
- Gerando chaves SSH
- Configuração de autenticação key-based
- SSH config file
- SSH tunneling
- Segurança SSH

---

### 3. Programming Setup

#### 3.1 Python Setup
- Python já instalado no Pi OS
- Criando virtual environments
- Instalando pacotes com pip
- GPIO libraries (RPi.GPIO, gpiozero)
- Instalando Textual e Rich

#### 3.2 Rust Setup
- Instalando rustup
- Configuração de cross-compilation
- Otimizações para ARM
- crates GPIO (rppal, rust_gpiozero)
- Instalando Ratatui

#### 3.3 Go Setup
- Instalando Go no ARM
- Configurando GOPATH
- Go modules
- Libraries GPIO (periph.io, gpio)
- Instalando Bubble Tea

#### 3.4 Node.js Setup
- Instalando Node.js (versões recomendadas)
- npm e yarn
- Libraries GPIO (onoff, johnny-five)
- Instalando Ink

---

### 4. GPIO with TUI

#### 4.1 GPIO Introduction
- O que é GPIO
- Digital vs Analog (PWM)
- Pin numbering (BCM vs physical)
- Safety considerations
- Circuit basics (resistors, LEDs)

#### 4.2 LED Control
- Circuito básico de LED
- Controlando GPIO via código
- Criando TUI para ligar/desligar LEDs
- PWM para brilho variável
- Múltiplos LEDs

#### 4.3 Button Input
- Circuitos com botões
- Debouncing
- Lendo input de botões
- Display de estado na TUI
- Contador de cliques

#### 4.4 Sensor Display
- Sensor de temperatura (DHT11/DHT22)
- Sensor de umidade
- Sensor de luz (LDR)
- Display de leituras em tempo real
- Gráficos e charts na TUI

#### 4.5 Status Dashboard
- Monitorando múltiplos sensores
- Alertas e thresholds
- Logging de dados
- Export para CSV
- Design de dashboard

---

### 5. Projects (Projetos Práticos)

#### 5.1 System Monitor
- CPU usage
- Memory usage
- Disk usage
- Network stats
- Temperature do Pi
- Widgets em tempo real

#### 5.2 Weather Station
- API de weather (OpenWeatherMap)
- Display de condições atuais
- Previsão para próximos dias
- Ícones em ASCII
- Alertas de clima

#### 5.3 Smart Home Control
- Integração com Home Assistant
- Controle de dispositivos IoT
- Scenes e automações
- Status de dispositivos
- MQTT client

#### 5.4 Network Scanner
- Scan de dispositivos na rede
- Ping e port scan
- Display de resultados
- Wake-on-LAN
- Network monitoring

#### 5.5 Retro Gaming Launcher
- Launcher para emuladores
- Seleção de ROMs
- Screenshots e metadata
- Favorites e last played
- Integration com RetroPie

---

### 6. Advanced Topics

#### 6.1 Performance Optimization
- Overclocking seguro
- Gerenciamento de memória
- Processos em background
- Logging eficiente
- Reduzindo uso de CPU

#### 6.2 Headless Operation
- Configuração sem monitor
- Acesso remoto
- Systemd services
- Auto-restart on crash
- Remote updates

#### 6.3 Auto-start TUI
- Systemd service configuration
- .bashrc auto-start
- Display manager options
- Kiosk mode
- Boot to TUI

#### 6.4 Deployment Tips
- Backup e restore
- Version control (git)
- CI/CD para Pi
- OTA updates
- Monitoring e alerting

---

## 🎨 Elementos Visuais e Interativos

### Diagramas Necessários
1. Pinout GPIO do Raspberry Pi 3B
2. Esquemas de circuitos (LED, botão, sensor)
3. Fluxo de instalação do OS
4. Arquitetura de projetos

### Exemplos de Código
- Todos os exemplos devem ser executáveis no Pi 3B
- Incluir tratamento de erros
- Comentários explicativos
- Versões em Python, Rust, Go e Node.js (quando aplicável)

### Screenshots
- Terminal em operação
- TUIs finalizadas
- Configurações de sistema
- Resultados de projetos

---

## 📊 Especificações do Raspberry Pi 3B (Referência)

| Componente | Especificação |
|------------|---------------|
| **CPU** | Broadcom BCM2837, Quad-core Cortex-A53 @ 1.2GHz |
| **GPU** | Broadcom VideoCore IV @ 400MHz |
| **RAM** | 1GB LPDDR2 |
| **Storage** | MicroSD card slot |
| **USB** | 4x USB 2.0 |
| **Network** | Ethernet 10/100, Wi-Fi 802.11n, Bluetooth 4.1 |
| **GPIO** | 40-pin header |
| **Video** | HDMI, Composite |
| **Power** | 5V/2.5A via MicroUSB |

---

## 🗓️ Cronograma de Desenvolvimento

### Fase 1: Fundamentos (2 semanas)
- [ ] Getting Started (4 páginas)
- [ ] Terminal Basics (4 páginas)
- [ ] Programming Setup (4 páginas)

### Fase 2: GPIO e TUI (3 semanas)
- [ ] GPIO with TUI (5 páginas)
- [ ] Exemplos de código em todas as linguagens
- [ ] Diagramas de circuito

### Fase 3: Projetos (3 semanas)
- [ ] Projects (5 páginas)
- [ ] Código completo dos projetos
- [ ] Screenshots e demos

### Fase 4: Tópicos Avançados (2 semanas)
- [ ] Advanced (4 páginas)
- [ ] Dicas de deployment
- [ ] Otimização

### Fase 5: Tradução PT-BR (2 semanas)
- [ ] Tradução de todas as páginas
- [ ] Revisão técnica
- [ ] Adaptação de exemplos para contexto brasileiro

---

## 🔧 Recursos e Referências

### Documentação Oficial
- [Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/)
- [GPIO Pinout](https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#gpio-and-the-40-pin-header)
- [Raspberry Pi OS](https://www.raspberrypi.com/software/)

### Tutoriais e Guias
- [Real Python - Raspberry Pi](https://realpython.com/tutorials/raspberry-pi/)
- [PiMyLifeUp](https://pimylifeup.com/)
- [Tom's Hardware - Raspberry Pi](https://www.tomshardware.com/raspberry-pi)

### Libraries por Linguagem
- **Python:** RPi.GPIO, gpiozero, Textual, Rich
- **Rust:** rppal, rust_gpiozero, Ratatui
- **Go:** periph.io, gpio, Bubble Tea
- **Node.js:** onoff, johnny-five, Ink

---

## 📈 Métricas de Sucesso

- 26 páginas de conteúdo (EN + PT-BR = 52 arquivos HTML)
- 5 projetos completos com código fonte
- 20+ exemplos de código por linguagem
- 10+ diagramas e esquemas
- 100% de cobertura de tradução PT-BR

---

## 🎯 Integração com Restante da Wiki

### Links Cruzados
- Referenciar tutoriais de TUI/CLI existentes
- Link para frameworks (Textual, Ratatui, etc.)
- Referenciar snippets (spinners, progress bars)
- Best practices de CLI parsing

### Atualização da Home
- Adicionar Raspberry Pi na sidebar
- Feature card na home
- Quick start específico para Pi
- Search index com termos de Pi

---

## 💡 Ideias Futuras (Pós-Lançamento)

- Vídeo tutoriais complementares
- Kit de materiais para download
- Comunidade de projetos
- Competições trimestrais
- Integração com Arduino/ESP32
- Projetos com câmera Pi
- Audio e música com Pi

---

**"O Raspberry Pi 3B é a plataforma perfeita para aprender desenvolvimento TUI/CLI - acessível, versátil e poderosa o suficiente para projetos reais."**

— Plano Ragnarok WIKI, 2026
