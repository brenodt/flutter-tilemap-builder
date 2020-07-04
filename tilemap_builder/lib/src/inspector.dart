import 'package:flutter/material.dart';

class Inspector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: _screenWidth * 0.3,
      color: Colors.purple,
    );
  }
}
