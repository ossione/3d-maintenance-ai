import 'package:flutter_test/flutter_test.dart';
import 'package:putiz_9/main.dart';

void main() {
  testWidgets('App starts and shows home page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaintenanceApp());
    expect(find.text('3D Maintenance AI'), findsOneWidget);
  });
}
