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
  final TextEditingController fieldText = TextEditingController();

  int randomNumber = Random().nextInt(101); // from 0 up to 100 included
  // int randomNumber = 55;
  int number;
  bool isPressed = false;
  String text;
  String buttonText = 'Guess';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess my number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: <Widget>[
              const Text(
                'I\'m thinking of a number between 1 and 100.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  'It\'s your turn to guess my number!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              if (isPressed == true && number != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'You tried $number',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        '$text',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Try a number!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black54,
                        ),
                      ),
                      TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: fieldText,
                        onChanged: (String value) {
                          setState(
                            () {
                              print(randomNumber);
                              if (buttonText == 'Reset') {
                                buttonText = 'Guess';
                                randomNumber = Random().nextInt(101);
                              }
                              if (value == '' || value == null) {
                                number = null;
                                isPressed = false;
                              } else {
                                number = int.parse(value);
                                isPressed = false;
                                if (number == randomNumber) {
                                  text = 'You guessed it right!';
                                } else if (number < randomNumber) {
                                  text = 'Try higher';
                                } else if (number > randomNumber) {
                                  text = 'Try lower';
                                }
                              }
                            },
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: RaisedButton(
                          child: Text('$buttonText'),
                          onPressed: () {
                            setState(
                              () {
                                if (number != null) {
                                  isPressed = !isPressed;
                                  fieldText.clear();
                                }
                                if (buttonText == 'Reset') {
                                  buttonText = 'Guess';
                                  number = null;
                                  randomNumber = Random().nextInt(101);
                                }
                              },
                            );
                            if (number == randomNumber)
                              showDialog<void>(
                                context: context,
                                barrierDismissible: false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('You guessed it right!'),
                                    content: Text('It was $randomNumber'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Try again!'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(
                                            () {
                                              buttonText = 'Guess';
                                              number = null;
                                              isPressed = false;
                                              randomNumber = Random().nextInt(101);
                                            },
                                          );
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(
                                            () {
                                              buttonText = 'Reset';
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
