import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inspector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
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
        builder: (_) => _MapCreationDialog());
  }
}

class _MapCreationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Create map with size:',
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // TODO(brenodt): Remove text field duplicity. https://github.com/brenodt/flutter-tilemap-builder/issues/4
          // TODO(brenodt): Not permit field to receive non-numeric. https://github.com/brenodt/flutter-tilemap-builder/issues/5
          _DialogNumericField(label: 'Width:'),
          _DialogNumericField(label: 'Height:'),
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
    );
  }
}

class _DialogNumericField extends StatefulWidget {
  const _DialogNumericField({
    @required this.label,
    this.controller,
    Key key,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;

  @override
  __DialogNumericFieldState createState() => __DialogNumericFieldState();
}

class __DialogNumericFieldState extends State<_DialogNumericField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
