import 'package:dockapp/widgets/dack.dart';
import 'package:flutter/material.dart';
import '../widgets/icon_item.dart'; // Import the IconItem widget

/// [HomePage] is a stateless widget that serves as the main screen of the app.
///
/// This page contains the [Dock] widget which displays a list of draggable icons.
class HomePage extends StatelessWidget {
  /// Creates an instance of [HomePage].
  const HomePage({super.key});

  /// Builds the [Scaffold] which contains the [Dock] widget.
  ///
  /// The [Dock] widget holds a list of icons that users can drag and reorder.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Dock(
          items: const [
            Icons.person,
            Icons.message,
            Icons.call,
            Icons.camera,
            Icons.photo,
          ],
          builder: (icon) {
            // Map icons to fixed colors
            Color iconColor;
            switch (icon) {
              case Icons.person:
                iconColor = Colors.red;
                break;
              case Icons.message:
                iconColor = Colors.blue;
                break;
              case Icons.call:
                iconColor = Colors.green;
                break;
              case Icons.camera:
                iconColor = Colors.orange;
                break;
              case Icons.photo:
                iconColor = Colors.purple;
                break;
              default:
                iconColor = Colors.grey; // Default color
                break;
            }
            return IconItem(
                iconData: icon, color: iconColor); // Use IconItem widget
          },
        ),
      ),
    );
  }
}
