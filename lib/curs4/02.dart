import 'dart:async';

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
  Timer _timer;
  int _time = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onTick(Timer timer) {
    setState(
      () {
        if (_time == 1) {
          timer.cancel();
        }
        _time--;
        if (_time == 0) {
          _playSound();
        }
      },
    );
  }

  void _playSound() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isActive = _timer?.isActive ?? false;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Slider(
            value: _time.toDouble(),
            min: 0.0,
            max: 60.0,
            onChanged: isActive
                ? null
                : (double value) {
                    setState(
                      () {
                        _time = value.toInt();
                      },
                    );
                    print(_time);
                  },
          ),
          Text('$_time s'),
          FlatButton(
            child: const Text('Start'),
            onPressed: () {
              _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
            },
          ),
          FlatButton(
            child: const Text('Stop'),
            onPressed: () {
              setState(
                () {
                  _timer?.cancel();
                },
              );
            },
          ),
          // FlatButton(
          //   child: const Text('Test'),
          //   onPressed: () {
          //     Timer(
          //       const Duration(seconds: 0),
          //       () {
          //         print('smth');
          //       },
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
