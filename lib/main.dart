import 'package:diceecricket/actualgame.dart';
//import 'package:diceecricket/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';
import 'dart:math';
import 'screenarguments.dart';
import 'startpage.dart';
import 'tosspage.dart';
import 'tosswinner.dart';
import 'wicketpage.dart';
import 'displayresult.dart';
import 'playagain.dart';
import 'instructions.dart';
import 'players_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          Instructions.routeName: (context) => Instructions(),
          Playername.routeName: (context) => Playername(),
          Startpage.routeName: (context) => Startpage(),
          ExtractArgumentsScreen1.routeName: (context) =>
              ExtractArgumentsScreen1(),
          ExtractArgumentsScreen2.routeName: (context) =>
              ExtractArgumentsScreen2(),
          Wicketpage.routeName: (context) => Wicketpage(),
          Game.routeName: (context) => Game(),
          Result.routeName: (context) => Result(),
          Lastpage.routeName: (context) => Lastpage(),
        });
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('Dice Cricket')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Dice Cricket',
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Image(
              image: AssetImage('images/mainimage.jpeg'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(
            context,
            Instructions.routeName,
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
