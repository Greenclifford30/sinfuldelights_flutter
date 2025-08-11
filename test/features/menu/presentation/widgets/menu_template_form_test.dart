import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinfuldelights_flutter/features/menu/data/models/predefined_menu.dart';
import 'package:sinfuldelights_flutter/features/menu/presentation/widgets/menu_template_form.dart';
import '../../helpers/test_helpers.dart';

void main() {
  late PredefinedMenu template;

  setUp(() {
    template = PredefinedMenu(
      templateId: 'test-template',
      name: 'Test Template',
      items: [testMenuItem],
      createdAt: DateTime(2025, 7, 23),
      isActive: true,
    );
  });

  testWidgets('should render empty form correctly', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuTemplateForm(onSave: (_) {}),
          ),
        ),
      ),
    );

    expect(find.text('Template Name'), findsOneWidget);
    expect(find.text('Description (Optional)'), findsOneWidget);
    expect(find.text('Active'), findsOneWidget);
    expect(find.text('Menu Items'), findsOneWidget);
    expect(find.text('No items added yet'), findsOneWidget);
    expect(find.text('Create Template'), findsOneWidget);
  });

  testWidgets('should render form with initial data correctly', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuTemplateForm(
              initialTemplate: template,
              onSave: (_) {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Test Template'), findsOneWidget);
    expect(find.text(testMenuItem.name), findsOneWidget);
    expect(find.text('\$${testMenuItem.price.toStringAsFixed(2)}'), findsOneWidget);
    expect(find.text('Update Template'), findsOneWidget);
  });

  testWidgets('should validate required fields', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuTemplateForm(onSave: (_) {}),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Create Template'));
    await tester.pump();

    expect(find.text('Please enter a name'), findsOneWidget);
  });

  testWidgets('should add and remove menu items', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuTemplateForm(
              initialTemplate: template,
              onSave: (_) {},
            ),
          ),
        ),
      ),
    );

    // Initial item should be visible
    expect(find.text(testMenuItem.name), findsOneWidget);

    // Remove the item
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    expect(find.text(testMenuItem.name), findsNothing);
    expect(find.text('No items added yet'), findsOneWidget);
  });

  testWidgets('should call onSave with updated data', (tester) async {
    PredefinedMenu? savedTemplate;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuTemplateForm(
              onSave: (template) => savedTemplate = template,
            ),
          ),
        ),
      ),
    );

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Template Name'),
      'New Template',
    );
    await tester.tap(find.text('Create Template'));
    await tester.pump();

    expect(savedTemplate?.name, equals('New Template'));
  });
}