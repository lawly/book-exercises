function fizzbuzz(number) {
    let result = "";
    result += number % 3 === 0 ? "Fizz" : "";
    result += number % 5 === 0 ? "Buzz" : "";
    return result || i;
}

console.log(fizzbuzz(69));
console.log(fizzbuzz(70));
console.log(fizzbuzz(75));
