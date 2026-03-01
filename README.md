# ⚡ TUI/CLI Wiki

A comprehensive static wiki for **Text User Interface (TUI)** and **Command Line Interface (CLI)** development. Built with pure HTML/CSS/JavaScript for maximum performance and simplicity.

![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-blue?logo=github)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-success)

## 🌟 Features

- **⚡ Lightning Fast** - Static HTML/CSS/JS, no build process required
- **🎨 Terminal-Modern Theme** - Dark mode native, inspired by Dracula/Gruvbox
- **📱 Fully Responsive** - Works on desktop, tablet, and mobile
- **🔍 Client-Side Search** - Fast, indexed search without a server
- **♿ Accessible** - Keyboard navigation, screen reader friendly
- **🌙 Light/Dark Theme** - Toggle between themes instantly
- **📋 Copy-to-Clipboard** - One-click code copying

## 📚 Content

### Tutorials
- [What is TUI?](./wiki-tui-cli/content/tutorials/what-is-tui.html)
- [CLI Basics](./wiki-tui-cli/content/tutorials/cli-basics.html)

### Frameworks
| Language | Framework | Description |
|----------|-----------|-------------|
| 🐍 Python | [Textual](./wiki-tui-cli/content/frameworks/python-textual.html) | Modern async TUI framework |
| 🐍 Python | [Rich](./wiki-tui-cli/content/frameworks/python-rich.html) | Beautiful terminal output |
| 🦀 Rust | [Ratatui](./wiki-tui-cli/content/frameworks/rust-ratatui.html) | Terminal UI library |
| 🔵 Go | [Bubble Tea](./wiki-tui-cli/content/frameworks/go-bubbletea.html) | Elm architecture for TUI |
| 🟢 Node.js | [Ink](./wiki-tui-cli/content/frameworks/nodejs-ink.html) | React for CLI |

### Best Practices
- [CLI Argument Parsing](./wiki-tui-cli/content/best-practices/cli-parsing.html)
- [TUI Accessibility](./wiki-tui-cli/content/best-practices/tui-accessibility.html)
- [Color Schemes](./wiki-tui-cli/content/best-practices/color-schemes.html)

### Code Snippets
- [Loading Spinners](./wiki-tui-cli/content/snippets/loading-spinners.html)
- [Progress Bars](./wiki-tui-cli/content/snippets/progress-bars.html)
- [Data Tables](./wiki-tui-cli/content/snippets/tables.html)

## 🚀 Quick Start

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/yourusername/ragnarok.git
cd ragnarok/wiki-tui-cli
```

2. Open `index.html` in your browser, or use a local server:
```bash
# Python
python -m http.server 8000

# Node.js
npx serve .

# Go
python -m http.server 8000
```

3. Visit `http://localhost:8000`

### GitHub Pages Deployment

The wiki automatically deploys to GitHub Pages when you push to the `main` branch.

1. Go to your repository **Settings** → **Pages**
2. Set **Source** to "GitHub Actions"
3. Push changes to trigger deployment

Your wiki will be available at: `https://yourusername.github.io/ragnarok`

## 🤖 Agent Team

This wiki is maintained by a team of AI agents coordinated by **Ragnarok**:

| Agent | Role | Specialty |
|-------|------|-----------|
| 🦊 Loki | Frontend Developer | HTML, CSS, JavaScript |
| ⚡ Thor | TUI/CLI Engineer | Code examples, frameworks |
| 📜 Odin | Technical Writer | Documentation, tutorials |
| 👁️ Heimdall | DevOps & Integration | Scripts, automation |

### Invoking Agents

Use the unified invocation script:

```bash
# Invoke Loki (Frontend) via QWEN CLI
./scripts/invoke.sh --agent loki --cli qwen --task "Create new page"

# Invoke Thor (TUI Expert) via GEMINI CLI
./scripts/invoke.sh --agent thor --cli gemini --task "Review code example"

# List available agents
./scripts/invoke.sh --list-agents
```

## 📁 Project Structure

```
wiki-tui-cli/
├── index.html                 # Home page
├── css/
│   ├── style.css              # Global styles
│   └── terminal-theme.css     # Theme colors
├── js/
│   ├── main.js                # UI interactions
│   └── search.js              # Search functionality
├── content/
│   ├── tutorials/             # Tutorial pages
│   ├── frameworks/            # Framework docs
│   ├── best-practices/        # Guidelines
│   └── snippets/              # Code snippets
├── scripts/
│   ├── invoke.sh              # Agent invocation
│   └── agents.json            # Agent configuration
└── assets/
    └── fonts/                 # Custom fonts
```

## 🎨 Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `/` | Focus search |
| `t` | Toggle theme |
| `b` | Toggle sidebar |
| `Esc` | Close sidebar/search |

## 🛠️ Customization

### Adding New Pages

1. Create a new HTML file in the appropriate `content/` subfolder
2. Copy the structure from an existing page
3. Update the sidebar navigation
4. Add the page to the search index in `js/search.js`

### Custom Themes

Edit `css/terminal-theme.css` to create custom color schemes:

```css
:root {
    --accent-primary: #your-color;
    --bg-primary: #your-background;
    /* ... */
}
```

## 📄 License

MIT License - See [LICENSE](LICENSE) for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/yourusername/ragnarok/issues)
- **Discussions:** [GitHub Discussions](https://github.com/yourusername/ragnarok/discussions)

---

Built with ⚡ by the **Ragnarok Team** | Hosted on GitHub Pages
