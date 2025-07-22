import 'package:flutter/material.dart';

class MenuTrigger extends StatelessWidget {
  final IconData? icon;
  final String? label;

  const MenuTrigger({
    super.key,
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    if (icon != null && label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 4),
          Text(label!, style: const TextStyle(color: Colors.white)),
        ],
      );
    } else if (icon != null) {
      return Icon(icon, color: Colors.white);
    } else if (label != null) {
      return Text(label!, style: const TextStyle(color: Colors.white));
    } else {
      return const Icon(Icons.more_vert, color: Colors.white);
    }
  }
}
