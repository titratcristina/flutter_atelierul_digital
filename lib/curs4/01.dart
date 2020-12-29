import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              shrinkWrap: true,
              // padding: const EdgeInsets.all(16.0),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('$index'),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: 100,
              shrinkWrap: true,
              // padding: const EdgeInsets.all(16.0),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('$index'),
                );
              },
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.topCenter,
            child: Text('Hello!'),
          )
        ],
      ),
    );
  }
}
