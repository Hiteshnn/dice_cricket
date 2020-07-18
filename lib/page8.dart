import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'players_name.dart';
import 'dart:io';

class Lastpage extends StatelessWidget {
  static const routeName = '/lastpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Want to play again??'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Do you want to play again??',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
            child: Divider(
              color: Colors.red,
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Playername.routeName,
              );
            },
            child: Text(
              'YES',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
            child: Divider(
              color: Colors.red,
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            child: Text(
              'NO',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
