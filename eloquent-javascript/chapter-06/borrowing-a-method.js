let map1 = {
    1: 'one',
    2: 'two',
    [Symbol.hasOwnProperty](value) {
        return `Still can use .hasOwnProperty!`;    
    }
}

let map2 = {
    1: 'one',
    2: 'two',
    hasOwnProperty(value) {
        return `I'm something else!`;
    }
}

console.log(map1[Symbol.hasOwnProperty](1));
console.log(map1.hasOwnProperty(1));

console.log(map2.hasOwnProperty(1)); 

// book solution:
let map = {one: true, two: true, hasOwnProperty: true};
console.log(Object.prototype.hasOwnProperty.call(map, "one"));
