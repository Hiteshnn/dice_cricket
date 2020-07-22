import 'screenarguments.dart';
import 'tosswinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';

class ExtractArgumentsScreen1 extends StatefulWidget {
  static const routeName = '/extractArguments1';
  @override
  _ExtractArgumentsScreen1State createState() =>
      _ExtractArgumentsScreen1State();
}

class _ExtractArgumentsScreen1State extends State<ExtractArgumentsScreen1>
    with SingleTickerProviderStateMixin {
  int leftDiceNumber = 1, rightDiceNumber = 1, b;
  String c, d, e;
  bool toss1 = false;
  bool toss2 = true;
  String result;

  AnimationController controller;
  Animation flip_anim1, flip_anim2;

  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    flip_anim1 = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));
    flip_anim2 = Tween(begin: 0.0, end: 0.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.0, curve: Curves.linear)));
  }

  void go_to_page3(int tosswinner) {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.pushNamed(
        context,
        ExtractArgumentsScreen2.routeName,
        arguments: ScreenArguments2(
          tosswinner,
          d,
          e,
        ),
      );
    });
  }

  int player2number() {
    Timer(Duration(milliseconds: 300), () {
      return rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  int player1number() {
    Timer(Duration(milliseconds: 300), () {
      return leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments1 args = ModalRoute.of(context).settings.arguments;
    b = args.player;
    c = args.choice;
    d = args.player1name;
    e = args.player2name;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Tosspage'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              /*RaisedButton(
                onPressed: () {
                  _showDialog(
                      content:
                          'Both the players click the dice once, player 1 followed by player 2');
                },
                child: Text('Alert!!!'),
              ),*/
              Text(
                args.player1name,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                child: Divider(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..rotateX(2 * pi * flip_anim1.value),
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: toss1
                              ? null
                              : () => setState(() {
                                    player1number();

                                    controller.forward();
                                    final player = AudioCache();
                                    player.play('dicenew.mp3');
                                    leftDiceNumber = Random().nextInt(6) + 1;
                                    toss1 = true;
                                    toss2 = false;
                                  }),
                          child: Image(
                            image: AssetImage('images/dice$leftDiceNumber.png'),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 40.0,
                child: Divider(
                  color: Colors.red,
                ),
              ),
              Text(
                args.player2name,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                child: Divider(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..rotateX(2 * pi * flip_anim2.value),
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: toss2
                              ? null
                              : () => setState(() {
                                    player2number();

                                    flip_anim1 = Tween(begin: 0.0, end: 0.0)
                                        .animate(CurvedAnimation(
                                            parent: controller,
                                            curve: Interval(0.0, 0.0,
                                                curve: Curves.linear)));
                                    flip_anim2 = Tween(begin: 0.0, end: 2.0)
                                        .animate(CurvedAnimation(
                                            parent: controller,
                                            curve: Interval(0.0, 1.0,
                                                curve: Curves.linear)));
                                    controller.reverse();
                                    final player = AudioCache();
                                    player.play('dicenew.mp3');
                                    rightDiceNumber = Random().nextInt(6) + 1;
                                    toss1 = true;
                                    toss2 = true;
                                    if ((leftDiceNumber + rightDiceNumber) %
                                            2 ==
                                        1)
                                      result = 'Odd';
                                    else
                                      result = 'Even';
                                    if (result == c)
                                      go_to_page3(b);
                                    else if (b == 1)
                                      go_to_page3(2);
                                    else
                                      go_to_page3(1);
                                  }),
                          child: Image(
                            image:
                                AssetImage('images/dice$rightDiceNumber.png'),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20.0,
                child: Divider(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
