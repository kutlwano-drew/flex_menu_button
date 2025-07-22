
# 🔽 flex_menu_button

A customizable and lightweight Flutter dropdown menu button designed to be used in `AppBar`s, `Toolbars`, or anywhere you want quick access to menu actions. It supports icons, text, headers, footers, dividers, custom widgets, flexible alignment, and full style control.

---

## Features

🔘 Works out of the box — no dependencies  
🔘Custom icon, label, text styles  
🔘Optional header and footer widgets  
🔘Dropdown alignment and screen-side flipping  
🔘Custom width, max height, padding, and scrolling  
🔘Optional custom widgets, dividers, and trailing elements  
🔘Tooltip customization  
🔘Fully modular, easy to extend

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flex_menu_button: ^<latest_version>
````

Then run:

```bash
flutter pub get
```

---

## Basic Usage

```dart
import 'package:flex_menu_button/flex_menu_button.dart';

MenuDropdownButton(
  tooltip: 'More',
  icon: Icons.more_vert,
  items: [
    MenuItem(icon: Icons.settings, label: 'Settings', onTap: () {}),
    MenuItem(icon: Icons.logout, label: 'Logout', onTap: () {}),
  ],
)
```
![basic usage](screenshots/readme1.png)
---

## Full Examples

See the full feature showcase with code and screenshots in  
👉 `example/example.md`

---

## Screenshots

| Basic                                 | Custom Styling                           | Header/Footer                                  |
| ------------------------------------- | ---------------------------------------- | ---------------------------------------------- |
| ![Basic](screenshots/basic_usage.png) | ![Styled](screenshots/custom_styles.png) | ![HeaderFooter](screenshots/header_footer.png) |

More examples in the `example/` folder.

---

## Configuration Options

Customize your dropdown with `MenuDropdownConfig`:

```dart
MenuDropdownConfig(
  backgroundColor: Colors.black,
  textStyle: TextStyle(color: Colors.white),
  tooltipBackgroundColor: Colors.grey[900],
  tooltipTextColor: Colors.white,
  borderRadius: 6,
  elevation: 4,
  width: 200,
  maxHeight: 300,
  alignment: MenuAlignment.right,
)
```

---

## 👨‍💻 Developer

### 🔗 Connect with Me

- 🐦 [X/Twitter](https://x.com/kutlwano_drew)
    
- 💻 [GitHub](https://github.com/kutlwano-drew)
    

---

### ☕ Buy Me a Coffee

- [☕ Support Here](https://buymeacoffee.com/kutlwano_drew)
    

---

