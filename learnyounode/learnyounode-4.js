// ## MY FIRST ASYNC I/O! (Exercise 4 of 13)  
   
// Write a program that uses a single asynchronous filesystem operation to  
// read a file and print the number of newlines it contains to the console  
// (stdout), similar to running cat file | wc -l.  
 
// The full path to the file to read will be provided as the first  
// command-line argument.  

let fs = require("fs");
let file = process.argv[2];

if (!file) return;

fs.readFile(file, 'utf8', (err, content) => {
    if (err) {
        console.log(`error: ${err}`);
    } else {
        let numberOfLines = content.split("\n").length - 1;
        console.log(numberOfLines);
    }
});