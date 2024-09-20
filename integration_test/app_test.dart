import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:baseball/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 构建我们的应用并触发一个帧。
    app.main();

    // 触发一个帧。
    await tester.pumpAndSettle();

    // 验证计数器的初始值是否为 0。
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // 点击 '+' 图标并触发一个帧。
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 验证计数器是否增加了。
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
