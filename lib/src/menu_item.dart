import 'package:flutter/material.dart';

class MenuItem {
  final Widget? icon; // Changed from IconData to Widget
  final String? label;
  final VoidCallback? onTap;
  final bool isDivider;
  final Widget? customWidget;
  final Widget? trailing;

  // Per-item style overrides
  final TextStyle? labelStyle;

  const MenuItem({
    this.icon,
    this.label,
    this.onTap,
    this.isDivider = false,
    this.customWidget,
    this.trailing,
    this.labelStyle,
  });
}
