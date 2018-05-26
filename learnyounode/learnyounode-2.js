// ## BABY STEPS (Exercise 2 of 13)  
   
// Write a program that accepts one or more numbers as command-line arguments  
// and prints the sum of those numbers to the console (stdout).

process.argv.splice(0, 2);

let sum = process.argv.reduce((acc, curr) => acc + +curr, 0);

console.log(sum);