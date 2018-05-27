// ## TIME SERVER (Exercise 10 of 13)  
   
// Write a TCP time server!  
 
// Your server should listen to TCP connections on the port provided by the  
// first argument to your program. For each connection you must write the  
// current date & 24 hour time in the format:  
 
//    "YYYY-MM-DD hh:mm"  
 
// followed by a newline character. Month, day, hour and minute must be  
// zero-filled to 2 integers. For example:  
 
//    "2013-07-06 17:42"  
 
// After sending the string, close the connection. 

const net = require("net");

if (process.argv.length !== 3) return;

const port = process.argv[2];
const server = net.createServer(socket => {
    let now = new CustomDate();
    socket.end(`${now}\r\n`);
});

server.listen(port, "127.0.0.1", () => {
    console.log(`listening on port ${port}`);
});

// better use custom class instead of modifying prototype
// of standard js object Date
class CustomDate {
    constructor() {
        this.date = new Date();
    }

    // converts date to string YYYY-MM-dd hh:mm
    // note learnyounode does not support .padStart() (ECMA-262)
    toString() {
        let yyyymmdd = [
            this.date.getFullYear(),
            this.date.getMonth().toString().padStart(2, "0"),
            this.date.getDate().toString().padStart(2, "0")
        ].join("-");
    
        let hhmm = [
            this.date.getHours().toString().padStart(2, "0"),
            this.date.getMinutes().toString().padStart(2, "0"),
        ].join(":");
    
        return `${yyyymmdd} ${hhmm}`;
    }
}