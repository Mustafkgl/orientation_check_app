import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const OrientationApp());
}

class OrientationApp extends StatelessWidget {
  const OrientationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oryantasyon Kontrol Sistemi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
