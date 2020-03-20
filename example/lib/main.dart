import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:app_icon_changer/app_icon_changer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }
  Future<void> setAppIcon(String name) async {
    try {
      await AppIconChanger.changeIcon(name);
    } on PlatformException {
      print('Failed to change app icon');
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: const Text('App icon changer'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('White icon'),
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () => setAppIcon('icon-white'),
              ),
              FlatButton(
                child: Text('Black icon'),
                color: Colors.white,
                onPressed: () => setAppIcon('icon-black'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
