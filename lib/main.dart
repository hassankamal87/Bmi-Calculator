import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0a0d22),
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color(0xFF0a0d22),
        ),
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    );
  }
}

