const TomSelect = require('tom-select');

if (document.querySelector('[data-tomselect]')) {
    new TomSelect('[data-tomselect]', { create: true });
}
