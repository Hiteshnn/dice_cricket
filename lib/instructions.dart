import 'players_name.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Instructions extends StatelessWidget {
  static const routeName = '/instructions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Instructions'),
      ),
      body: Text(
        '1.Before starting the game,decide whether you are player 1 or player 2.\n\n'
        '2.A random player has to choose odd or even '
        'and the other player gets the unselected one.\n\n'
        '3.In the tosspage,the sum of dicee number of two players '
        'decides the tosswinner checking whether the sum is odd or even.\n\n'
        '4.The tosswinner can choose bat or bowl.\n\n'
        '5.From here,the actual game starts.\n\n'
        '6.A player who has to bowl starts the game.\n\n'
        '7.The score of the batsman increases if his dice number '
        'does not match with that of the bowler.\n\n'
        '8.Wicket of the batsman will be lost if it matches.\n\n'
        '9.The players change their roles if the batsman lose all the wickets.\n\n'
        '10.The highest runscorer wins the match.',
        style: TextStyle(
          fontSize: 19.50,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
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
