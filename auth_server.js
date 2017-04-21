var http = require('http');
var url = require("url");
var qs = require('querystring');
var port = 8855;

function process(req, res) {
    var reqUrl = url.parse(req.url, true);
    switch (reqUrl.pathname) {
        case '/auth':
            console.log(req.body);
            if (req.body.name == 'app' && req.body.key == 'dpy1123') {
                res.writeHeader(200);
            } else {
                res.writeHeader(501);
            }
            res.end();
            break;
    }
}
function parsePost(req, res, next) {
    var arr = [];
    req.addListener("data", function (data) {
        arr.push(data);
    });
    req.addListener("end", function () {
        var data = Buffer.concat(arr).toString(), ret;
        try {
            var ret = qs.parse(data);
        } catch (err) { }
        req.body = ret;
        next();
    })
}
var server = http.createServer(function (req, res) {
    if (req.method.toUpperCase() == 'POST') {
        parsePost(req, res, function () {
            process(req, res)
        })
    } else if (req.method.toUpperCase() == 'GET') {
        process(req, res)
    }
});
server.listen(port);
console.log("auth server running at " + port + " ...");