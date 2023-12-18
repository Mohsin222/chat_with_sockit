import 'package:chat_with_socket/custom_ui/custom_card.dart';
import 'package:chat_with_socket/model/chatmodel.dart';
import 'package:chat_with_socket/screens/selectcontacts.dart';

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({ this.chatmodels, this.sourchat});
  final List<ChatModel>? chatmodels;
  final ChatModel? sourchat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels!.length,
        itemBuilder: (contex, index) => CustomCard(
          chatModel: widget.chatmodels![index],
          sourchat: widget.sourchat!,
        ),
      ),
    );
  }
}