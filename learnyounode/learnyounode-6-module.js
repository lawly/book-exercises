module.exports = (directory, extension, callback) => {
    let fs = require("fs"),
        path = require("path");
        
    fs.readdir(directory, "utf-8", (err, files) => {
        if (err) {
            callback(err);
            return;
        }
        let filtered = files.filter(file => path.extname(file) === `.${extension}`);
        callback(null, filtered);
    });
};