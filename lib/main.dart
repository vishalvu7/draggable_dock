import 'package:flutter/material.dart';
import 'pages/home_page.dart';

/// The entry point of the application.
void main() {
  runApp(const MyApp());
}

/// [MyApp] is the root widget of the application.
///
/// This widget sets up the [MaterialApp] and initializes the [HomePage].
class MyApp extends StatelessWidget {
  /// Creates an instance of [MyApp].
  const MyApp({super.key});

  /// Builds the [MaterialApp] widget which contains the main [Scaffold] of the app.
  ///
  /// The [Scaffold] contains the [HomePage] widget as the home screen,
  /// and the debug banner is disabled.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Set the home page of the app
    );
  }
}
