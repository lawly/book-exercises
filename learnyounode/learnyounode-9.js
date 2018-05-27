// ## JUGGLING ASYNC (Exercise 9 of 13)  
   
// This problem is the same as the previous problem (HTTP COLLECT) in that  
// you need to use http.get(). However, this time you will be provided with  
// three URLs as the first three command-line arguments.  
 
// You must collect the complete content provided to you by each of the URLs  
// and print it to the console (stdout). You don't need to print out the  
// length, just the data as a String; one line per URL. The catch is that you  
// must print them out in the same order as the URLs are provided to you as  
// command-line arguments.  

const http = require("http");

if (process.argv.length !== 5) return;

let result = [];
let urls = process.argv.splice(2);

for (let i = 0; i < urls.length; i++) {
    http.get(urls[i], res => {
        res.setEncoding("utf8");
        let body = "";
        res.on("data", chunk => body += chunk);
        res.on("end", () => {
            result[i] = body;
            if (result.filter(content => content).length === 3) {
                result.forEach(entry => console.log(entry));
            }
        });
    });
}

// only works for unique urls. c9 uses the same url for all requests
function alternative() {
    let urls = new Map();
    let callbackCounter = 0;
    
    process.argv.splice(0, 2);
    process.argv.forEach(url => urls.set(url, ""));
    
    for (var url of urls.keys()) {
        http.get(url, res => {
            let body = "";
            res.setEncoding("utf8");
            res.on("data", (chunk) => body += chunk);
            res.on("end", () => {
                urls.set(url, body);
                callbackCounter++;
                if (callbackCounter === 3) {
                    urls.forEach((value, key) => console.log(value), urls);
                }
            })
        });
    }
}

// node learnyounode-9.js http://www.google.de http://www.google.com http://www.google.fr