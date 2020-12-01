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
      appBar: AppBar(
        actions: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '7',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Container(),

      // Stack(
      //   alignment: AlignmentDirectional.center,
      //   children: <Widget>[
      //     Container(
      //       color: Colors.red,
      //       width: 500.0,
      //       height: 300.0,
      //     ),
      //     Container(
      //       color: Colors.yellow,
      //       width: 300.0,
      //       height: 200.0,
      //     ),
      //     Container(
      //       color: Colors.blue,
      //       width: 100.0,
      //       height: 100.0,
      //     )
      //   ],
      // ),

      // GridView.builder(
      //   itemCount: 100,
      //   padding: const EdgeInsets.all(16.0),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 5,
      //     mainAxisSpacing: 16.0,
      //     crossAxisSpacing: 16.0,
      //     childAspectRatio: 1,
      //   ),
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       color: Colors.red,
      //     );
      //   },
      // ),

      // ListView.builder(),
    );
  }
}
