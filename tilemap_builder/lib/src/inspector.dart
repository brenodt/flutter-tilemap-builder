import 'package:flutter/material.dart';

class Inspector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: _screenWidth * 0.3,
      color: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              'Inspector',
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(child: Container()),
            Row(
              children: <Widget>[
                // TODO(brenodt): Remove button duplicity. https://github.com/brenodt/flutter-tilemap-builder/issues/7
                Expanded(
                  child: RaisedButton(
                    onPressed: () => _createMapDialog(context),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: const Text('Create map'),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: const Text('Open map'),
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  void _createMapDialog(BuildContext context) {
    showDialog<AlertDialog>(
      context: context,
      barrierColor: Colors.black87,
      builder: (_) => AlertDialog(
        title: const Text(
          'Create map with size:',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // TODO(brenodt): Remove text field duplicity. https://github.com/brenodt/flutter-tilemap-builder/issues/4
            // TODO(brenodt): Not permit field to receive non-numeric. https://github.com/brenodt/flutter-tilemap-builder/issues/5
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                labelText: 'Width:',
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                labelText: 'Width:',
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          // TODO(brenodt): Link Function. https://github.com/brenodt/flutter-tilemap-builder/issues/6
          FlatButton(child: const Text('Create'), onPressed: () {}),
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
