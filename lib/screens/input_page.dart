import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../components/reusable_card.dart';
import '../components/icon_textbox.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    childWidget: IconTextBox(
                      icon: FontAwesome.mars,
                      label: 'MALE',
                    ),
                    tapFunction: () {
                      setState(() {
                        this.selectedGender = Gender.male;
                      });
                    },
                    colour: (this.selectedGender == Gender.male)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    childWidget: IconTextBox(
                      icon: FontAwesome.venus,
                      label: 'FEMALE',
                    ),
                    tapFunction: () {
                      setState(() {
                        this.selectedGender = Gender.female;
                      });
                    },
                    colour: (this.selectedGender == Gender.female)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        this.height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey[600],
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x28EB114F),
                    ),
                    child: Slider(
                      onChanged: (double val) {
                        setState(() {
                          this.height = val.toInt();
                        });
                      },
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              this.weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  this.weight--;
                                });
                              },
                              icon: FontAwesome.minus,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  this.weight++;
                                });
                              },
                              icon: FontAwesome.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              this.age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'yrs',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  this.age--;
                                });
                              },
                              icon: FontAwesome.minus,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  this.age++;
                                });
                              },
                              icon: FontAwesome.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onTap: () {
              final CalculatorBrain brain = CalculatorBrain(
                weight: this.weight,
                height: this.height,
              );
              String bmi = brain.calculateBMI();
              String resultText = brain.getResult();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: bmi,
                    resultText: resultText,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
