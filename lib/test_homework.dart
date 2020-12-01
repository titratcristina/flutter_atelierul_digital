import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

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
  int number;
  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Shape'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Please input a number to see if it is a square or triangular.',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                hintText: 'Enter a number',
              ),
              onChanged: (String value) {
                setState(
                  () {
                    if (value == '' || value == null) {
                      number = null;
                      text = null;
                    } else {
                      number = int.parse(value);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final bool square = sqrt(number) == sqrt(number).toInt();
          final bool triangular = sqrt(8 * number + 1) == sqrt(8 * number + 1).toInt();

          setState(
            () {
              if (square && triangular) {
                text = 'Number is both SQUARE and TRIANGULAR.';
              } else if (square) {
                text = 'Number is SQUARE.';
              } else if (triangular) {
                text = 'Number is TRIANGULAR.';
              } else {
                text = 'Number is neither SQUARE or TRIANGULAR';
              }
            },
          );
          showDialog<void>(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('$number'),
              content: Text('$text'),
            ),
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
