const express = require('express')
const app = express()
const cors = require('cors');
var http = require('http');
var axios = require('axios');
app.use(cors());
var basicUrl = "http://onsunroad.com/api/";

//set the template engine ejs
app.set('view engine', 'ejs')

//middlewares
app.use(express.static('public'))


//routes
app.get('/', (req, res) => {
	res.render('index')
})

//Listen on port 3000
server = app.listen(3000)

// usernames which are currently connected to the chat
var usernames = {};
var ids = []

//socket.io instantiation
const io = require("socket.io")(server)
var rooms = [];

//listen on every connection
io.on('connection', (socket) => {
	//default username
    socket.username = "Anonymous";
    console.log(socket.id);
    socket.emit('connect',  "New Socket connected");

    ids = [];
    for ( let client in io.sockets.connected )
    {
        ids.push(client)
    }

    //listen on change_username
    socket.on('username', (data) => {
        socket.username = data.username;
    });

    //listen on change_username
    socket.on('gaeddong', (data) => {
        console.log(data);
    });

    socket.on('chattingroom', (data) => {
        var sender_id = data.sender_id;
        var thread_id = data.thread_id;
        var room_id = 'room_' + thread_id;
        console.log(room_id);
        socket.leave(socket.room);
        socket.join(room_id);
        socket.room = room_id;
        socket.user_id = sender_id;
    });

    socket.on('message', (data) => {
        var message = data.message;
        var username = socket.username;
        var sender_id = socket.user_id;

        var thread_id = socket.room.split('_')[1];

        var jsondata = {
          'sender_id' : sender_id,
          'message': message ,
          'thread_id' : thread_id
        };

        console.log(jsondata);

        axios.post(basicUrl + "message/sendMessage", jsondata, {
            headers: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': "*",
                'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
                'Access-Control-Allow-Headers' : 'Content-Type, Authorization',
                'Access-Control-Allow-Credentials': true
            }
        }).then((response) =>{
            var blocked = response.data.blocked;
            var usersInfo = response.data.usersInfo;
            var senderInfo = response.data.senderInfo;
            var created_at = response.data.created_at;
            if(blocked == 1){
                io.sockets.emit('new_message',  {message : message, created_at : created_at, userInfo : senderInfo});
            }else{
                io.sockets.in(socket.room).emit('new_message',  {message : message, created_at : created_at, userInfo : senderInfo});
            }
        }).catch(error => {
            console.log(error)
        });
    })

    //listen on typing
    socket.on('typing', (data) => {
        // io.sockets.in(socket.id).emit('new_message',  {message : "type", username : socket.username});
    	// socket.broadcast.to(socket.id).emit('typing', {username : socket.username})
    });

    // when the user disconnects.. perform this
    socket.on('disconnect', function(){
        // remove the username from global usernames list
        delete usernames[socket.username];
        // update list of users in chat, client-side
        io.sockets.emit('updateusers', usernames);
        // echo globally that this client has left
        socket.broadcast.emit('updatechat', 'SERVER', socket.username + ' has disconnected');
        socket.leave(socket.room);
    });


})
