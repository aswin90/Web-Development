var express = require('express');
var app = express();

var mongojs = require('mongojs');
//var db = mongojs("mydb", ["nodejs"]);

var connectionString = process.env.OPENSHIFT_MONGODB_DB_URL + "nodejs";
var db = mongojs(connectionString, ["users"]);
app.use(express.static(__dirname + '/public'));
app.use(express.bodyParser());

var ipaddress = process.env.OPENSHIFT_NODEJS_IP || "127.0.0.1";
var port = process.env.OPENSHIFT_NODEJS_PORT || 8080;

app.get("/serviceClients", function (req, res) {

    db.users.find(function (err, docs) {

        res.json(docs);

    });

});

app.post("/serviceClients", function (req, res) {

    var svc = req.body;

    db.users.insert(svc, function (err, doc) {
        res.json(doc);
    });

});

app.delete("/serviceClients/:id", function (req, res) {
    var id = req.params.id;
    db.users.remove({_id : mongojs.ObjectId(id)}, 
        function (err, doc) {
            res.json(doc);
        })
});

app.get("/env", function (req, res) {
    res.json(process.env);
});


app.listen(port, ipaddress);