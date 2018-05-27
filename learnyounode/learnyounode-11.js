// ## HTTP FILE SERVER (Exercise 11 of 13)  
   
// Write an HTTP server that serves the same text file for each request it  
// receives.  
 
// Your server should listen on the port provided by the first argument to  
// your program.  
 
// You will be provided with the location of the file to serve as the second  
// command-line argument. You must use the fs.createReadStream() method to  
// stream the file contents to the response.  

const fs = require("fs");
const server = require("http").createServer();

if (process.argv.length !== 4) return;
const port = process.argv[2];
const path = process.argv[3];

server.on("request", (request, response) => {
    response.writeHead(200, { "content-type": "text/plain" });
    let source = fs.createReadStream(path);
    source.pipe(response);
});

server.listen(port);