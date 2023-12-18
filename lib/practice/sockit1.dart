import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Scoket1Practice extends StatefulWidget {
  @override
  _Scoket1PracticeState createState() => _Scoket1PracticeState();
}

class _Scoket1PracticeState extends State<Scoket1Practice> {
  IO.Socket? socket;

  @override
  void initState() {
    super.initState();

    // Connect to the Node.js server
    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket!.connect();

    // Example: Query MongoDB when the page is loaded
    socket!.emit('queryMongoDB', {'field': 'value'});

    // Listen for MongoDB data from the server
    socket!.on('mongoDBData', (data) {
      print('Received MongoDB data: $data');
      // Process the data as needed
    });
  }

  @override
  void dispose() {
    socket!.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MongoDB Socket Example'),
      ),
      body: Center(
        child: Text('Check the console for MongoDB data'),
      ),
    );
  }
}