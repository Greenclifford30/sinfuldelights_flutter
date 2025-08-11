import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinfuldelights_flutter/features/menu/data/models/menu.dart';
import 'package:sinfuldelights_flutter/features/menu/presentation/widgets/menu_form.dart';

void main() {
  late Menu menu;

  setUp(() {
    menu = Menu(
      menuId: 'test-menu',
      title: 'Test Menu',
      date: DateTime(2025, 7, 23),
      items: [],
      isActive: true,
    );
  });

  testWidgets('should render empty form correctly', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuForm(onSave: (_) {}),
          ),
        ),
      ),
    );

    expect(find.text('Menu Title'), findsOneWidget);
    expect(find.text('Description (Optional)'), findsOneWidget);
    expect(find.text('Menu Date'), findsOneWidget);
    expect(find.text('Active'), findsOneWidget);
    expect(find.text('Create Menu'), findsOneWidget);
  });

  testWidgets('should render form with initial data correctly', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuForm(
              initialMenu: menu,
              onSave: (_) {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Test Menu'), findsOneWidget);
    expect(find.text('2025-07-23'), findsOneWidget);
    expect(find.text('Update Menu'), findsOneWidget);
  });

  testWidgets('should validate required fields', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuForm(onSave: (_) {}),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Create Menu'));
    await tester.pump();

    expect(find.text('Please enter a title'), findsOneWidget);
  });

  testWidgets('should call onSave with updated data', (tester) async {
    Menu? savedMenu;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuForm(
              onSave: (menu) => savedMenu = menu,
            ),
          ),
        ),
      ),
    );

    await tester.enterText(find.widgetWithText(TextFormField, 'Menu Title'), 'New Menu');
    await tester.tap(find.text('Create Menu'));
    await tester.pump();

    expect(savedMenu?.title, equals('New Menu'));
  });
}