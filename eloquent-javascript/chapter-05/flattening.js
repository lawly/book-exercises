function flatten(array) {
    return array.reduce((acc, value) => {
        return acc.concat(value);
    }, []);
}

let arr = [[1, 2], [3, 4], [5, 6]];
console.log(flatten(arr));