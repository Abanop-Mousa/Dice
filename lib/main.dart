import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bombaa',
      theme: ThemeData(
        primaryColor: Color(0xFFceba71),
      ),
      home: Scaffold(
        // backgroundColor: Color(0xFFceba71),
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Color(0xFFceba71),
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceeNumber = 1;
  var rightDiceeNumber = 1;

  void changeDiceFace() {
    setState(
      () {
        leftDiceeNumber = Random().nextInt(6) + 1;
        rightDiceeNumber = Random().nextInt(6) + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFF3F9A7),
            // Color(0xFFCAC531),
            Color(0xFFceba71),
          ],
        ),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset("assets/images/dice$leftDiceeNumber.png"),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset("assets/images/dice$rightDiceeNumber.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
