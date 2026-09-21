import 'package:flutter_test/flutter_test.dart';
import 'package:salesperformanceapp/app/app.dart';

void main() {
  testWidgets('Sales Performance app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.text('Sales Performance'), findsOneWidget);
  });
}