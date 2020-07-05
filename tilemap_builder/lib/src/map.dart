import 'package:flutter/material.dart';

class TileMap extends StatefulWidget {
  @override
  _TileMapState createState() => _TileMapState();
}

class _TileMapState extends State<TileMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  // TODO(brenodt): Link UI with functions to manipulate map.
                  CircularButton(
                    onTap: null,
                    size: 30.0,
                    icon: Icons.zoom_out,
                  ),
                  Slider(
                    min: 0.0,
                    max: 100.0,
                    value: 0.0,
                    onChanged: null,
                  ),
                  CircularButton(
                    onTap: null,
                    size: 30.0,
                    icon: Icons.zoom_in,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  const CircularButton({
    this.onTap,
    this.size,
    this.icon,
  });
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          width: size,
          height: size,
          color: Colors.black26,
          child: Icon(
            icon,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
