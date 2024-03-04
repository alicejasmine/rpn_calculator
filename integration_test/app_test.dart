import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rpn_calculator/main.dart';


void main() {


  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Enter a number', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect((tester.widget(find.byKey(Key('input_text'))) as Text).data, equals('0'));
    await tester.enterDigits('1');
    expect((tester.widget(find.byKey(Key('input_text'))) as Text).data, equals('1'));
  });


  testWidgets('Addition of two numbers', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect((tester.widget(find.byKey(Key('input_text'))) as Text).data, equals('0'));
    await tester.enterDigits('1');
    await tester.tapByKey(Key('ENTER'));
    await tester.enterDigits('2');
    await tester.enterDigits('+');
    expect((tester.widget(find.byKey(Key('input_text'))) as Text).data, equals('0'));
    expect((tester.widget(find.byKey(Key('result_text'))) as Text).data, equals('3.0'));
  });

}
//helpers
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