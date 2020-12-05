// File created by
// Lung Razvan <long1eu>
// on 23/11/2020

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberShapes(),
    );
  }
}

class NumberShapes extends StatefulWidget {
  @override
  _NumberShapesState createState() => _NumberShapesState();
}

class _NumberShapesState extends State<NumberShapes> {
  final TextEditingController _controller = TextEditingController();
  String _message = '';

  int _checkShape() {
    final int numberInt = int.tryParse(_controller.text);
    bool square = false;
    bool triangular = false;
    for (int i = 1; i <= numberInt; i++) {
      if (pow(i, 2) == numberInt) {
        square = true;
        break;
      }
    }
    for (int i = 1; i <= numberInt; i++) {
      if (pow(i, 3) == numberInt) {
        triangular = true;
        break;
      }
    }
    if (square && triangular) {
      _message = 'Number $numberInt is both SQUARE and TRIANGULAR.';
    } else if (triangular) {
      _message = 'Number $numberInt is TRIANGULAR.';
    } else if (square) {
      _message = 'Number $numberInt is SQUARE.';
    } else {
      _message = 'Number $numberInt is neither TRIANGULAR or SQUARE.';
    }
    return numberInt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Shapes'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Align(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Please input a number to see if it is square or triangular.',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () async {
            if (_controller.text.isEmpty) {
              return;
            }
            final int value = _checkShape();
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('$value'),
                  content: Text(_message),
                );
              },
            );
            _controller.clear();
          },
        ),
      ),
    );
  }
}
