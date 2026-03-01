/* ============================================
   TUI/CLI Wiki - Search Module
   Client-side indexed search functionality
   ============================================ */

document.addEventListener('DOMContentLoaded', () => {
    Search.init();
});

/* ============================================
   Search Index
   Add new pages here as they are created
   ============================================ */
const searchIndex = [
    /* ===========================
       ENGLISH PAGES
       =========================== */
    {
        title: 'Home',
        path: 'index.html',
        category: 'Navigation',
        description: 'Welcome page with overview of TUI/CLI frameworks and quick start guide.',
        keywords: ['home', 'welcome', 'dashboard', 'overview', 'start']
    },
    /* ===========================
       PORTUGUESE (PT-BR) PAGES
       =========================== */
    {
        title: 'Início',
        path: 'index.pt-br.html',
        category: 'Navigation',
        description: 'Página inicial com visão geral dos frameworks TUI/CLI e guia de início rápido.',
        keywords: ['início', 'home', 'bem-vindo', 'dashboard', 'visão', 'geral', 'começar']
    },
    {
        title: 'What is TUI?',
        path: 'content/tutorials/what-is-tui.html',
        category: 'Tutorial',
        description: 'Introduction to Text User Interfaces - history, benefits, and use cases.',
        keywords: ['tui', 'text', 'interface', 'terminal', 'introduction', 'basics']
    },
    {
        title: 'O que é TUI?',
        path: 'content/tutorials/what-is-tui.pt-br.html',
        category: 'Tutorial',
        description: 'Introdução a Text User Interfaces - história, benefícios e casos de uso.',
        keywords: ['tui', 'texto', 'interface', 'terminal', 'introdução', 'básico', 'o que é']
    },
    {
        title: 'CLI Basics',
        path: 'content/tutorials/cli-basics.html',
        category: 'Tutorial',
        description: 'Fundamentals of Command Line Interface design and best practices.',
        keywords: ['cli', 'command', 'line', 'interface', 'basics', 'fundamentals']
    },
    {
        title: 'Fundamentos de CLI',
        path: 'content/tutorials/cli-basics.pt-br.html',
        category: 'Tutorial',
        description: 'Fundamentos de design de Command Line Interface e melhores práticas.',
        keywords: ['cli', 'comando', 'linha', 'interface', 'básico', 'fundamentos']
    },
    {
        title: 'Python Textual',
        path: 'content/frameworks/python-textual.html',
        category: 'Framework',
        description: 'Complete guide to Textual framework for Python TUI applications.',
        keywords: ['python', 'textual', 'framework', 'tui', 'widgets', 'async']
    },
    {
        title: 'Python Rich',
        path: 'content/frameworks/python-rich.html',
        category: 'Framework',
        description: 'Rich library for beautiful terminal output in Python.',
        keywords: ['python', 'rich', 'terminal', 'output', 'colors', 'tables']
    },
    {
        title: 'Rust Ratatui',
        path: 'content/frameworks/rust-ratatui.html',
        category: 'Framework',
        description: 'Ratatui library for building terminal interfaces in Rust.',
        keywords: ['rust', 'ratatui', 'tui', 'terminal', 'widgets']
    },
    {
        title: 'Go Bubble Tea',
        path: 'content/frameworks/go-bubbletea.html',
        category: 'Framework',
        description: 'Bubble Tea framework for Go TUI applications using The Elm Architecture.',
        keywords: ['go', 'golang', 'bubbletea', 'bubble', 'tea', 'elm', 'tui']
    },
    {
        title: 'Node.js Ink',
        path: 'content/frameworks/nodejs-ink.html',
        category: 'Framework',
        description: 'Ink framework for building CLI interfaces with React in Node.js.',
        keywords: ['nodejs', 'node', 'ink', 'react', 'cli', 'javascript']
    },
    {
        title: 'CLI Argument Parsing',
        path: 'content/best-practices/cli-parsing.html',
        category: 'Best Practice',
        description: 'Best practices for parsing command line arguments across languages.',
        keywords: ['cli', 'arguments', 'parsing', 'flags', 'options', 'args']
    },
    {
        title: 'TUI Accessibility',
        path: 'content/best-practices/tui-accessibility.html',
        category: 'Best Practice',
        description: 'Making terminal interfaces accessible to all users.',
        keywords: ['accessibility', 'a11y', 'keyboard', 'screen', 'reader', 'tui']
    },
    {
        title: 'Color Schemes',
        path: 'content/best-practices/color-schemes.html',
        category: 'Best Practice',
        description: 'Guide to choosing and implementing color schemes in TUI apps.',
        keywords: ['colors', 'themes', 'schemes', 'palette', 'design', 'tui']
    },
    {
        title: 'Loading Spinners',
        path: 'content/snippets/loading-spinners.html',
        category: 'Snippet',
        description: 'Collection of loading spinner implementations across frameworks.',
        keywords: ['loading', 'spinner', 'progress', 'animation', 'indicator']
    },
    {
        title: 'Progress Bars',
        path: 'content/snippets/progress-bars.html',
        category: 'Snippet',
        description: 'Progress bar implementations for long-running operations.',
        keywords: ['progress', 'bar', 'loading', 'percentage', 'task']
    },
    {
        title: 'Data Tables',
        path: 'content/snippets/tables.html',
        category: 'Snippet',
        description: 'Creating and styling data tables in terminal interfaces.',
        keywords: ['tables', 'data', 'grid', 'rows', 'columns', 'display']
    }
];

/* ============================================
   Search Module
   ============================================ */
const Search = {
    input: null,
    resultsContainer: null,
    minQueryLength: 2,
    maxResults: 10,
    
    init() {
        this.input = document.getElementById('searchInput');
        this.resultsContainer = document.getElementById('searchResults');
        
        if (this.input) {
            this.input.addEventListener('input', (e) => this.handleInput(e));
            this.input.addEventListener('focus', () => this.handleFocus());
            this.input.addEventListener('blur', () => setTimeout(() => this.hideResults(), 200));
            this.input.addEventListener('keydown', (e) => this.handleKeydown(e));
        }
        
        // Also initialize mobile search if present
        const mobileInput = document.getElementById('searchModalInput');
        if (mobileInput) {
            mobileInput.addEventListener('input', (e) => this.handleInput(e, mobileInput));
        }
    },
    
    handleInput(e, customInput = null) {
        const query = e.target.value.trim().toLowerCase();
        const input = customInput || this.input;
        const resultsContainer = customInput ? 
            document.getElementById('searchResults') : this.resultsContainer;
        
        if (query.length < this.minQueryLength) {
            this.hideResults();
            return;
        }
        
        const results = this.search(query);
        this.displayResults(results, resultsContainer);
    },
    
    handleFocus() {
        const query = this.input.value.trim().toLowerCase();
        if (query.length >= this.minQueryLength) {
            const results = this.search(query);
            this.displayResults(results);
        }
    },
    
    handleKeydown(e) {
        const results = this.resultsContainer.querySelectorAll('.search-result-item');
        
        switch (e.key) {
            case 'ArrowDown':
                e.preventDefault();
                this.navigateResults(results, 1);
                break;
            case 'ArrowUp':
                e.preventDefault();
                this.navigateResults(results, -1);
                break;
            case 'Enter':
                e.preventDefault();
                const selected = this.resultsContainer.querySelector('.search-result-item.selected');
                if (selected) {
                    selected.click();
                }
                break;
            case 'Escape':
                this.hideResults();
                this.input.blur();
                break;
        }
    },
    
    navigateResults(results, direction) {
        if (results.length === 0) return;
        
        const current = this.resultsContainer.querySelector('.search-result-item.selected');
        const currentIndex = Array.from(results).indexOf(current);
        
        let newIndex = currentIndex + direction;
        if (newIndex < 0) newIndex = results.length - 1;
        if (newIndex >= results.length) newIndex = 0;
        
        results.forEach(r => r.classList.remove('selected'));
        results[newIndex].classList.add('selected');
        results[newIndex].scrollIntoView({ block: 'nearest' });
    },
    
    search(query) {
        const queryTerms = query.split(/\s+/).filter(term => term.length > 0);
        
        return searchIndex
            .map(item => {
                const score = this.calculateScore(item, queryTerms);
                return { ...item, score };
            })
            .filter(item => item.score > 0)
            .sort((a, b) => b.score - a.score)
            .slice(0, this.maxResults);
    },
    
    calculateScore(item, queryTerms) {
        let score = 0;
        
        const searchText = [
            item.title,
            item.description,
            item.category,
            ...(item.keywords || [])
        ].join(' ').toLowerCase();
        
        queryTerms.forEach(term => {
            // Exact title match (highest score)
            if (item.title.toLowerCase().includes(term)) {
                score += 50;
            }
            
            // Keyword match
            if ((item.keywords || []).some(k => k.toLowerCase().includes(term))) {
                score += 30;
            }
            
            // Description match
            if (item.description.toLowerCase().includes(term)) {
                score += 20;
            }
            
            // Category match
            if (item.category.toLowerCase().includes(term)) {
                score += 15;
            }
            
            // General text match
            if (searchText.includes(term)) {
                score += 10;
            }
            
            // Bonus for word boundary matches
            const regex = new RegExp(`\\b${term}`, 'i');
            if (regex.test(item.title)) {
                score += 20;
            }
        });
        
        return score;
    },
    
    displayResults(results, container = null) {
        const resultsContainer = container || this.resultsContainer;
        
        if (results.length === 0) {
            resultsContainer.innerHTML = `
                <div class="search-result-item">
                    <div class="search-result-title">No results found</div>
                    <div class="search-result-path">Try different keywords</div>
                </div>
            `;
            resultsContainer.classList.add('active');
            return;
        }
        
        resultsContainer.innerHTML = results.map(item => `
            <a href="${item.path}" class="search-result-item" data-path="${item.path}">
                <div class="search-result-title">${this.highlightMatch(item.title)}</div>
                <div class="search-result-path">${item.category} • ${item.path}</div>
                <div class="search-result-description">${item.description}</div>
            </a>
        `).join('');
        
        resultsContainer.classList.add('active');
    },
    
    highlightMatch(text) {
        const query = this.input.value.trim();
        if (!query) return text;
        
        const regex = new RegExp(`(${query})`, 'gi');
        return text.replace(regex, '<mark>$1</mark>');
    },
    
    hideResults() {
        if (this.resultsContainer) {
            this.resultsContainer.classList.remove('active');
        }
    }
};

// Export for use in other scripts
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { Search, searchIndex };
}
