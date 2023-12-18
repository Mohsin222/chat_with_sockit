import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HeadOwnStatus extends StatelessWidget {
  const HeadOwnStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 27,
            backgroundImage: AssetImage("assets/1.jpg"),
          ),

          Positioned(child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.greenAccent[700],
            child: Icon(Icons.add,size: 20,color: Colors.white,)))
        ],
      ),
      title: Text('My Status',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      ),
      subtitle: Text('Tap to add status update',
      style: TextStyle(
        fontSize: 13,
        color: Colors.grey[900],
      ),
      ),
    );
  }
}