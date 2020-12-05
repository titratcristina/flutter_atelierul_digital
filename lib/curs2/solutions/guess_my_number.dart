// File created by
// Lung Razvan <long1eu>
// on 23/11/2020

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _controller = TextEditingController();
  final Random random = Random();
  bool _isGameOver;
  int _number;
  int _guess;
  String _message;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      _guess = null;
      _message = null;
      _isGameOver = false;
      _number = random.nextInt(100) + 1;
    });
    print(_number);
  }

  void _check() {
    _controller.clear();
    if (_guess == _number) {
      setState(() {
        _isGameOver = true;
        _message = 'You guessed right.';
      });
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('You guessed right'),
            content: Text('It was $_number'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Try again!'),
                onPressed: () {
                  _resetGame();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else if (_guess > _number) {
      setState(() {
        _message = 'Try lower';
      });
    } else if (_guess < _number) {
      setState(() {
        _message = 'Try higher';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess my number'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "I'm thinking of a number between 1 and 100.",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            Text(
              "It's your turn to guess my number!",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            if (_guess != null)
              Text(
                'You tried $_guess',
                style: Theme.of(context).textTheme.headline3,
              ),
            if (_message != null)
              Text(
                _message,
                style: Theme.of(context).textTheme.headline3,
              ),
            const SizedBox(height: 24.0),
            Card(
              elevation: 6.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Try a number!',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24.0),
                    TextField(
                      controller: _controller,
                      autofocus: true,
                      enabled: !_isGameOver,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (String value) {
                        _guess = int.tryParse(value);
                      },
                    ),
                    const SizedBox(height: 24.0),
                    Builder(
                      builder: (BuildContext context) {
                        return RaisedButton(
                          child: Text(_isGameOver ? 'Reset' : 'Guess'),
                          onPressed: _isGameOver ? _resetGame : _check,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
