import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:art_sweetalert_plus/art_sweetalert_plus.dart';

void main() {
  testWidgets('ArtSweetAlertPlus displays successfully with title and text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () {
              ArtSweetAlertPlus.show(
                context: context,
                artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertPlusType.success,
                  title: 'Success!',
                  text: 'Everything worked.',
                  confirmButtonText: 'Great',
                ),
              );
            },
            child: const Text('Show Dialog'),
          ),
        ),
      ),
    ));

    // Initially, dialog is not displayed.
    expect(find.text('Success!'), findsNothing);

    // Tap the button to show the dialog.
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Verify dialog is displayed with title, text, and confirm button.
    expect(find.text('Success!'), findsOneWidget);
    expect(find.text('Everything worked.'), findsOneWidget);
    expect(find.text('Great'), findsOneWidget);

    // Tap the confirm button to dismiss.
    await tester.tap(find.text('Great'));
    await tester.pumpAndSettle();

    // Verify dialog is dismissed.
    expect(find.text('Success!'), findsNothing);
  });

  testWidgets('ArtSweetAlertPlus displays deny and cancel buttons correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () {
              ArtSweetAlertPlus.show(
                context: context,
                artDialogArgs: ArtDialogArgs(
                  title: 'Are you sure?',
                  showCancelBtn: true,
                  confirmButtonText: 'Yes',
                  denyButtonText: 'No',
                  cancelButtonText: 'Cancel',
                ),
              );
            },
            child: const Text('Show Dialog'),
          ),
        ),
      ),
    ));

    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    expect(find.text('Yes'), findsOneWidget);
    expect(find.text('No'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });
}
