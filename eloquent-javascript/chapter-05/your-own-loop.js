function loop(value, test, update, body) {
    while (test(value)) {
        body(value);
        value = update(value);
    }
}

loop(1, x => x < 5, x => ++x, console.log);