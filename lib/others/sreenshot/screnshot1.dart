
import 'package:chat_with_socket/others/sreenshot/adddonotdistrubmode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class AllowScreenShortOrNot extends StatefulWidget {
  const AllowScreenShortOrNot({super.key});

  @override
  State<AllowScreenShortOrNot> createState() => _AllowScreenShortOrNotState();
}

class _AllowScreenShortOrNotState extends State<AllowScreenShortOrNot> {
  bool _secureMode = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Screen shot 1'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddDoNotDistrubMode()));

      }),
       body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Secure Mode: ${_secureMode.toString()}\n'),
              ElevatedButton(
                  onPressed: () async {
                    var secureModeToggle = !_secureMode;

                    if (secureModeToggle == true) {
                      await FlutterWindowManager.addFlags(
                          FlutterWindowManager.FLAG_SECURE);
                    } else {
                      await FlutterWindowManager.clearFlags(
                          FlutterWindowManager.FLAG_SECURE);
                    }

                    setState(() {
                      _secureMode = !_secureMode;
                    });
                  },
                  child: const Text("Toggle Secure Mode")),
            ],
          ),
        ),
      
    );
  }
}