import 'package:flutter/material.dart';
import 'menu_item.dart';
import 'menu_config.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onTap;
  final MenuDropdownConfig config;

  const MenuItemWidget({
    super.key,
    required this.item,
    required this.onTap,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    if (item.isDivider) {
      return const Divider(height: 1, color: Colors.white24);
    }

    if (item.customWidget != null) {
      return InkWell(
        onTap: onTap,
        child: item.customWidget,
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (item.icon != null)
              IconTheme(
                data: IconThemeData(
                  size: config.iconSize,
                  color: Colors.black, // default color
                ),
                child: item.icon!,
              ),
            if (item.icon != null) const SizedBox(width: 10),
            if (item.label != null)
              Expanded(
                child: Text(
                  item.label!,
                  overflow: TextOverflow.ellipsis,
                  style: config.labelTextStyle,
                ),
              ),
            if (item.trailing != null) ...[
              const SizedBox(width: 8),
              item.trailing!,
            ]
          ],
        ),
      ),
    );
  }
}
