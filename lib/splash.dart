import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzles/first.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    gonext();
  }

  gonext()
  async {
    await Future.delayed(Duration(milliseconds: 1000));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return first();
    },));

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
