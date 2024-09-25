import 'package:flutter/material.dart';

import 'home_page.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
            primary: Color(0xFF0C3B2E),
          secondary: Color(0xFFFFBA00),
        ),

        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white, )
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

