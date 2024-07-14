import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/inherited/TaskInherited.dart';
import 'package:nosso_primeiro_projeto/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: TaskInherited(
        child: const MainScreen(),
      ),
    );
  }
}
