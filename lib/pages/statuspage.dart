import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../custom_ui/statuspage/headone_status.dart';
import '../custom_ui/statuspage/other_status.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton:
      
    Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Container(
            height: 48,
             child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              onPressed: (){},
             child:   Icon(Icons.edit,color: Colors.blueGrey[900],),
             ),
           ),
           SizedBox(height: 14,),

           FloatingActionButton(onPressed: (){},
           backgroundColor: Colors.greenAccent[200],
           elevation: 5,
           child: Icon(Icons.camera_alt),
           )

       
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadOwnStatus(),
            label('Recent Upadates'),

            const OtherStatus(
                       isSeen: false,
                          statusNum: 4,
              imageString: "assets/1.png",
              name: 'Rohit',
              time: "1:30",
            ),
            const        OtherStatus(
                               isSeen: false,
                          statusNum: 1,
              imageString: "assets/2.jpeg",
              name: 'Amir',
              time: "1:30",
            ),
          const          OtherStatus(
                               isSeen: false,
                          statusNum: 6,
              imageString: "assets/3.jpg",
              name: 'Arsalan',
              time: "1:30",
            ),
     const       SizedBox(height: 10,),
              label('View Upadates'),
                         OtherStatus(
                          isSeen: true,
                          statusNum: 2,
              imageString: "assets/1.png",
              name: 'Alex',
              time: "1:30",
            ),
          ],
        ),
      ),
    );
  }

  Container label(String label) {
    return Container(
            height: 33,
            width: double.infinity,
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 7),
              child: Text(label,
                   style:        TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                  ),
              ),
            ),
          );
  }
}