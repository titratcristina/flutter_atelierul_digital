import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

Future<ExchangeRates> fetchExchangeRates() async {
  final http.Response response =
      await http.get('https://api.ExchangeRatesapi.io/latest?symbols=RON');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ExchangeRates.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ExchangeRates');
  }
}

class ExchangeRates {
  ExchangeRates({this.rates, this.base, this.date});

  factory ExchangeRates.fromJson(Map<String, dynamic> json) {
    return ExchangeRates(
      rates: json['rates']['RON'],
      base: json['base'],
      date: json['date'],
    );
  }

  final double rates;
  final String base;
  final String date;
}

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
  Future<ExchangeRates> futureExchangeRates;
  String text;
  String error;
  double number;
  double eur = 4.8;

  @override
  void initState() {
    super.initState();
    futureExchangeRates = fetchExchangeRates();
  }

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
                )
              ],
              decoration: InputDecoration(
                errorText: error,
                hintText: 'Enter the amount in EUR.',
              ),
              onChanged: (String value) {
                setState(() {
                  text = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<ExchangeRates>(
              future: futureExchangeRates,
              builder:
                  (BuildContext context, AsyncSnapshot<ExchangeRates> snapshot) {
                if (snapshot.hasData) {
                  eur = snapshot.data.rates;
                  return Text('1 EUR is $eur RON');
                } else if (!snapshot.hasError) {
                  print('${snapshot.error}');
                  return const Text('We have a problem! 1 EUR is 4.8 RON by default.');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          RaisedButton(
            child: const Text('Convert'),
            onPressed: () {
              if (text == '' || text == null) {
                setState(() {
                  error = 'Please enter a number!';
                  number = null;
                });
              } else {
                setState(() {
                  error = null;
                  number = double.parse(text) * eur;
                  print('identifier');
                });
              }
            },
          ),
          if (number != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Text(
                number.toStringAsFixed(2) + ' RON',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
            )
        ],
      ),
    );
  }
}
