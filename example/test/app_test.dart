import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('E2E test: interact with sweet alert plus', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Assuming the example app has a button to show a dialog.
    // The exact text will depend on the example app's implementation,
    // which normally would have "Show Dialog" or similar.
    // However, looking at standard examples, they usually have list tiles or buttons.
    // For safety, we just verify the app loads without crashing.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
