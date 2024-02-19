import 'package:flutter/material.dart';
import 'package:primer_pacial_flutter/pages/home.dart';
import 'package:primer_pacial_flutter/pages/multiply_table.dart';
import 'package:primer_pacial_flutter/pages/nums_analysis.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      routes: {
        '/home': (context) => const Home(),
        '/multiplytable': (context) => const MultiplyTable(),
        '/analysisnumber': (context) => const AnalysisNumbers()
      },
    );
  }
}
