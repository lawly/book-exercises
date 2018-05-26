// ## FILTERED LS (Exercise 5 of 13)  
   
// Create a program that prints a list of files in a given directory,  
// filtered by the extension of the files. You will be provided a directory  
// name as the first argument to your program (e.g. '/path/to/dir/') and a  
// file extension to filter by as the second argument.  
 
// For example, if you get 'txt' as the second argument then you will need to  
// filter the list to only files that end with .txt. Note that the second  
// argument will not come prefixed with a '.'.  
 
// Keep in mind that the first arguments of your program are not the first  
// values of the process.argv array, as the first two values are reserved for  
// system info by Node.  
 
// The list of files should be printed to the console, one file per line. You  
// must use asynchronous I/O. 

let fs = require("fs"),
    path = require("path");
    
let directory = process.argv[2],
    extension = process.argv[3];
    
if (process.argv.length != 4) return;

fs.readdir(directory, "utf-8", (err, files) => {
    if (err) return console.error(`error: ${err}`);

    // let filtered = applyFilter(files, extension);
    let filtered = files.filter(file => path.extname(file) === `.${extension}`);
    filtered.forEach(file => console.log(file));
});

// ALTERNATIVE:
function applyFilter(files, extension) {
    return files.reduce((acc, file) => {
        if (path.extname(file) === `.${extension}`)
            acc.push(file);
        return acc;
    }, []);
}