
$(function(){
   	//make connection
	var socket = io.connect('http://onsunroad.com:3000')

	//buttons and inputs
	var message = $("#message")
	var username = $("#username")
	var send_message = $("#send_message")
	var send_username = $("#send_username")
	var chatroom = $("#chatroom")
	var feedback = $("#feedback")
	var changeRoom = $("#changeRoom")
	var inputRoom = $("#room")

	//Emit message
	send_message.click(function(){
		socket.emit('message', {message : message.val()})
	})

	//Listen on new_message
	socket.on("new_message", (data) => {
		feedback.html('');
		message.val('');
		chatroom.append("<p class='message'>" + data.username + ": " + data.message + "</p>")
	})

	//Emit a username
	send_username.click(function(){
		socket.emit('username', {username: username.val() })
	})

	//Emit typing
	message.bind("keypress", () => {
		socket.emit('typing')
	})

	//Listen on typing
	socket.on('typing', (data) => {
		feedback.html("<p><i>" + data.username + " is typing a message..." + "</i></p>")
	})

	changeRoom.click(function(){
		var room = inputRoom.val()
		socket.emit('switchRoom', room)
	})

	$("#createBtn").click(function(){
		var newRoom = $("#createRoom").val();
		socket.emit('createRoom', newRoom);
	})

	// listener, whenever the server emits 'updaterooms', this updates the room the client is in
	socket.on('updaterooms', function(rooms, current_room) {
		$("#changedRoom").val(current_room);
		$.each(rooms, function(key, value) {
			console.log(value)
			if(value == current_room){
				console.log(current_room)
			}
			else {
				
			}
		});
	});

	$("#createRequest").click(function(){
		var sender_id = $("#sender_id").val();
		var receiver_id = $("#receiver_id").val();
		socket.emit('chattingRequest', {sender_id: sender_id, receiver_id: receiver_id})
		
	});

	$("#acceptRequest").click(function(){
		var sender_id = $("#sender_id").val();
		var request_id = $("#request_id").val();
		socket.emit('chattingroom', {sender_id: sender_id, receiver_id: request_id});
	});

});


