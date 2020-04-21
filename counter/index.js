var express = require("express"),
    bodyParser = require("body-parser"),
    app = express(),
    port = 3070;

// array to hold users
const users = [{firstName:"fnam1",lastName:"lnam1",userName:"username1"}];

app.use(bodyParser.json());

// Default user
app.get("/", function(req, res) {
    res.send("App works!!");
})

app.get("/ping", function(req, res) {
    res.json({message:"pong"});
})
// request to get all the users
app.get("/users", function(req, res) {
    res.json(users);
})

// request to get all the users by userName
app.get("/users/:userName", function(req, res) {
    let user = users.filter(function(user){
        if(req.params.userName === user.userName){
            return user;
        }
    })
    res.json(user);
})

// request to post the user
// req.body has object of type {firstName:"fnam1",lastName:"lnam1",userName:"username1"}
app.post("/user", function(req, res) {
    users.push(req.body);
    res.json(users);
})

app.listen(port, function(err) {
    console.log("running server on from port:::::::" + port);
});
