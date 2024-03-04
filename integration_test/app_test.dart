import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rpn_calculator/main.dart';


void main() {


  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Enter a number', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), equals(''));
    await tester.enterDigits('123');
    expect(find.displayText(), equals('123'));
  });


}

extension TesterExtensions on WidgetTester {
  Future<void> enterDigits(String digits) async {
    for (var digit in digits.characters) {
      await tapByKey(Key(digit));
    }
  }

  Future<void> tapByKey(Key key) async {
    await tap(find.byKey(key));
    await pump();
  }
}
extension FinderExtensions on CommonFinders {
  String? displayText() {
    final text = byKey(const Key("Display")).evaluate().single.widget as Text;
    return text.data;
  }
}