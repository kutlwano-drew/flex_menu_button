import 'package:flutter/material.dart';

/// Alignment options for the menu dropdown relative to the button
enum MenuAlignment {
  left,
  center,
  right,
  top,
  centerLeft,
  centerRight,
}

class MenuDropdownConfig {
  final Color backgroundColor;
  final double borderRadius;
  final double elevation;
  final double? width;
  final double? maxHeight;
  final EdgeInsets contentPadding;
  final TextStyle? labelTextStyle;
  final Color? itemIconColor;
  final double iconSize;
  final Duration animationDuration;
  final MenuAlignment alignment;

  /// Distance between the dropdown and the button
  final double dropdownOffset;

  final Color? tooltipTextColor;
  final Color? tooltipBackgroundColor;
  final TextStyle? headerTextStyle;
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
    this.dropdownOffset = 8.0,
    this.tooltipTextColor,
    this.tooltipBackgroundColor,
    this.headerTextStyle,
    this.footerTextStyle,
  });
}
