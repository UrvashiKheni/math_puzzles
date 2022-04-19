import 'package:flutter/material.dart';
import 'package:math_puzzles/model.dart';
import 'package:math_puzzles/second.dart';

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  _thirdState createState() => _thirdState();
}

class _thirdState extends State<third> {

  List<String> imagelist = [
    "images/p1.png",
    "images/p2.png",
    "images/p3.png",
    "images/p4.png",
    "images/p5.png",
    "images/p6.png",
    "images/p7.png",
    "images/p8.png",
    "images/p9.png",
    "images/p10.png",
    "images/p11.png",
    "images/p12.png",
    "images/p13.png",
    "images/p14.png",
    "images/p15.png",
    "images/p16.png",
    "images/p17.png",
    "images/p18.png",
    "images/p19.png",
    "images/p20.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
          child:Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image:AssetImage("images/background.jpg",),
              ),
            ),
            child: Column(
              children: [
                Expanded(flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text("Select Puzzle",style: TextStyle(fontFamily: 'family2',fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.bold,color: Colors.purple),
                    ),
                  ),
                ),
                Expanded(flex: 7,
                    child:  GridView.builder(
                      itemCount: imagelist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4), itemBuilder: (context, index) {

                        String status = model.statuslist[index];

                        int cnt = model.prefs!.getInt("cnt") ?? 0;

                        if(status == "clear")
                          {
                            return InkWell(
                              onTap:() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second(index);
                                },
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 5),
                                    image: DecorationImage(
                                        image: AssetImage("images/tick.png"),
                                        fit: BoxFit.fill)),
                                child: Text("${index+1}",
                                style: TextStyle(fontSize: 22,
                                fontFamily: "family1",
                                color: Colors.black),),
                              )
                            );
                          }
                        else if(status=="skip")
                          {
                            return InkWell(
                              onTap:() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second(index);
                                },
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 5)
                                ),
                                child: Text("${index+1}",
                                  style: TextStyle(fontSize: 22,
                                      fontFamily: "family1",
                                      color: Colors.black),),
                              ),
                            );
                          }
                        else
                          {
                            if(index==cnt)
                              {
                                return InkWell(
                                  onTap:() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return second(index);
                                    },
                                    ));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text("${index+1}",
                                      style: TextStyle(fontSize: 22,
                                          fontFamily: "family1",
                                          color: Colors.black),),
                                  ),
                                );
                              }
                            else
                              {
                                return Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("images/lock.png"),
                                          fit: BoxFit.fill)),
                                );
                              }
                          }
                    },
                    )
                )
              ],
            ),
          ),
      ),
    );
  }
}
