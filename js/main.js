/* ============================================
   TUI/CLI Wiki - Main JavaScript
   UI Interactions: Sidebar, Copy, Theme, Tabs
   ============================================ */

document.addEventListener('DOMContentLoaded', () => {
    // Initialize all modules
    Sidebar.init();
    Theme.init();
    CopyCode.init();
    Tabs.init();
    Keyboard.init();
});

/* ============================================
   Sidebar Module
   ============================================ */
const Sidebar = {
    sidebar: null,
    toggleBtn: null,
    overlay: null,
    
    init() {
        this.sidebar = document.getElementById('sidebar');
        this.toggleBtn = document.getElementById('sidebarToggle');
        
        if (this.toggleBtn) {
            this.toggleBtn.addEventListener('click', () => this.toggle());
        }
        
        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', (e) => {
            if (window.innerWidth <= 768 && 
                this.sidebar && 
                this.sidebar.classList.contains('open') &&
                !this.sidebar.contains(e.target) &&
                !this.toggleBtn.contains(e.target)) {
                this.close();
            }
        });
        
        // Close sidebar on escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.sidebar?.classList.contains('open')) {
                this.close();
            }
        });
    },
    
    toggle() {
        this.sidebar.classList.toggle('open');
    },
    
    open() {
        this.sidebar.classList.add('open');
    },
    
    close() {
        this.sidebar.classList.remove('open');
    }
};

/* ============================================
   Theme Module
   ============================================ */
const Theme = {
    toggleBtn: null,
    themeIcon: null,
    currentTheme: 'dark',
    
    init() {
        this.toggleBtn = document.getElementById('themeToggle');
        this.themeIcon = this.toggleBtn?.querySelector('.theme-icon');
        
        // Load saved theme
        const savedTheme = localStorage.getItem('wiki-theme');
        if (savedTheme) {
            this.setTheme(savedTheme);
        } else {
            // Check system preference
            const prefersLight = window.matchMedia('(prefers-color-scheme: light)').matches;
            this.setTheme(prefersLight ? 'light' : 'dark');
        }
        
        if (this.toggleBtn) {
            this.toggleBtn.addEventListener('click', () => this.toggle());
        }
    },
    
    toggle() {
        const newTheme = this.currentTheme === 'dark' ? 'light' : 'dark';
        this.setTheme(newTheme);
    },
    
    setTheme(theme) {
        this.currentTheme = theme;
        document.documentElement.setAttribute('data-theme', theme);
        localStorage.setItem('wiki-theme', theme);
        
        if (this.themeIcon) {
            this.themeIcon.textContent = theme === 'dark' ? '🌙' : '☀️';
        }
    }
};

/* ============================================
   Copy Code Module
   ============================================ */
const CopyCode = {
    init() {
        // Add copy buttons to all code blocks that don't have one
        document.querySelectorAll('pre').forEach((pre) => {
            if (!pre.parentElement.classList.contains('code-block')) {
                this.wrapCodeBlock(pre);
            }
        });
        
        // Handle copy button clicks
        document.addEventListener('click', (e) => {
            const copyBtn = e.target.closest('.copy-btn');
            if (copyBtn) {
                this.copyCode(copyBtn);
            }
        });
    },
    
    wrapCodeBlock(pre) {
        const wrapper = document.createElement('div');
        wrapper.className = 'code-block';
        
        const copyBtn = document.createElement('button');
        copyBtn.className = 'copy-btn';
        copyBtn.setAttribute('aria-label', 'Copy code');
        copyBtn.innerHTML = `
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect>
                <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
            </svg>
        `;
        
        pre.parentNode.insertBefore(wrapper, pre);
        wrapper.appendChild(copyBtn);
        wrapper.appendChild(pre);
    },
    
    async copyCode(btn) {
        const codeBlock = btn.closest('.code-block');
        const code = codeBlock.querySelector('code')?.textContent || 
                     codeBlock.querySelector('pre')?.textContent || '';
        
        try {
            await navigator.clipboard.writeText(code);
            this.showFeedback(btn);
        } catch (err) {
            // Fallback for older browsers
            const textArea = document.createElement('textarea');
            textArea.value = code;
            textArea.style.position = 'fixed';
            textArea.style.left = '-9999px';
            document.body.appendChild(textArea);
            textArea.select();
            document.execCommand('copy');
            document.body.removeChild(textArea);
            this.showFeedback(btn);
        }
    },
    
    showFeedback(btn) {
        const originalHTML = btn.innerHTML;
        btn.innerHTML = `
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
        `;
        btn.style.color = 'var(--accent-success)';
        
        setTimeout(() => {
            btn.innerHTML = originalHTML;
            btn.style.color = '';
        }, 2000);
    }
};

/* ============================================
   Tabs Module
   ============================================ */
const Tabs = {
    init() {
        document.querySelectorAll('.tab-buttons').forEach((container) => {
            const buttons = container.querySelectorAll('.tab-btn');
            
            buttons.forEach((btn) => {
                btn.addEventListener('click', () => {
                    const tabId = btn.dataset.tab;
                    this.switchTab(container, tabId);
                });
            });
        });
    },
    
    switchTab(container, tabId) {
        // Update buttons
        container.querySelectorAll('.tab-btn').forEach((btn) => {
            btn.classList.toggle('active', btn.dataset.tab === tabId);
        });
        
        // Update content
        const tabContent = container.nextElementSibling;
        tabContent.querySelectorAll('.tab-pane').forEach((pane) => {
            const isActive = pane.id === `${tabId}-tab`;
            pane.classList.toggle('active', isActive);
        });
    }
};

/* ============================================
   Keyboard Shortcuts Module
   ============================================ */
const Keyboard = {
    init() {
        document.addEventListener('keydown', (e) => {
            // Press '/' to focus search
            if (e.key === '/' && 
                !['INPUT', 'TEXTAREA'].includes(document.activeElement.tagName)) {
                e.preventDefault();
                const searchInput = document.getElementById('searchInput');
                if (searchInput) {
                    searchInput.focus();
                }
            }
            
            // Press 't' to toggle theme
            if (e.key === 't' && 
                !['INPUT', 'TEXTAREA'].includes(document.activeElement.tagName)) {
                Theme.toggle();
            }
            
            // Press 'b' to toggle sidebar
            if (e.key === 'b' && 
                !['INPUT', 'TEXTAREA'].includes(document.activeElement.tagName)) {
                Sidebar.toggle();
            }
        });
    }
};

/* ============================================
   Utility Functions
   ============================================ */

// Debounce function for search
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Smooth scroll to element
function scrollToElement(element, offset = 0) {
    const elementPosition = element.getBoundingClientRect().top;
    const offsetPosition = elementPosition + window.pageYOffset - offset;
    
    window.scrollTo({
        top: offsetPosition,
        behavior: 'smooth'
    });
}

// Add active class to current nav link based on URL
function highlightCurrentNav() {
    const currentPath = window.location.pathname;
    document.querySelectorAll('.nav-link').forEach((link) => {
        const linkPath = link.getAttribute('href');
        if (currentPath.endsWith(linkPath) || currentPath === linkPath) {
            link.classList.add('active');
        }
    });
}

// Call on load
highlightCurrentNav();
