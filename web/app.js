function getData() {
    return window.figma_json ?? '';
}

window.addEventListener('message', receiver, false);

function receiver(e) {
    window.figma_json = e.data;
}
