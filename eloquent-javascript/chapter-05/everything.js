function every(array, predicate) {
    for (let item of array) {
        if (!predicate(item)) return false;
    }
    return true;
}

function every(array, predicate) {
    return !array.some(x => {
        return !predicate(x);
    });
}