var bodyParser = require("body-parser");
var mysql = require("mysql");
var express = require("express");
var app = express();
var PORT = 3000;

app.set("view engine", "ejs");
app.use(express.static(__dirname + "/public"));
app.use(bodyParser.urlencoded({extended: true}));

var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	database : 'join_us'
});
 
app.get("/", function(req, res){
  	var query = "SELECT COUNT(*) AS num FROM users";
	connection.query(query, function(err, result){
		if(err) throw err;
		var count = result[0].num;
		res.render("home",{count: count});
	});
});

app.post('/register', function(req,res){
	var person = {email: req.body.email};
	connection.query('INSERT INTO users SET ?', person, function(err, result) {
		if(err) console.log(err);
		console.log(result);
		res.redirect("/");
	});
});

app.post("/err", function(req,res){
	res.send(req.body.err);
})

app.listen(PORT, function () {
	console.log(`App listening on port ${PORT}!`);
});