import 'package:flutter/material.dart';
import '../../lib/flex_menu_button.dart';

void main() {
  runApp(const MenuExampleApp());
}

class MenuExampleApp extends StatelessWidget {
  const MenuExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Dropdown Button Demo',
      theme: ThemeData.dark(),
      home: const MenuDemoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenuDemoPage extends StatelessWidget {
  const MenuDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Dropdown Button Example'),
        actions: [
          MenuDropdownButton(
            label: 'Menu',
            tooltip: 'Open Menu',
            config: MenuDropdownConfig(
              width: 200,
              backgroundColor: Colors.grey[900]!,
              labelTextStyle:
                  const TextStyle(fontSize: 14, color: Colors.white),
            ),
            items: [
              MenuItem(
                icon: Icons.edit,
                label: 'Edit',
                onTap: () => _showSnack(context, 'Edit tapped'),
              ),
              MenuItem(
                icon: Icons.delete,
                label: 'Delete',
                onTap: () => _showSnack(context, 'Delete tapped'),
              ),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text('Use the top-right menu to test the dropdown.'),
      ),
    );
  }

  void _showSnack(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
