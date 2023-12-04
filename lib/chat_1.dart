import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chat1Screen extends StatefulWidget {
  const Chat1Screen({super.key});

  @override
  State<Chat1Screen> createState() => _Chat1ScreenState();
}

class _Chat1ScreenState extends State<Chat1Screen> {
  IO.Socket? socket;


  void connect(){
    socket =IO.io("http://192.168.18.72:5000",
    <String,dynamic>{
        "transports": ["websocket"],
      "autoConnect": false,
    },

    );

    socket!.connect();
        socket?.emit("/test","Hello WORLF");
    socket!.onConnect((data) => print('Connected'));


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold();
  }
}