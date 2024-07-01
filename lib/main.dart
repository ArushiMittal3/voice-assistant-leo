import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:voice_assistant/color_manager.dart';
import 'package:voice_assistant/home_page.dart';
import 'package:voice_assistant/secrets.dart';

void main() {
  Gemini.init(apiKey: geminiApiKey);


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
