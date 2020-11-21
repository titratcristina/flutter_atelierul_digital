import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<ExchangeRates> fetchExchangeRates() async {
  final http.Response response =
  await http.get('https://api.exchangeratesapi.io/latest?symbols=RON');

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

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<ExchangeRates> futureExchangeRates;

  @override
  void initState() {
    super.initState();
    futureExchangeRates = fetchExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<ExchangeRates>(
            future: futureExchangeRates,
            builder: (BuildContext context, AsyncSnapshot<ExchangeRates> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.rates.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
