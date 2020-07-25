import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tilemap_builder/src/inspector.dart';

void main() {
  group('Tests behavior of Inspector widget:', () {
    Widget myWidget = MaterialApp(
      home: Inspector(),
    );

    testWidgets('Create button opens alert.', (tester) async {
      await tester.pumpWidget(myWidget);

      expect(find.text('Create map'), findsOneWidget);
      expect(find.text('Open map'), findsOneWidget);

      await tester.tap(find.widgetWithText(RaisedButton, 'Create map'));
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('Clicking out of Alert dialog pops it from context.',
        (tester) async {
      // ^^^^^^^^^^^^ Utilizing state that was kept from last test ^^^^^^^^^^^^^
      //
      // await tester.pumpWidget(myWidget);
      // await tester.tap(find.widgetWithText(RaisedButton, 'Create map'));
      // await tester.pump();

      await tester.tapAt(const Offset(0.0, 0.0));
      await tester.pump();
      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('Clicking on cancel pops alert from context.', (tester) async {
      await tester.pumpWidget(myWidget);

      await tester.tap(find.widgetWithText(RaisedButton, 'Create map'));
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
      await tester.tap(find.widgetWithText(FlatButton, 'Cancel'));
      await tester.pump();
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
