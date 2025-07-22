import 'package:flutter/material.dart';

/// Alignment options for the menu dropdown
enum MenuAlignment {
  left,
  center,
  right,
}

class MenuDropdownConfig {
  /// Dropdown background color
  final Color backgroundColor;

  /// Radius of the dropdown border
  final double borderRadius;

  /// Material elevation
  final double elevation;

  /// Custom width of dropdown. If null, dropdown resizes to content.
  final double? width;

  /// Max height of dropdown. If null, fits to content height.
  final double? maxHeight;

  /// Internal padding between items
  final EdgeInsets contentPadding;

  /// Text style for menu item labels
  final TextStyle? labelTextStyle;

  /// Color for menu item icons (used if not overridden individually)
  final Color? itemIconColor;

  /// Icon size for each menu item
  final double iconSize;

  /// Duration of dropdown animation
  final Duration animationDuration;

  /// Horizontal alignment relative to the anchor widget
  final MenuAlignment alignment;

  /// Forces dropdown to appear above instead of below
  final bool showAbove;

  /// Text color for the tooltip
  final Color? tooltipTextColor;

  /// Background color of the tooltip
  final Color? tooltipBackgroundColor;

  /// Text style for the optional header widget
  final TextStyle? headerTextStyle;

  /// Text style for the optional footer widget
  final TextStyle? footerTextStyle;

  const MenuDropdownConfig({
    this.backgroundColor = Colors.white,
    this.borderRadius = 6,
    this.elevation = 4,
    this.width,
    this.maxHeight,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 8),
    this.labelTextStyle = const TextStyle(color: Colors.black, fontSize: 14),
    this.itemIconColor,
    this.iconSize = 20,
    this.animationDuration = const Duration(milliseconds: 150),
    this.alignment = MenuAlignment.left,
    this.showAbove = false,
    this.tooltipTextColor,
    this.tooltipBackgroundColor,
    this.headerTextStyle,
    this.footerTextStyle,
  });
}
