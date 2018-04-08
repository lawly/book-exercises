function arrayToList(array) {
    if (!array.length) return null;
    return { 
        value: array[0],
        rest: arrayToList(array.slice(1))
    };
}

function listToArray(list) {
    if (!list.rest) return list.value;
    return [].concat(list.value)
             .concat(listToArray(list.rest));
}

function prepend(value, list) {

    return { value: value, rest: list };
}

function nth(list, position) {
    if (!position) return list.value;
    if (!list.rest) return undefined;
    return nth(list.rest, --position);
}

let list = { value: 4, rest: { value: 7, rest: { value: 1, rest: null } } };

// console.log(arrayToList([1, 2, 3]));
// console.log(listToArray(list));
// console.log(prepend(list, { value: 5, rest: null }));
// console.log(nth(list, 0));
// console.log(nth(list, 1));
// console.log(nth(list, 2));
// console.log(nth(list, 3));

console.log(arrayToList([10, 20]));
// → {value: 10, rest: {value: 20, rest: null}}
console.log(listToArray(arrayToList([10, 20, 30])));
// → [10, 20, 30]
console.log(prepend(10, prepend(20, null)));
// → {value: 10, rest: {value: 20, rest: null}}
console.log(nth(arrayToList([10, 20, 30]), 1));
// → 20