import 'package:flutter/material.dart';

import 'presentation/screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Colors.deepOrange.withOpacity(0.3),
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.orange.shade900,
          selectionColor: Colors.orange.shade400,
          selectionHandleColor: Colors.orange.shade800,
        ),
      ),
      home: const HomePage(),
    );
  }
}
