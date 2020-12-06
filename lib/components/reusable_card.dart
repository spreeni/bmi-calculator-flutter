import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.childWidget, this.tapFunction});

  final Color colour;
  final Widget childWidget;
  final Function tapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.tapFunction();
      },
      child: Container(
        child: this.childWidget,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        width: 60.0,
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
