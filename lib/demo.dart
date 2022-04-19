import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> {


  int? cnt;

  SharedPreferences? prefs;

  bool ready = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initpref();

  }

  initpref()
  async {
    prefs = await SharedPreferences.getInstance();

    cnt = prefs!.getInt("counter") ?? 0;

    ready = true;

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ready
              ? Center(
            child: Column(
              children: [
                Text("$cnt",
                  style: TextStyle(fontSize: 50),
                ),
                ElevatedButton(onPressed: () {

                  cnt = cnt!+1;
                  prefs!.setInt("counter", cnt!);
                },
                    child: Text("submit"))
              ],
            ),
          )
              : Center(
            child: CircularProgressIndicator(),
          )
      ),
    );
  }
}
