import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

Map<String, String> resultInterpretations = {
  'OVERWEIGHT':
      'You have a higher than normal body weight. Try to exercise more.',
  'NORMAL': 'You have a normal body weight. Good job!',
  'UNDERWEIGHT':
      'You have a lower than normal body weight. Try to eat a bit more.',
};

Map<String, Color> resultColors = {
  'OVERWEIGHT': kNotOkColor,
  'NORMAL': kOkColor,
  'UNDERWEIGHT': kNotOkColor,
};

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult, @required this.resultText});

  final String bmiResult;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kTitleStyle,
            ),
          ),
          Expanded(
            child: ReusableCard(
              childWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      this.resultText,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: resultColors[this.resultText],
                      ),
                    ),
                    Text(
                      this.bmiResult,
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      resultInterpretations[this.resultText],
                      style: kLabelTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              colour: kActiveCardColor,
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
