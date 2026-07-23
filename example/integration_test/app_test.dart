import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ArtSweetAlertPlus Acceptance Tests', () {
    testWidgets('Verify Success Alert displays and dismisses', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final successButton = find.text('Success Message');
      expect(successButton, findsOneWidget);

      await tester.tap(successButton);
      await tester.pumpAndSettle();

      expect(find.text('A success message!'), findsOneWidget);
      expect(find.text('Operation completed successfully.'), findsOneWidget);

      // Tap OK button to dismiss
      final okButton = find.text('OK');
      expect(okButton, findsOneWidget);
      await tester.tap(okButton);
      await tester.pumpAndSettle();

      expect(find.text('A success message!'), findsNothing);
    });

    testWidgets('Verify Warning Alert displays and dismisses', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final warningButton = find.text('Warning Message');
      expect(warningButton, findsOneWidget);

      await tester.tap(warningButton);
      await tester.pumpAndSettle();

      expect(find.text('A warning message!'), findsOneWidget);

      final okButton = find.text('OK');
      await tester.tap(okButton);
      await tester.pumpAndSettle();

      expect(find.text('A warning message!'), findsNothing);
    });

    testWidgets('Verify Danger Alert displays and dismisses', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final dangerButton = find.text('Danger (Error) Message');
      expect(dangerButton, findsOneWidget);

      await tester.tap(dangerButton);
      await tester.pumpAndSettle();

      expect(find.text('Oops...'), findsOneWidget);

      final okButton = find.text('OK');
      await tester.tap(okButton);
      await tester.pumpAndSettle();

      expect(find.text('Oops...'), findsNothing);
    });

    testWidgets('Verify Question Alert displays and dismisses', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final questionButton = find.text('Question Message');
      expect(questionButton, findsOneWidget);

      await tester.tap(questionButton);
      await tester.pumpAndSettle();

      expect(find.text('A question?'), findsOneWidget);

      final okButton = find.text('OK');
      await tester.tap(okButton);
      await tester.pumpAndSettle();

      expect(find.text('A question?'), findsNothing);
    });

    testWidgets('Verify Info Alert displays and dismisses', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final infoButton = find.text('Info Message');
      expect(infoButton, findsOneWidget);

      await tester.tap(infoButton);
      await tester.pumpAndSettle();

      expect(find.text('Information'), findsOneWidget);

      final okButton = find.text('OK');
      await tester.tap(okButton);
      await tester.pumpAndSettle();

      expect(find.text('Information'), findsNothing);
    });
  });
}
