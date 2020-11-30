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
  String text;
  String error;
  double number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Image.network(
            'https://image.freepik.com/free-vector/abstract-illustration-stock-exchange-data_23-2148604352.jpg',
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(
                    r'^\d*\.?\d*$',
                  ),
                ),
              ],
              decoration: InputDecoration(
                errorText: error,
                hintText: 'Enter the amount in EUR.',
              ),
              onChanged: (String value) {
                setState(
                  () {
                    text = value;
                  },
                );
              },
            ),
          ),
          RaisedButton(
            child: const Text('Convert'),
            onPressed: () {
              if (text == '' || text == null) {
                setState(
                  () {
                    error = 'Please enter a number!';
                    number = null;
                  },
                );
              } else {
                setState(
                  () {
                    error = null;
                    number = double.parse(text) * 4.87;
                    print('identifier');
                  },
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Text(
              number.toStringAsFixed(2) + ' RON',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
