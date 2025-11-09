import 'package:flutter/material.dart';
import 'package:af_classico_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Af Classico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.red, // Untuk aksen yang berbeda
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}