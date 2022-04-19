import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzles/first.dart';
import 'package:math_puzzles/model.dart';
import 'package:math_puzzles/second.dart';

class fourth extends StatefulWidget {

  int cnt;

  fourth(this.cnt);

  @override
  _fourthState createState() => _fourthState();
}

class _fourthState extends State<fourth> {


  List<List<Color>> gradientlist = [[Colors.blueGrey,Colors.white,Colors.blueGrey],];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text("PUZZLE ${widget.cnt} COMPLETED",
                    style: TextStyle(
                        fontFamily: 'family2',
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  height: 70,
                ),
                Container(
                  height: 350,
                  margin: EdgeInsets.symmetric(horizontal: 70),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/trophy.png"),
                          fit: BoxFit.fill)),
                ),
                SizedBox(height: 5,),
                InkWell(
                  onTap: () {

                    int cnt = model.prefs?.getInt('cnt') ?? 0;

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return second(cnt);
                    },));
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Text("CONTINUE",style: TextStyle(
                        fontSize:30,
                        fontFamily: 'family2',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: gradientlist[0]
                        ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return first();
                    },));
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Text("MAIN MENU",style: TextStyle(
                        fontSize:30,
                        fontFamily: 'family2',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: gradientlist[0]
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 200,
                  child: Text("BUY PRO",style: TextStyle(
                      fontSize:30,
                      fontFamily: 'family2',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: gradientlist[0]
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text("SHARE THIS PUZZLE",
                    style: TextStyle(
                        fontFamily: 'family2',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/shareus.png"),
                      )),
                  height: 50,
                )
              ],
            ),
            decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"),
             fit: BoxFit.fill)),
          )),
    );
  }
}
