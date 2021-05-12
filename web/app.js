function getData() {
    return window.figma_json ?? '';
}

window.addEventListener('message', receiver, false);
function receiver(e) {
    console.log({message: e})
    window.figma_json = e;
}
