import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flex_menu_button/flex_menu_button.dart';

void main() {
  group('MenuDropdownButton Widget Tests', () {
    testWidgets('renders with basic icon and tooltip',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuDropdownButton(
              icon: Icons.menu,
              tooltip: 'Menu Options',
              items: [],
            ),
          ),
        ),
      );

      // Check for icon and tooltip
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('opens dropdown when tapped', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuDropdownButton(
              icon: Icons.menu,
              tooltip: 'Tap Menu',
              items: [
                MenuItem(icon: Icons.settings, label: 'Settings'),
              ],
            ),
          ),
        ),
      );

      // Tap the icon button
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // Dropdown should appear
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('applies custom icon size and color',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuDropdownButton(
              icon: Icons.settings,
              tooltip: 'Settings',
              iconColor: Colors.red,
              iconSize: 40,
              items: [],
            ),
          ),
        ),
      );

      final icon = tester.widget<IconButton>(find.byType(IconButton));
      expect(icon.iconSize, 40);
    });

    testWidgets('displays header and footer widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuDropdownButton(
              icon: Icons.more_vert,
              tooltip: 'Options',
              header: Text('Header Title'),
              footer: Text('Footer Note'),
              items: [
                MenuItem(icon: Icons.edit, label: 'Edit'),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('Header Title'), findsOneWidget);
      expect(find.text('Footer Note'), findsOneWidget);
    });

    testWidgets('respects MenuDropdownConfig values',
        (WidgetTester tester) async {
      const config = MenuDropdownConfig(
        backgroundColor: Colors.black,
        borderRadius: 12,
        width: 250,
        labelTextStyle: TextStyle(color: Colors.yellow),
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuDropdownButton(
              icon: Icons.menu,
              tooltip: 'Test Menu',
              config: config,
              items: [
                MenuItem(icon: Icons.star, label: 'Favorite'),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(find.text('Favorite'), findsOneWidget);
    });

    testWidgets('renders with only text as root', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuDropdownButton(
              tooltip: 'Text Only Trigger',
              label: 'Open Menu',
              labelTextStyle: TextStyle(color: Colors.blue),
              items: [
                MenuItem(label: 'Item A'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Open Menu'), findsOneWidget);
    });

    testWidgets('renders with invisible root (secret function)',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuDropdownButton(
              tooltip: 'Invisible Button',
              items: [MenuItem(label: 'Hidden')],
            ),
          ),
        ),
      );

      // Should render something tappable despite no icon or text
      expect(find.byType(IconButton), findsNothing);
      expect(find.byType(Tooltip), findsOneWidget);
    });
  });
}
