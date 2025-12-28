import 'package:flutter/material.dart';
import 'package:flutter_mvvm_statemanagement_practice/constants/theme.dart';
import 'package:flutter_mvvm_statemanagement_practice/screens/movies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: AppThemeData.lightTheme,
      home: const MoviesScreen(),
    );
  }
}
