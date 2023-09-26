const TomSelect = require('tom-select');

if (document.querySelector('[data-tomselect]')) {
    document.querySelectorAll('[data-tomselect]').forEach((el) => {
        new TomSelect(`#${el.id}`, JSON.parse(el.dataset.tomselectOptions));
    });
}
