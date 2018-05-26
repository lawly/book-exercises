// ## HTTP CLIENT (Exercise 7 of 13)  
   
// Write a program that performs an HTTP GET request to a URL provided to you  
// as the first command-line argument. Write the String contents of each  
// "data" event from the response to a new line on the console (stdout).  

// https://nodejs.org/api/http.html#http_http_get_options_callback
let http = require("http");

let url = process.argv[2];
if (!url) return;

// res is a node stream object which emits events (data, error, end, ..)
http.get(url, (res) => {
    res.setEncoding("utf8");
    res.on("data", (chunk) => console.log(chunk));
}).on("error", console.log);

// node learnyounode/learnyounode-7.js http://www.google.de/