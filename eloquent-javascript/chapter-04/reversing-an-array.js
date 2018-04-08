function reverseArray(array) {
    let reversed = [];
    for (let i = array.length - 1; i >= 0; i--) {
        reversed.push(array[i]);
    }
    return reversed;
}

// alternative
function reverseArray(array) {
    let reversed = [];
    array.forEach((value, index) => {
        reversed[array.length - 1 - index] = value;
    });
    return reversed;
}

// alternative
function reverseArray(array) {
    return array.map((value, index, arr) => arr[arr.length - 1 - index]);
}

// 1 2 3 4 5
// 2 1 3 4 5
// 3 2 1 4 5
// 4 3 2 1 5
// 5 4 3 2 1
function reverseArrayInPlace(array) {
    for (let i = 1; i < array.length; i++) {
        array.unshift(...array.splice(i, 1));
    }
    return array;
}

let arr = [1, 2, 3, 4, 5];
console.log(reverseArrayInPlace(arr));
console.log(arr == reverseArrayInPlace(arr));