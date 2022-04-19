import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_puzzles/first.dart';
import 'package:math_puzzles/fourth.dart';
import 'package:math_puzzles/model.dart';

class second extends StatefulWidget {

  int cnt;

  second(this.cnt);


  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {

  TextEditingController tans = TextEditingController();

  String answer = "";

  List<String> answerlist = [
    "10",
    "20",
    "30",
    "40",
    "50",
    "60",
    "70",
    "80",
    "90",
    "100",
    "110",
    "120",
    "130",
    "140",
    "150",
    "160",
    "170",
    "180",
    "190",
    "200",
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          model.statuslist[widget.cnt] = "skip";

                          model.prefs!.setString("status${widget.cnt}", "skip");

                          widget.cnt++;

                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return second(widget.cnt);
                            },
                          ));
                        },
                        child: Image.asset(
                          "images/skip.png",
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 70,
                        margin: EdgeInsets.all(30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/level_board.png",),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Puzzle${widget.cnt+1} ",
                              style: TextStyle(
                                fontFamily: 'family2',
                                fontStyle: FontStyle.italic,
                                fontSize: 30,color: Colors.black,),
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "images/hint.png",
                        height: 50,
                        width: 50,
                      ),)
                  ],
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "${model().imagelist[widget.cnt]}",
                        fit: BoxFit.fitWidth,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(7),
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.white,
                          child: Text(answer,style: TextStyle(fontSize: 22),),
                        ),
                      ),
                      IconButton(
                          onPressed: () {

                            // 012345
                            // 01234  5
                            setState(() {
                              if(answer.length>0)
                              {
                                answer = answer.substring(0, answer.length-1); //01234
                              }
                            });
                          },
                          icon: Icon(
                            Icons.backspace_sharp,
                            color: Colors.white,
                          )),
                      Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: InkWell(onTap: () {
                          setState(() {
                            if(answerlist[widget.cnt] == answer)
                            {
                              String status = model.statuslist[widget.cnt];

                              if(status== 'pending')
                              {
                                if(widget.cnt<model().imagelist.length-1)
                                {
                                  model.statuslist[widget.cnt]="clear";
                                  model.prefs!.setString("status${widget.cnt}", "clear");

                                  widget.cnt++;
                                }
                                else{
                                  widget.cnt= 0;
                                }
                                model.prefs!.setInt("cnt", widget.cnt);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return fourth(widget.cnt);
                                },));
                              }
                              else if(status== 'skip')
                              {
                                if(widget.cnt<model().imagelist.length-1)
                                {
                                  model.statuslist[widget.cnt]="clear";
                                  model.prefs!.setString("status${widget.cnt}", "clear");

                                  widget.cnt++;
                                }
                                else{
                                  widget.cnt= 0;
                                }
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return fourth(widget.cnt);
                                },));
                              }
                              else if(status=="clear")
                              {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return fourth(widget.cnt);
                                },));
                              }
                            }
                            else{
                              Fluttertoast.showToast(
                                  msg: "wrong..!!!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              answer = '';
                            }
                          });
                        },
                          child: Text("SUBMIT",
                            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "family2"),),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.black,
                  child: Row(
                    children: allButton(),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/gameplaybackground.jpg"),
                    fit: BoxFit.fill)),
          )),
    ),
        onWillPop: goback);
  }

  Future<bool> goback()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return first();
      },
    ));

    return Future.value();
  }

  List<Widget> allButton()
  {
    List<Widget> list = [];

    for(int i=0;i<10;i++)
    {
      list.add(Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                answer = "$answer$i";
              });
            },
            child: Container(
              height: 40,
              child: Text("${i}",style: TextStyle(fontSize:20),
                textAlign: TextAlign.center,),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
          )));
    }

    return list;
  }
}