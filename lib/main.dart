import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const LumiApp());
}

class LumiApp extends StatelessWidget {
  const LumiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LUMI',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE91E63),
        ),
        scaffoldBackgroundColor:
            const Color(0xFFFFFBFC),
      ),

      home: const HomeScreen(),
    );
  }
}