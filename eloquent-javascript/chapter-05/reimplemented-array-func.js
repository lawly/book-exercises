function filter(array, condition) {
    let result = [];
    for (let item of array) {
        if (condition(item)) {
            result.push(item);
        }
    }
    return result;
}

let arr = [1, 4, 6, 23, 2, 556, 53, 7, 9];
let result = filter(arr, filter => filter < 10);
console.log(result);

function map(array, transform) {
    let result = [];
    for (let item of array) {
        result.push(transform(item));
    }
    return result;
}

result = map(arr, item => Math.floor(item / 2));
console.log(result);

function reduce(array, reduction, start) {
    let result = start;
    for (let item of array) {
        result = reduction(result, item);
    }
    return result;
}

result = reduce(arr, (x, y) => x + y, 0);
console.log(result);