import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Time Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _timeString;
  late var _date;
  var datepicker;
  var birthdate;
  var nowdate;
  var different;

  @override
  void initState() {
    _timeString = DateFormat('hh-mm-ss a').format(DateTime.now());
    _date = DateFormat('dd/MMM/yyy').format(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(widget.title),
          ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _timeString,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 16,
          ),
          MaterialButton(
            color: Colors.pinkAccent,
            padding: EdgeInsets.all(16),
            onPressed: () async {
              datepicker = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2025),
              );
              setState(() {
                nowdate = DateFormat('dd/MMM/yyy').format(datepicker);
              });
            },
            child: Container(
              width: 150,
              child: Row(
                children: [
                  Text(nowdate == null ? _date : nowdate,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.pinkAccent,
            padding: EdgeInsets.all(16),
            onPressed: () async {
              datepicker = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2025),
              );
              setState(() {
                birthdate = DateFormat('dd/MMM/yyy').format(datepicker);
              });
            },
            child: Container(
              width: 150,
              child: Row(
                children: [
                  Text(birthdate == null ? _date : birthdate,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListTile(
                      leading: Text("Todays"),
                      trailing: birthdate == null
                          ? Text(_date)
                          : Text(
                              birthdate.toString(),
                            )),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  ListTile(
                      leading: Text("Date of birth"),
                      trailing: nowdate == null
                          ? Text(_date)
                          : Text(
                              nowdate.toString(),
                            )),
                ],
              )),
        ],
      )),
    );
  }

  void _getTime() {
    setState(() {
      _date = DateFormat('dd/MMM/yyy').format(DateTime.now());

      _timeString = DateFormat('hh-mm-ss a').format(DateTime.now());
    });
  }
}
