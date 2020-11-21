import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasSugar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Radio<bool>(
            groupValue: hasSugar,
            value: true,
            onChanged: (bool value) {
              setState(() {
                hasSugar = value;
              });
            },
          ),
          Radio<bool>(
            groupValue: hasSugar,
            value: false,
            onChanged: (bool value) {
              setState(() {
                hasSugar = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
