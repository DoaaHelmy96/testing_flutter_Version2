import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flutter/main.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Counter widget increments on button press', (tester) async {
    await tester.pumpWidget(CounterWidget());

    final counterTextFinder = find.text('0');
    expect(counterTextFinder, findsOneWidget); // Check initial count

    final buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsOneWidget); // Check button exists

    await tester.tap(buttonFinder); // Tap the button

    await tester.pump(); // Rebuild widget after tap

    final updatedCounterTextFinder = find.text('1');
    expect(updatedCounterTextFinder, findsOneWidget); // Check incremented count
  });
}
