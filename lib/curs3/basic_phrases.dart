import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';

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
  AudioCache _audioCache;
  final List<String> _audioNames = <String>[
    'Salut!',
    'Hallo!',
    'Cine ești?',
    'Wer bist du?',
    'Eu sunt ...',
    'Ich bin ...',
    'Sunt bine.',
    'Es geht mir gut.'
  ];
  final List<String> _audioFiles = <String>[
    'salut.mp3',
    'hallo.mp3',
    'cineesti.mp3',
    'werbistdu.mp3',
    'eusunt.mp3',
    'ichbin.mp3',
    'suntbine.mp3',
    'esgehtmirgut.mp3'
  ];

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: '/Users/cristina/IdeaProjects/flutter_atelierul_digital/lib/curs3/audio/',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Phrases'),
      ),
      body: GridView.builder(
        itemCount: 8,
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.blue,
                  Colors.cyan,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: RawMaterialButton(
              onPressed: () => _audioCache.play('${_audioFiles[index]}'),
              child: Text(
                '${_audioNames[index]}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
