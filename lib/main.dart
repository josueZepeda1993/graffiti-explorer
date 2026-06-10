import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GraffitiExplorerApp());
}

class GraffitiExplorerApp extends StatelessWidget {
  const GraffitiExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}