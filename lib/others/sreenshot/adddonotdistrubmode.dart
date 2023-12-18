import 'package:chat_with_socket/others/sreenshot/screnshot1.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dnd/flutter_dnd.dart';

class AddDoNotDistrubMode extends StatefulWidget {
  const AddDoNotDistrubMode({super.key});

  @override
  State<AddDoNotDistrubMode> createState() => _AddDoNotDistrubModeState();
}

class _AddDoNotDistrubModeState extends State<AddDoNotDistrubMode> {
bool? _isNotificationPolicyAccessGranted = false;
String _filterName = '';



   void updateUI() async {
    int? filter = await FlutterDnd.getCurrentInterruptionFilter();
    if (filter != null) {
      String filterName = FlutterDnd.getFilterName(filter);
      bool? isNotificationPolicyAccessGranted =
          await FlutterDnd.isNotificationPolicyAccessGranted;

      setState(() {
        _isNotificationPolicyAccessGranted = isNotificationPolicyAccessGranted;
        _filterName = filterName;
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }
 void setInterruptionFilter(int filter) async {
    final bool? isNotificationPolicyAccessGranted =
        await FlutterDnd.isNotificationPolicyAccessGranted;
    if (isNotificationPolicyAccessGranted != null &&
        isNotificationPolicyAccessGranted) {
      await FlutterDnd.setInterruptionFilter(filter);
      updateUI();
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Screen shot 2'),
        actions: [
          IconButton(onPressed: ()async{
   
          }, icon: Icon(CupertinoIcons.padlock))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AllowScreenShortOrNot()));
      }),

            body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Text('Current Filter: $_filterName'),
            SizedBox(
              height: 10,
            ),
            Text(
                'isNotificationPolicyAccessGranted: ${_isNotificationPolicyAccessGranted! ? 'YES' : 'NO'}'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                FlutterDnd.gotoPolicySettings();
              },
              child: Text('GOTO POLICY SETTINGS'),
            ),
            ElevatedButton(
              onPressed: () async {
                setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_NONE);
              },
              child: Text('TURN ON DND'),
            ),
            ElevatedButton(
              onPressed: () {
                setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_ALL);
              },
              child: Text('TURN OFF DND'),
            ),
            ElevatedButton(
              onPressed: () {
                setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_ALARMS);
              },
              child: Text('TURN ON DND - ALLOW ALARM'),
            ),
            ElevatedButton(
              onPressed: () {
                setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_PRIORITY);
              },
              child: Text('TURN ON DND - ALLOW PRIORITY'),
            )
          ]),
        ),
      
    );
  }
}