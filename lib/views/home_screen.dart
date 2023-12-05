import 'package:chat_with_socket/model/chatmodel.dart';
import 'package:chat_with_socket/pages/chatpage.dart';


import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  Homescreen({ this.chatmodels, this.sourchat});
  final List<ChatModel>? chatmodels;
  final ChatModel? sourchat;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp Clone"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return const [
                PopupMenuItem(
                  value: "New group",
                  child: Text("New group"),
                ),
                PopupMenuItem(
                  value: "New broadcast",
                  child: Text("New broadcast"),
                ),
                 PopupMenuItem(
       
                  value: "Whatsapp Web",
                             child: Text("Whatsapp Web"),
                ),
                PopupMenuItem(
                  
                  value: "Starred messages",
                  child: Text("Starred messages"),
                ),
                PopupMenuItem(
               
                  value: "Settings",
                     child: Text("Settings"),
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text('Camera Page'),

          // CameraPage(),
          ChatPage(
            chatmodels: widget.chatmodels,
            sourchat: widget.sourchat,
          ),
          Text("STATUS"),
          Text("Calls"),
        ],
      ),
    );
  }


  
}