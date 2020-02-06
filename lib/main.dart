import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/widgets/animated_butterfly.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
              child: Center(
                child: Container(
                  child: Text(
                    'Hello to Butterfly Animation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    AnimatedButterflyWidget()


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
