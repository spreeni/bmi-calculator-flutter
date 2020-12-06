import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF101021), //Appbar,
        scaffoldBackgroundColor: Color(0xFF101021), // Background
        /*accentColor: Color(0xFF1E1B31), //Button
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),*/
      ),
    );
  }
}
