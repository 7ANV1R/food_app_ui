import 'package:flutter/material.dart';
import 'package:food_app/core/const_color.dart';
import 'package:food_app/screens/home_page.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: kWhiteColor,
        //will change primary color later
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
