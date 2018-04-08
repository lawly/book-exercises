// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment

function range(start, end, i = 1) {
    let array = [];
    for (let n = start; n <= end; n += i) {     
        array.push(n);
    }
    return array;
}

// alternative
function range(start, end) {
    return Array
        .apply(null, new Array((end - start) + 1))
        .map((value, index) => start + index);
}

function sum(array) {
    return array.reduce((acc, curr) => acc + curr, 0);
}

// bonus assignment
function range(start, end, i = 1) {
    let array = [];
    switch (Math.sign(i)) {
        case 1:
            for (let n = start; n <= end; n += i) {
                array.push(n);
            }
            break;
        case -1:
            for (let n = start; n >= end; n += i) {
                array.push(n);
            }
        break;
    }
    return array;
}