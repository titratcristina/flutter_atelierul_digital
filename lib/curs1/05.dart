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
  String error;
  String text;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              obscureText: hidePassword,
              // for password
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                hintText: 'password',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_rounded),
                  onPressed: () {
                    setState(
                      () {
                        if (hidePassword) {
                          hidePassword = false;
                        } else {
                          hidePassword = true;
                        }
                      },
                    );
                  },
                ),
                errorText: error,
              ),
              onChanged: (String value) {
                text = value;
              },
            ),
            RaisedButton(
              child: const Text('Login'),
              onPressed: () {
                if (text.length < 6) {
                  setState(
                    () {
                      error = 'The password is too short';
                    },
                  );
                } else {
                  setState(
                    () {
                      error = null;
                    },
                  );
                }
              },
            ),
          ],
        ));
  }
}
