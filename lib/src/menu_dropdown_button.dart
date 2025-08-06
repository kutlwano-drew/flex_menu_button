import 'package:flutter/material.dart';
import 'menu_config.dart';
import 'menu_item.dart';

class MenuDropdownButton extends StatefulWidget {
  final Widget? icon;
  final String? label;
  final TextStyle? labelTextStyle;
  final String tooltip;
  final List<MenuItem> items;
  final MenuDropdownConfig config;
  final Widget? header;
  final Widget? footer;
  final Color? tooltipTextColor;
  final Color? tooltipBackgroundColor;
  final Color? buttonColor;

  const MenuDropdownButton({
    super.key,
    this.icon,
    this.label,
    this.labelTextStyle,
    required this.tooltip,
    required this.items,
    this.config = const MenuDropdownConfig(),
    this.header,
    this.footer,
    this.tooltipTextColor,
    this.tooltipBackgroundColor,
    this.buttonColor,
  });

  @override
  State<MenuDropdownButton> createState() => _MenuDropdownButtonState();
}

class _MenuDropdownButtonState extends State<MenuDropdownButton> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  void _toggleOverlay() {
    if (_isOpen) {
      _closeOverlay();
    } else {
      _openOverlay();
    }
  }

  void _openOverlay() {
    _overlayEntry = _createOverlay();
    Overlay.of(context).insert(_overlayEntry!);
    _isOpen = true;
  }

  void _closeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isOpen = false;
  }

  Offset _getOffset(Size buttonSize, Size dropdownSize) {
    final offset = widget.config.dropdownOffset;
    switch (widget.config.alignment) {
      case MenuAlignment.top:
        return Offset(0, -dropdownSize.height - offset);
      case MenuAlignment.centerLeft:
        return Offset(-dropdownSize.width - offset,
            (buttonSize.height - dropdownSize.height) / 2);
      case MenuAlignment.centerRight:
        return Offset(buttonSize.width + offset,
            (buttonSize.height - dropdownSize.height) / 2);
      case MenuAlignment.center:
        return Offset(
          (buttonSize.width - dropdownSize.width) / 2,
          buttonSize.height + offset,
        );
      case MenuAlignment.right:
        return Offset(
            buttonSize.width - dropdownSize.width, buttonSize.height + offset);
      case MenuAlignment.left:
      default:
        return Offset(0, buttonSize.height + offset);
    }
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size buttonSize = renderBox.size;
    Offset buttonPosition = renderBox.localToGlobal(Offset.zero);

    Widget dropdown = Material(
      elevation: widget.config.elevation,
      borderRadius: BorderRadius.circular(widget.config.borderRadius),
      color: widget.config.backgroundColor,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: widget.config.maxHeight ?? double.infinity,
        ),
        width: widget.config.width,
        child: IntrinsicWidth(
          stepWidth: widget.config.width ?? 0,
          child: SingleChildScrollView(
            padding: widget.config.contentPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.header != null)
                  DefaultTextStyle(
                    style: widget.config.headerTextStyle ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                    child: widget.header!,
                  ),
                ...widget.items.map((item) {
                  if (item.isDivider) {
                    return const Divider(color: Colors.white24);
                  } else if (item.customWidget != null) {
                    return item.customWidget!;
                  }

                  return InkWell(
                    onTap: () {
                      item.onTap?.call();
                      _closeOverlay();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (item.icon != null)
                            IconTheme(
                              data: IconThemeData(
                                size: widget.config.iconSize,
                                color: widget.config.itemIconColor ??
                                    Theme.of(context).iconTheme.color ??
                                    Colors.black,
                              ),
                              child: item.icon!,
                            ),
                          if ((item.label ?? '').isNotEmpty) ...[
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                item.label!,
                                overflow: TextOverflow.ellipsis,
                                style: item.labelStyle ??
                                    widget.config.labelTextStyle ??
                                    const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                          if (item.trailing != null) ...[
                            const SizedBox(width: 8),
                            item.trailing!,
                          ],
                        ],
                      ),
                    ),
                  );
                }).toList(),
                if (widget.footer != null)
                  DefaultTextStyle(
                    style: widget.config.footerTextStyle ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                    child: widget.footer!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );

    final dropdownKey = GlobalKey();

    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _closeOverlay,
        child: Stack(
          children: [
            Positioned.fill(child: Container(color: Colors.transparent)),
            Positioned(
              left: buttonPosition.dx,
              top: buttonPosition.dy,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: _getOffset(
                    buttonSize,
                    Size(
                      widget.config.width ?? 150,
                      widget.config.maxHeight ?? 200,
                    )),
                child: dropdown,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _closeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget triggerChild;

    if (widget.icon == null &&
        (widget.label == null || widget.label!.isEmpty)) {
      triggerChild = const SizedBox(width: 20, height: 20);
    } else {
      triggerChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.icon != null) widget.icon!,
          if (widget.label != null && widget.label!.isNotEmpty) ...[
            if (widget.icon != null) const SizedBox(width: 6),
            Text(
              widget.label!,
              style: widget.labelTextStyle ??
                  const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
            ),
          ],
        ],
      );
    }

    return CompositedTransformTarget(
      link: _layerLink,
      child: Tooltip(
        message: widget.tooltip,
        decoration: BoxDecoration(
          color: widget.tooltipBackgroundColor ??
              widget.config.tooltipBackgroundColor ??
              Colors.grey[700],
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: TextStyle(
          color: widget.tooltipTextColor ??
              widget.config.tooltipTextColor ??
              Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.buttonColor ?? Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: _toggleOverlay,
            child: triggerChild,
          ),
        ),
      ),
    );
  }
}
