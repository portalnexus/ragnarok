// Theme Toggle
function toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    const newTheme = currentTheme === 'light' ? 'dark' : 'light';
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
}

// Load saved theme
const savedTheme = localStorage.getItem('theme') || 'dark';
document.documentElement.setAttribute('data-theme', savedTheme);

// CRT Toggle
function toggleCRT() {
    const overlay = document.querySelector('.crt-overlay');
    const isHidden = overlay.style.display === 'none';
    overlay.style.display = isHidden ? 'block' : 'none';
    localStorage.setItem('crtEnabled', isHidden);
}

// Load saved CRT state
const crtSaved = localStorage.getItem('crtEnabled');
if (crtSaved === 'false') {
    document.querySelector('.crt-overlay').style.display = 'none';
}

// Mobile Sidebar Toggle
function toggleSidebar() {
    document.getElementById('sidebar').classList.toggle('open');
}

// Search Functionality
function searchContent() {
    const query = document.getElementById('searchInput').value.toLowerCase();
    const sections = document.querySelectorAll('.wiki-section, .hero, .todo-container');

    if (query.length < 2) {
        sections.forEach(section => section.style.display = '');
        return;
    }

    sections.forEach(section => {
        const text = section.textContent.toLowerCase();
        if (text.includes(query)) {
            section.style.display = '';
            highlightText(section, query);
        } else {
            section.style.display = 'none';
        }
    });
}

// Highlight search results
function highlightText(element, query) {
    // Simple highlight - can be enhanced
    const walker = document.createTreeWalker(
        element,
        NodeFilter.SHOW_TEXT,
        null,
        false
    );

    let node;
    const nodes = [];
    while (node = walker.nextNode()) {
        if (node.nodeValue.toLowerCase().includes(query) &&
            !node.parentNode.classList.contains('search-input')) {
            nodes.push(node);
        }
    }
}

// Copy Code Function
function copyCode(btn) {
    const codeBlock = btn.closest('.command-block').querySelector('.command-code');
    const text = codeBlock.innerText;
    navigator.clipboard.writeText(text).then(() => {
        const originalText = btn.textContent;
        btn.textContent = '✅ Copiado!';
        setTimeout(() => {
            btn.textContent = originalText;
        }, 2000);
    });
}

// Todo List Progress
function updateTodo(checkbox) {
    const todoItem = checkbox.closest('.todo-item');
    todoItem.classList.toggle('completed', checkbox.checked);
    updateProgress();
    saveTodos();
}

function updateProgress() {
    const checkboxes = document.querySelectorAll('.todo-checkbox');
    const checked = document.querySelectorAll('.todo-checkbox:checked');
    const progress = (checked.length / checkboxes.length) * 100;

    document.getElementById('progressBar').style.width = progress + '%';
    document.getElementById('progressText').textContent = Math.round(progress) + '%';
}

function saveTodos() {
    const checkboxes = document.querySelectorAll('.todo-checkbox');
    const state = Array.from(checkboxes).map(cb => cb.checked);
    localStorage.setItem('todoState', JSON.stringify(state));
}

function loadTodos() {
    const saved = localStorage.getItem('todoState');
    if (saved) {
        const state = JSON.parse(saved);
        const checkboxes = document.querySelectorAll('.todo-checkbox');
        checkboxes.forEach((cb, index) => {
            if (state[index] !== undefined) {
                cb.checked = state[index];
                cb.closest('.todo-item').classList.toggle('completed', state[index]);
            }
        });
        updateProgress();
    }
}

// Active Navigation on Scroll
function updateActiveNav() {
    const sections = document.querySelectorAll('.wiki-section, #hero');
    const navLinks = document.querySelectorAll('.nav-list a');

    let current = '';
    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;
        if (scrollY >= sectionTop - 100) {
            current = section.getAttribute('id');
        }
    });

    navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === '#' + current) {
            link.classList.add('active');
        }
    });
}

// Keyboard Shortcuts
document.addEventListener('keydown', (e) => {
    if (e.ctrlKey && e.key === 'k') {
        e.preventDefault();
        document.getElementById('searchInput').focus();
    }
});

// Event Listeners
window.addEventListener('scroll', updateActiveNav);
window.addEventListener('load', loadTodos);

// Close sidebar on mobile when clicking outside
document.addEventListener('click', (e) => {
    const sidebar = document.getElementById('sidebar');
    const menuBtn = document.querySelector('.mobile-menu-btn');
    if (window.innerWidth <= 768 &&
        !sidebar.contains(e.target) &&
        !menuBtn.contains(e.target)) {
        sidebar.classList.remove('open');
    }
});
