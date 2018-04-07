// solutions as required in ejs
function countBs(str) {
    let count = 0;
    for(let n = 0; n <= str.length - 1; n++) {
        if (str[n] === 'B') count++;
    }
    return count;
}

function countChar(str, chr) {
    let count = 0;
    for(let n = 0; n <= str.length - 1; n++) {
        if (str[n] === chr) count++;
    }
    return count;
}

function countBs(str) {
    function countChar(str, chr) {
        let count = 0;
        for(let n = 0; n <= str.length - 1; n++) {
            if (str[n] === chr) count++;
        }
        return count;
    }
    return countChar(str, 'B');
}

// advanced solution
function countBs(str) {
    return str.split("").reduce((acc, curr) => curr === 'B' ? acc + 1 : acc + 0, 0);
}

function countBs(str) {
    function countChar(str, chr) {
        return str.split("").reduce((acc, curr) => curr === chr ? ++acc : acc, 0);
    }
    return countChar(str, 'B');
}

console.log(countBs("ABC"));
console.log(countBs("123bbBcdBBb"));
console.log(countBs("BBBBbbBB"));