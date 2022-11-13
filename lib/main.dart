import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_theme.dart';
import 'package:food_app/screens/homepage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App UI',
      theme: CustomAppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
