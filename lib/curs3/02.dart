import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color = Colors.green;
  double radius = 0.0;
  AlignmentDirectional aligment = AlignmentDirectional.topStart;

  void _startAnimation() {
    setState(
      () {
        if (color == Colors.red) {
          color = Colors.green;
          radius = 0.0;
          aligment = AlignmentDirectional.topStart;
        } else {
          color = Colors.red;
          radius = 75.0;
          aligment = AlignmentDirectional.bottomCenter;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedAlign(
        alignment: aligment,
        duration: const Duration(seconds: 1),
        curve: Curves.bounceOut,
        onEnd: _startAnimation,
        child: AnimatedContainer(
          width: 150.0,
          height: 150.0,
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
      ),
    );
  }
}
