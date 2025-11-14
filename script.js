// ============================================
// Theme Toggle
// ============================================
const themeToggle = document.getElementById('themeToggle');
const html = document.documentElement;

// Check for saved theme preference or default to light mode
const currentTheme = localStorage.getItem('theme') || 'light';
html.setAttribute('data-theme', currentTheme);

themeToggle.addEventListener('click', () => {
    const theme = html.getAttribute('data-theme');
    const newTheme = theme === 'light' ? 'dark' : 'light';

    html.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
});

// ============================================
// Search Modal
// ============================================
const searchBtn = document.getElementById('searchBtn');
const searchModal = document.getElementById('searchModal');
const searchClose = document.getElementById('searchClose');
const searchInput = document.getElementById('searchInput');
const searchResults = document.getElementById('searchResults');

// Open search modal
searchBtn.addEventListener('click', () => {
    searchModal.classList.add('active');
    searchInput.focus();
});

// Close search modal
searchClose.addEventListener('click', closeSearchModal);
searchModal.addEventListener('click', (e) => {
    if (e.target === searchModal) {
        closeSearchModal();
    }
});

// Close with ESC key
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && searchModal.classList.contains('active')) {
        closeSearchModal();
    }
    // Open search with Ctrl+K or Cmd+K
    if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
        e.preventDefault();
        searchModal.classList.add('active');
        searchInput.focus();
    }
});

function closeSearchModal() {
    searchModal.classList.remove('active');
    searchInput.value = '';
    searchResults.innerHTML = '<p class="search-hint">Digite para buscar na documentação</p>';
}

// Simple search functionality
const searchableContent = [
    { title: 'Introdução', section: 'introducao', content: 'Bem-vindo documentação português Brasil' },
    { title: 'Instalação', section: 'instalacao', content: 'npm install yarn pnpm pacote' },
    { title: 'Guia Rápido', section: 'guia-rapido', content: 'exemplo código começar aplicação' },
    { title: 'Conceitos Básicos', section: 'conceitos', content: 'componentes estado props ciclo vida' },
    { title: 'Como Contribuir', section: 'contribuir', content: 'contribuir doação apoiar tradução' }
];

searchInput.addEventListener('input', (e) => {
    const query = e.target.value.toLowerCase().trim();

    if (query.length === 0) {
        searchResults.innerHTML = '<p class="search-hint">Digite para buscar na documentação</p>';
        return;
    }

    if (query.length < 2) {
        searchResults.innerHTML = '<p class="search-hint">Digite pelo menos 2 caracteres</p>';
        return;
    }

    const results = searchableContent.filter(item =>
        item.title.toLowerCase().includes(query) ||
        item.content.toLowerCase().includes(query)
    );

    if (results.length === 0) {
        searchResults.innerHTML = '<p class="search-hint">Nenhum resultado encontrado</p>';
        return;
    }

    searchResults.innerHTML = results.map(result => `
        <div class="search-result-item" onclick="navigateToSection('${result.section}')">
            <strong>${result.title}</strong>
            <p>${result.content.substring(0, 80)}...</p>
        </div>
    `).join('');
});

function navigateToSection(section) {
    closeSearchModal();
    const element = document.getElementById(section);
    if (element) {
        element.scrollIntoView({ behavior: 'smooth' });

        // Update active link in sidebar
        document.querySelectorAll('.sidebar-nav a').forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === `#${section}`) {
                link.classList.add('active');
            }
        });
    }
}

// Add styles for search results
const style = document.createElement('style');
style.textContent = `
    .search-result-item {
        padding: 1rem;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.2s ease;
        margin-bottom: 0.5rem;
    }

    .search-result-item:hover {
        background-color: var(--bg-secondary);
    }

    .search-result-item strong {
        display: block;
        color: var(--text-primary);
        margin-bottom: 0.25rem;
    }

    .search-result-item p {
        margin: 0;
        font-size: 0.875rem;
        color: var(--text-secondary);
    }
`;
document.head.appendChild(style);

// ============================================
// Code Copy Functionality
// ============================================
function copyCode(button) {
    const codeBlock = button.closest('.code-block');
    const code = codeBlock.querySelector('code').textContent;

    navigator.clipboard.writeText(code).then(() => {
        const originalText = button.innerHTML;
        button.innerHTML = `
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                <path d="M13 4L6 11L3 8" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            Copiado!
        `;

        setTimeout(() => {
            button.innerHTML = originalText;
        }, 2000);
    }).catch(err => {
        console.error('Erro ao copiar:', err);
    });
}

// ============================================
// Active Link Highlighting on Scroll
// ============================================
const sections = document.querySelectorAll('section[id]');
const navLinks = document.querySelectorAll('.sidebar-nav a[href^="#"]');

function highlightActiveLink() {
    let current = '';

    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;

        if (window.scrollY >= sectionTop - 100) {
            current = section.getAttribute('id');
        }
    });

    navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === `#${current}`) {
            link.classList.add('active');
        }
    });
}

window.addEventListener('scroll', highlightActiveLink);

// ============================================
// Smooth Scroll for Navigation Links
// ============================================
navLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        const targetId = link.getAttribute('href').substring(1);
        const targetElement = document.getElementById(targetId);

        if (targetElement) {
            targetElement.scrollIntoView({ behavior: 'smooth' });
        }
    });
});

// ============================================
// PIX Modal (Optional Enhancement)
// ============================================
document.querySelectorAll('.btn-pix').forEach(button => {
    button.addEventListener('click', (e) => {
        e.preventDefault();
        showPixModal();
    });
});

function showPixModal() {
    const modal = document.createElement('div');
    modal.className = 'pix-modal';
    modal.innerHTML = `
        <div class="pix-modal-content">
            <div class="pix-modal-header">
                <h3>Doar via PIX</h3>
                <button onclick="this.closest('.pix-modal').remove()" class="pix-close">&times;</button>
            </div>
            <div class="pix-modal-body">
                <div class="pix-qrcode">
                    <svg width="200" height="200" viewBox="0 0 200 200">
                        <rect width="200" height="200" fill="white"/>
                        <rect x="20" y="20" width="60" height="60" fill="black"/>
                        <rect x="120" y="20" width="60" height="60" fill="black"/>
                        <rect x="20" y="120" width="60" height="60" fill="black"/>
                        <rect x="30" y="30" width="40" height="40" fill="white"/>
                        <rect x="130" y="30" width="40" height="40" fill="white"/>
                        <rect x="30" y="130" width="40" height="40" fill="white"/>
                        <rect x="40" y="40" width="20" height="20" fill="black"/>
                        <rect x="140" y="40" width="20" height="20" fill="black"/>
                        <rect x="40" y="140" width="20" height="20" fill="black"/>
                        <rect x="100" y="60" width="20" height="20" fill="black"/>
                        <rect x="140" y="100" width="20" height="20" fill="black"/>
                        <rect x="100" y="140" width="20" height="20" fill="black"/>
                    </svg>
                </div>
                <p class="pix-key-label">Chave PIX:</p>
                <div class="pix-key-box">
                    <code id="pixKey">documentacao@dev.com.br</code>
                    <button onclick="copyPixKey()" class="copy-pix-btn">
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <rect x="5" y="5" width="9" height="9" stroke="currentColor" stroke-width="1.5"/>
                            <path d="M11 5V2H2V11H5" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                    </button>
                </div>
                <p class="pix-info">Escaneie o QR Code ou copie a chave PIX acima</p>
            </div>
        </div>
    `;

    document.body.appendChild(modal);

    // Close on backdrop click
    modal.addEventListener('click', (e) => {
        if (e.target === modal) {
            modal.remove();
        }
    });
}

function copyPixKey() {
    const pixKey = document.getElementById('pixKey').textContent;
    navigator.clipboard.writeText(pixKey).then(() => {
        const button = document.querySelector('.copy-pix-btn');
        const originalHTML = button.innerHTML;
        button.innerHTML = `
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                <path d="M13 4L6 11L3 8" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        `;

        setTimeout(() => {
            button.innerHTML = originalHTML;
        }, 2000);
    });
}

// PIX Modal Styles
const pixModalStyle = document.createElement('style');
pixModalStyle.textContent = `
    .pix-modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        backdrop-filter: blur(4px);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 2000;
        padding: 2rem;
    }

    .pix-modal-content {
        background-color: var(--bg-primary);
        border-radius: 16px;
        max-width: 400px;
        width: 100%;
        box-shadow: var(--shadow-lg);
    }

    .pix-modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1.5rem;
        border-bottom: 1px solid var(--border-color);
    }

    .pix-modal-header h3 {
        margin: 0;
        font-size: 1.25rem;
        color: var(--text-primary);
    }

    .pix-close {
        background: none;
        border: none;
        font-size: 2rem;
        color: var(--text-tertiary);
        cursor: pointer;
        width: 32px;
        height: 32px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 6px;
        transition: all 0.2s ease;
    }

    .pix-close:hover {
        background-color: var(--bg-secondary);
        color: var(--text-primary);
    }

    .pix-modal-body {
        padding: 2rem;
        text-align: center;
    }

    .pix-qrcode {
        display: flex;
        justify-content: center;
        margin-bottom: 1.5rem;
        padding: 1rem;
        background-color: white;
        border-radius: 12px;
        display: inline-block;
    }

    .pix-key-label {
        font-size: 0.875rem;
        color: var(--text-tertiary);
        margin-bottom: 0.5rem;
    }

    .pix-key-box {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        padding: 1rem;
        background-color: var(--bg-secondary);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        margin-bottom: 1rem;
    }

    .pix-key-box code {
        flex: 1;
        font-family: 'JetBrains Mono', monospace;
        font-size: 0.875rem;
        color: var(--text-primary);
    }

    .copy-pix-btn {
        padding: 0.5rem;
        background-color: var(--accent-color);
        border: none;
        border-radius: 6px;
        color: white;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.2s ease;
    }

    .copy-pix-btn:hover {
        background-color: var(--accent-hover);
    }

    .pix-info {
        font-size: 0.875rem;
        color: var(--text-secondary);
        margin: 0;
    }
`;
document.head.appendChild(pixModalStyle);

// ============================================
// Initialize on Load
// ============================================
document.addEventListener('DOMContentLoaded', () => {
    console.log('✨ Documentação.dev carregado com sucesso!');
    highlightActiveLink();
});
