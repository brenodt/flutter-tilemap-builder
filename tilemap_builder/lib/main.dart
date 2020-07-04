import 'package:flutter/material.dart';

import 'src/inspector.dart';
import 'src/map.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        TileMap(),
        Inspector(),
      ),
    );
  }
}
