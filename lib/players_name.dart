import 'startpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'screenarguments.dart';

class Playername extends StatefulWidget {
  static const routeName = '/players_name';
  @override
  _PlayernameState createState() => _PlayernameState();
}

class _PlayernameState extends State<Playername> {
  String str1, str2;
  TextEditingController controller1;
  TextEditingController controller2;
  void initState() {
    super.initState();
    controller1 = TextEditingController(text: 'Player 1');
    controller2 = TextEditingController(text: 'Player 2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Enter the player names'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Enter Player 1 name :-',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30.0,
            child: Divider(
              color: Colors.red,
            ),
          ),
          TextField(
            controller: controller1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(20.0),
            ),
            onChanged: (String string1) {
              str1 = string1;
            },
          ),
          SizedBox(
            height: 80.0,
            child: Divider(
              color: Colors.red,
            ),
          ),
          Text(
            'Enter Player 2 name :-',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30.0,
            child: Divider(
              color: Colors.red,
            ),
          ),
          TextField(
            controller: controller2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(20.0),
              //labelStyle: TextStyle(color: Colors.white),
            ),
            onChanged: (String string2) {
              str2 = string2;
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          if (str1 == null) {
            str1 = 'Player 1';
          }
          if (str2 == null) {
            str2 = 'Player 2';
          }
          Navigator.pushNamed(
            context,
            Startpage.routeName,
            arguments: ScreenArguments6(
              str1,
              str2,
            ),
          );
        },
        child: Icon(
          Icons.navigate_next,
          color: Colors.red,
        ),
      ),
    );
  }
}
