// ## HTTP UPPERCASERER (Exercise 12 of 13)  
   
// Write an HTTP server that receives only POST requests and converts  
// incoming POST body characters to upper-case and returns it to the client.  
 
// Your server should listen on the port provided by the first argument to  
// your program.

// https://nodejs.org/api/http.html#http_class_http_incomingmessage
// https://medium.com/@chris_neave/node-js-streams-by-example-9019398a258

const util = require("util");
const Transform = require("stream").Transform;
const server = require("http").createServer();

if (process.argv.length !== 3) return;
const port = process.argv[2];

// doing it without any dependencies just core libraries
function ToUpperEncoder(options) {
    // invoke the Transform constructor
    Transform.call(this, options);
}

// inherit from streams.Transform
util.inherits(ToUpperEncoder, Transform);

// provide an implementation of the _transform() function
ToUpperEncoder.prototype._transform = (data, encoding, callback) => {
    callback(null, data.toString().toUpperCase());
}

server.on("request", (request, response) => {
    let body = "";
    if (request.method === "POST") {
        request.pipe(new ToUpperEncoder()).pipe(response);    
    } else {
        // response.statusCode = 405;
        // response.statusMessage = "Please send POST!"
        // response.end("Please send POST!");
        response.writeHead(405, { "content-type": "text/plain" });
        response.end();
    }
});

server.listen(port);