const express = require("express");
var http = require("http");
const app = express();
const cors= require('cors')
const port = process.env.PORT || 5000;
var server = http.createServer(app);
const Message = require('./src/model/messagemodel');

const databaseConnection = require("./connections/conn");

// Connect to the MongoDB database
databaseConnection.connect();
var io = require("socket.io")(server,{
    cors:{
        origin:""
    }
});

//middlewre
app.use(express.json()); // Parse incoming JSON data
app.use(express.urlencoded({ extended: true }));
app.use(cors())
var clients = {};

io.on("connection", (socket) => {
  console.log("connetetd");
  console.log(socket.id, "has joined");
//   socket.on("signin", (id) => {
//     console.log(id);
//     clients[id] = socket;
//     console.log(clients);
//   });
//   socket.on("message", (msg) => {
//     console.log(msg);
//     let targetId = msg.targetId;
//     if (clients[targetId]) clients[targetId].emit("message", msg);
//   });

socket.on('signin',(id)=>{
    console.log(id);
        clients[id] = socket;
    // console.log(clients);
})

  socket.on("message",async (msg) => {
    console.log(msg);
    let targetId = msg.targetId;

    
    const message  = Message(
      {
        message:msg.message,
        sourceId:msg.sourceId,
        targetId:msg.targetId
      }
    )

    console.log(message)

     message.save()

      //save chat to the database
  // connect.then(db  =>  {
  //   console.log("connected correctly to the server");
  
  //   let  chatMessage  =  new Chat({ message: msg, sender: "Anonymous"});
  //   chatMessage.save();
  //   });

    if (clients[targetId]) {
      clients[targetId].emit("message", msg);
      // console.log(clients[targetId]);
    }
  });
});




// socket.on("connection", socket  =>  {
//   console.log("user connected");
//   socket.on("disconnect", function() {
//   console.log("user disconnected");
//   });  
//   socket.on("chat message", function(msg) {
//       console.log("message: "  +  msg);
//       //broadcast message to everyone in port:5000 except yourself.
//   socket.broadcast.emit("received", { message: msg  });

//   //save chat to the database
//   connect.then(db  =>  {
//   console.log("connected correctly to the server");

//   let  chatMessage  =  new Chat({ message: msg, sender: "Anonymous"});
//   chatMessage.save();
//   });
//   });
// });



server.listen(port, "0.0.0.0", () => {
  console.log("server started");
});