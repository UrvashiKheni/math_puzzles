import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzles/model.dart';
import 'package:math_puzzles/second.dart';
import 'package:math_puzzles/third.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {

  int cnt = 0;

  bool ready = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initpref();

  }

  initpref()
  async {

    model.statuslist.clear();

    model.prefs = await SharedPreferences.getInstance();

    cnt = model.prefs?.getInt("cnt") ?? 0;

    for(int i =0 ;i<20 ; i++)
      {
        String ststus = model.prefs!.getString("status$i") ?? "pending";

        model.statuslist.add(ststus);
      }

    ready = true;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(

          child: ready ? Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text("Math Puzzles",
                    style: TextStyle(
                        fontFamily: 'family2',
                        fontStyle: FontStyle.italic,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  height: 100,
                ),
                Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) {
                                    return second(cnt);
                                  },
                                ));
                              },
                              child: Text("CONTINUE",style: TextStyle(fontFamily: 'family1',fontSize: 30,color: Colors.white),)),
                          SizedBox(height: 25,),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return third();
                                  },
                                ));
                              },
                              child: Text("PUZZLE",style: TextStyle(fontFamily: 'family1',fontSize: 30,color: Colors.white),))
                        ],
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/blackboard_main_menu.png"),fit: BoxFit.fill)),
                    )),
                Container(
                  height: 100,
                )
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.fill)),
          ) : Center(
            child: CircularProgressIndicator(),
          )
      )
    );
  }
}