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
  bool isCross = true;
  bool isWinner = false;
  List<int> state;

  static const List<List<int>> winConditions = <List<int>>[
    <int>[0, 1, 2],
    <int>[3, 4, 5],
    <int>[6, 7, 8],
    <int>[0, 3, 6],
    <int>[1, 4, 7],
    <int>[2, 5, 8],
    <int>[0, 4, 8],
    <int>[2, 4, 6],
  ];

  @override
  void initState() {
    super.initState();
    setState(
      () {
        state = <int>[
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
        ];
        isWinner = false;
      },
    );
  }

  Color getColor(int value) {
    if (value == 1) {
      return Colors.green;
    } else if (value == 2) {
      return Colors.red;
    }

    return Colors.transparent;
  }

  void play(int index) {
    if (state[index] == 0) {
      setState(
        () {
          if (isCross) {
            state[index] = 1;
          } else {
            state[index] = 2;
          }
          isCross = !isCross;
          checkWin();
        },
      );
    }
  }

  void checkWin() {
    for (final List<int> condition in winConditions) {
      if ((state[condition[0]] != 0) &&
          (state[condition[0]] == state[condition[1]]) &&
          (state[condition[1]] == state[condition[2]])) {
        setWinner(condition);
      } else if (!state.contains(0)) {
        setState(
          () {
            isWinner = true;
          },
        );
      }
    }
  }

  void setWinner(List<int> winnerList) {
    setState(
      () {
        print(winnerList);
        print(state);
        for (int j = 0; j < state.length; j++) {
          if (j != winnerList[0] && j != winnerList[1] && j != winnerList[2]) {
            state[j] = 0;
            isWinner = true;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              // padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.1,
                    ),
                  ),
                  child: FlatButton(
                    padding: const EdgeInsets.all(0),
                    child: AnimatedContainer(
                      color: getColor(state[index]),
                      duration: const Duration(milliseconds: 100),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          play(index);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          if (isWinner)
            RaisedButton(
              child: const Text('Play again!'),
              onPressed: () {
                setState(
                  () {
                    for (int i = 0; i < state.length; i++) {
                      state[i] = 0;
                    }
                    isWinner = false;
                  },
                );
              },
            )
        ],
      ),
    );
  }
}
