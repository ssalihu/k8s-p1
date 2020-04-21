const keys = require('./keys');
const redis = require('redis');
var express = require("express"),
    bodyParser = require("body-parser"),
    app = express(),
    port = 3070;


const redisClient = redis.createClient({
    host: keys.redisHost,
    port: keys.redisPort,
    retry_strategy: () => 1000
});    
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
const SEQUENCE_KEY = "SEQUENCE";
// redis related
redisClient.on('connect', function() {
    console.log('Redis client connected');
});

redisClient.on('error', function (err) {
    console.log('Something went wrong ' + err);
});

app.get("/nextval", function (req, res) {
    redisClient.get(SEQUENCE_KEY, function (error, result) {
        if (error) {
            console.log(SEQUENCE_KEY + ' not found. Creating new one.');
            redisClient.set(SEQUENCE_KEY, 1);
            res.json({ sequence: 1 });
            //throw error;
        } else {
            redisClient.set(SEQUENCE_KEY, result, function () {
                redisClient.incr(SEQUENCE_KEY, function (err, reply) {
                    console.log('Sequence generated is ' + reply); // 11
                    res.json({ sequence: reply });
                });
            });
        }
        //console.log('GET result ->' + result);
    });
})
const sub = redisClient.duplicate();
sub.on('message', (channel, message) => {
    console.log('Receieved message from redis: ' + message);
    //redisClient.hset('values', message, fib(parseInt(message)));
});
sub.subscribe('insert');

app.listen(port, function(err) {
    console.log("running server on from port:::::::" + port);
});
