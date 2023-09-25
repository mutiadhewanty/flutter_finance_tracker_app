import 'package:flutter/material.dart';
import 'package:flutter_finance_tracker_app/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: Color(0xFF3E616B), onPrimary: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
