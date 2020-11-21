import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

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
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: List<Widget>.generate(
          5,
          (int index) {
            return Radio<int>(
              value: index,
              groupValue: selected,
              onChanged: (int value) {
                setState(
                  () {
                    selected = value;
                    print(value);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
