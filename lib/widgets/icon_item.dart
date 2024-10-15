import 'package:flutter/material.dart';

/// This widget displays an icon with custom styling and a fixed background color.
class IconItem extends StatelessWidget {
  /// Creates an instance of [IconItem].
  /// - [iconData]: The icon to be displayed.
  /// - [color]: The fixed color of the icon background.
  const IconItem({
    super.key,
    required this.iconData,
    required this.color, // Accept color as a parameter
  });

  /// The icon to be displayed.
  final IconData iconData;

  /// The fixed color of the icon background.
  final Color color;

  /// Builds the visual representation of the icon item.
  ///
  /// Returns a [Container] that contains the styled [Icon].
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 48),
      height: 48,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color, // Use the fixed color
      ),
      child: Icon(iconData, color: Colors.white),
    );
  }
}
