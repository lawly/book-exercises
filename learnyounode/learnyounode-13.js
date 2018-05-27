// ## HTTP JSON API SERVER (Exercise 13 of 13)  
   
// Write an HTTP server that serves JSON data when it receives a GET request  
// to the path '/api/parsetime'. Expect the request to contain a query string  
// with a key 'iso' and an ISO-format time as the value.  
 
// For example:  
 
// /api/parsetime?iso=2013-08-10T12:10:15.474Z  
 
// The JSON response should contain only 'hour', 'minute' and 'second'  
// properties. For example:  
 
//    {  
//      "hour": 14,  
//      "minute": 23,  
//      "second": 15  
//    }  
 
// Add second endpoint for the path '/api/unixtime' which accepts the same  
// query string but returns UNIX epoch time in milliseconds (the number of  
// milliseconds since 1 Jan 1970 00:00:00 UTC) under the property 'unixtime'.  
// For example:  
 
//    { "unixtime": 1376136615474 }  
 
// Your server should listen on the port provided by the first argument to  
// your program. 
const ENDPOINT_PARSETIME = "/api/parsetime";
const ENDPOINT_UNIXTIME = "/api/unixtime";

const http = require("http");
const url = require("url");

if (process.argv.length !== 3) return;

const port = process.argv[2];
const server = http.createServer();

// https://nodejs.org/api/http.html#http_event_request
server.on("request", (request, response) => {
    if (request.method === "GET") {
        let endpoint = url.parse(request.url, true);
        let { query } = endpoint;
        let result = "";
        switch (endpoint.pathname) {
            case ENDPOINT_PARSETIME:
                result = dateFromQuery(query);
                break;
            case ENDPOINT_UNIXTIME:
                result = unixtimeFromQuery(query);
                break;
            default:
                response.writeHead(404, { "content-type": "text/plain" });
                response.end();
                break;
        }
        response.end(JSON.stringify(result));
    }
});

server.listen(port);

function dateFromQuery(query) {
    let date = new Date(query.iso);
    return {
        hour: date.getHours(),
        minute: date.getMinutes(),
        second: date.getSeconds()
    };
}

function unixtimeFromQuery(query) {
    return { "unixtime": Date.parse(query.iso) };
}

