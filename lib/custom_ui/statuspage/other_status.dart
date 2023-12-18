// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus({super.key, required this.name, required this.time, required this.imageString, required this.isSeen, required this.statusNum});


  final String name;
  final String time;
  final String imageString;
  final bool isSeen;
  final int statusNum;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading:   CustomPaint(
        painter: StatusPainter(isSeen: isSeen,statusNum: statusNum),
        child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 26,
              backgroundImage: AssetImage(imageString),
            ),
      ),
               title: Text(name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        // color: Colors.black,
        fontSize: 15
      ),
      ),
      subtitle:      Text('Today at $time',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
        fontSize: 14
      ),
      ),
    );
  }
}



//this code create circular border on image circle
degreeToAngel(double degree){
  return degree * pi/180;
}
class StatusPainter extends CustomPainter {
  bool isSeen;
  int statusNum;
  StatusPainter({
    required this.isSeen,
    required this.statusNum,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =Paint()
    ..isAntiAlias=true
    ..strokeWidth=5.0
    ..color= isSeen ? Colors.grey : Color(0xff23bfa6)
    ..style=PaintingStyle.stroke;

    drawArc(canvas,size,paint);
  }
  void drawArc(Canvas canvas,Size size, Paint paint){
 if(statusNum ==1){
     canvas.drawArc(Rect.fromLTWH(0.0, 0.0,size.width, size.height), degreeToAngel(0), degreeToAngel(360), false, paint);
 }else{
  double degree = -90;
  double arc =360/statusNum;
  for (var i = 0; i < statusNum; i++) {
       canvas.drawArc(Rect.fromLTWH(0.0, 0.0,size.width, size.height), 
       degreeToAngel(degree +4), degreeToAngel(arc -8), false, paint);
  degree +=arc;
  
  }  
 }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw  true;
  }

}
