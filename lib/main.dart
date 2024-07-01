import 'package:flutter/material.dart';
import 'package:voice_assistant/color_manager.dart';
import 'package:voice_assistant/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Assistant Leo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(scaffoldBackgroundColor: ColorManager.white),
      home: const HomeScreen(),
    );
  }
}
