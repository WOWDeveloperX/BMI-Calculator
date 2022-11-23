import 'package:calculator/imput_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light(
          primary: Color(0xff0A0E21),
        ),
        scaffoldBackgroundColor: const Color(0xff0A0E21),
      ),
      home: const InputPage(),
    );
  }
}
