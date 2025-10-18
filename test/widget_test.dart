// TotalNBA widget tests

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:crossplatform_totalnba/main.dart';

void main() {
  testWidgets('TotalNBA app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: TotalNBAApp()));

    // Verify that the app title appears
    expect(find.text('TotalNBA'), findsAtLeastNWidgets(1));

    // Verify bottom navigation exists
    expect(find.text('Home'), findsAtLeastNWidgets(1));
    expect(find.text('Predictions'), findsAtLeastNWidgets(1));
    expect(find.text('Players'), findsAtLeastNWidgets(1));
    expect(find.text('Settings'), findsAtLeastNWidgets(1));

    // Verify welcome message
    expect(find.text('Welcome to TotalNBA'), findsOneWidget);
  });
}
