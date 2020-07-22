import 'screenarguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'displayresult.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';

class Game extends StatefulWidget {
  static const routeName = '/extractArguments4';
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation flip_anim1, flip_anim2;

  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    flip_anim1 = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));
    flip_anim2 = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));
  }

  int leftDiceNumber = 1,
      rightDiceNumber = 2,
      p,
      score1 = 0,
      score2 = 0,
      wicket1 = 0,
      wicket2 = 0;
  int first = 0, wickets = 0, second = 0, count = 0, count2 = 0, sec;
  bool player1, player2;
  String a;
  String p1, p2;

  void _showDialog({String content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Alert!!!"),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void player1work() {
    player1 = false;
    player2 = true;
  }

  void player2work() {
    player1 = true;
    player2 = false;
  }

  void firstbat1() {
    if (leftDiceNumber != rightDiceNumber) {
      score1 = score1 + leftDiceNumber;
      player2work();
    } else if (leftDiceNumber == rightDiceNumber) {
      if (wicket1 == wickets - 1) {
        wicket1 += 1;
        alertmessage(player: 1);
        player1work();
      } else {
        wicket1 += 1;
        player2work();
      }
    }
  }

  void firstbat2() {
    if (leftDiceNumber != rightDiceNumber) {
      score2 = score2 + rightDiceNumber;
      player1work();
    } else if (leftDiceNumber == rightDiceNumber) {
      if (wicket2 == wickets - 1) {
        wicket2 += 1;
        alertmessage(player: 2);
        player2work();
      } else {
        wicket2 += 1;
        player1work();
      }
    }
  }

  void secondbat2() {
    if (leftDiceNumber != rightDiceNumber) {
      score2 = score2 + rightDiceNumber;
      if (score2 > score1) {
        go_to_finalpage();
      }
    } else if (leftDiceNumber == rightDiceNumber) {
      wicket2 += 1;
      if (wicket2 == wickets) {
        go_to_finalpage();
      }
    }
    player1work();
  }

  void secondbat1() {
    if (leftDiceNumber != rightDiceNumber) {
      score1 = score1 + leftDiceNumber;
      if (score1 > score2) {
        go_to_finalpage();
      }
    } else if (leftDiceNumber == rightDiceNumber) {
      wicket1 += 1;
      if (wicket1 == wickets) {
        go_to_finalpage();
      }
    }
    player2work();
  }

  void alertmessage({int player}) {
    p = player;
    if (p == 1)
      a = p1;
    else
      a = p2;

    _showDialog(content: '$a lost all the wickets, now $a start rolling dice');
  }

  void go_to_finalpage() {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.pushNamed(
        context,
        Result.routeName,
        arguments: ScreenArguments5(
          score1,
          score2,
          p1,
          p2,
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

  void player1rotate() {
    flip_anim1 = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));
    flip_anim2 = Tween(begin: 0.0, end: 0.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.0, curve: Curves.linear)));
    if (first == 2 && wicket2 < wickets)
      controller.forward();
    else if (first == 2 && wicket2 == wickets) controller.reverse();

    if (first == 1 && wicket1 < wickets)
      controller.reverse();
    else if (first == 1 && wicket1 == wickets) controller.forward();
  }

  void player2rotate() {
    flip_anim2 = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));
    flip_anim1 = Tween(begin: 0.0, end: 0.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.0, curve: Curves.linear)));
    if (first == 2 && wicket2 < wickets)
      controller.reverse();
    else if (first == 2 && wicket2 == wickets) controller.forward();

    if (first == 1 && wicket1 < wickets)
      controller.forward();
    else if (first == 1 && wicket1 == wickets) controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments4 args = ModalRoute.of(context).settings.arguments;
    first = args.firstbatsman;
    wickets = args.wickets;
    p1 = args.player1name;
    p2 = args.player2name;
    if (count2 == 0) {
      if (first == 1) {
        player2 = false;
        player1 = true;
        count2++;
      } else {
        player1 = false;
        player2 = true;
        count2++;
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Game starts here'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              /*RaisedButton(
                onPressed: () {
                  _showDialog(
                      content:
                          'Player $first is batting , so Player $sec start the game');
                },
                child: Text('Alert!!!'),
              ),*/
              Text(
                '$p1',
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
                          onPressed: player1
                              ? null
                              : () => setState(() {
                                    player1rotate();
                                    player1number();

                                    final player = AudioCache();
                                    player.play('dicenew.mp3');

                                    player2work();

                                    if (first == 1) {
                                      if (wicket1 < wickets)
                                        firstbat1();
                                      else if (wicket1 == wickets) {
                                        second = 2;
                                      }
                                    }
                                    if (second == 1) {
                                      if (wicket1 < wickets &&
                                          score1 <= score2) {
                                        secondbat1();
                                      }
                                    }
                                    leftDiceNumber = Random().nextInt(6) + 1;
                                  }),
                          child: Image(
                            image: AssetImage('images/dice$leftDiceNumber.png'),
                          ),
                        ),
                      );
                    }),
              ),
              Text(
                'Score :$score1/$wicket1',
                style: TextStyle(
                  fontSize: 20.0,
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
              Text(
                '$p2',
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
                          onPressed: player2
                              ? null
                              : () => setState(() {
                                    player2rotate();
                                    player2number();

                                    final player = AudioCache();
                                    player.play('dicenew.mp3');

                                    player1work();

                                    if (first == 2) {
                                      if (wicket2 < wickets)
                                        firstbat2();
                                      else if (wicket2 == wickets) {
                                        second = 1;
                                      }
                                    }
                                    if (second == 2) {
                                      if (wicket2 < wickets &&
                                          score2 <= score1) {
                                        secondbat2();
                                      }
                                    }
                                    rightDiceNumber = Random().nextInt(6) + 1;
                                  }),
                          child: Image(
                            image:
                                AssetImage('images/dice$rightDiceNumber.png'),
                          ),
                        ),
                      );
                    }),
              ),
              Text(
                'Score :$score2/$wicket2',
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
            ],
          ),
        ),
      ),
    );
  }
}
