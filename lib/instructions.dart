import 'players_name.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Instructions extends StatelessWidget {
  static const routeName = '/instructions';
  int i = 0;
  final List<String> entries = <String>[
    '1.This is a two player game and the players can enter their names before the match starts.\n',
    '2.Before starting the game,decide whether you are player 1 or player 2.\n',
    '3.A random player has to choose odd or even and the other player gets the unselected one.\n',
    '4.In the tosspage,the sum of dicee number of two players decides the tosswinner checking whether the sum is odd or even.\n',
    '5.The tosswinner can choose bat or bowl.\n',
    '6.A player who has to bowl starts the game.\n',
    '7.The score of the batsman increases if his dice number does not match with that of the bowler.\n',
    '8.Wicket of the batsman will be lost if it matches.\n',
    '9.The players change their roles if the batsman lose all the wickets.\n',
    '10.The highest runscorer wins the match.\n\n',
  ];

  Text return_text({String content}) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Instructions'),
      ),
      body: ListView(
        children: <Widget>[
          return_text(content: entries[0]),
          return_text(content: entries[1]),
          return_text(content: entries[2]),
          return_text(content: entries[3]),
          return_text(content: entries[4]),
          return_text(content: entries[5]),
          return_text(content: entries[6]),
          return_text(content: entries[7]),
          return_text(content: entries[8]),
          return_text(content: entries[9]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(
            context,
            Playername.routeName,
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
