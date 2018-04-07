for(let i = 1; i < 101; i++) {
    let result = "";
    result = i % 3 === 0 ? "Fizz" : "";
    result = i % 5 === 0 ? "Buzz" : "";
    console.log(result || i);
}
