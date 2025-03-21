import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/components/bmi/rounded_button.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:bmi_app/models/bmi_calc_brain.dart';
import 'bmi_themed.dart';
import 'bmi_constants.dart';
import 'result_screen.dart';

enum Gender { male, female }

class BmiInputScreen extends StatefulWidget {
  const BmiInputScreen({super.key});

  @override
  State<BmiInputScreen> createState() => _BmiInputScreenState();
}

class _BmiInputScreenState extends State<BmiInputScreen> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return BmiThemed(
      child: Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator')),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: "MALE",
                        ),
                        onTap: () => {
                          setState(() {
                            selectedGender = Gender.male;
                          }),
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: "FEMALE",
                        ),
                        onTap: () => {
                          setState(() {
                            selectedGender = Gender.female;
                          }),
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("HEIGHT", style: kLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kNumberTextStyle),
                          Text("cm", style: kLabelTextStyle),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          ),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    //Weight and Age
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGHT", style: kLabelTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(weight.toString(),
                                    style: kNumberTextStyle),
                                SizedBox(width: 4.0),
                                Text("kg", style: kLabelTextStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedButton(
                                  onPressed: () => {
                                    setState(() {
                                      weight--;
                                    }),
                                  },
                                  heroTag: "weight-",
                                  icon: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                RoundedButton(
                                  onPressed: () => {
                                    setState(() {
                                      weight++;
                                    }),
                                  },
                                  heroTag: "weight+",
                                  icon: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("AGE", style: kLabelTextStyle),
                            Text(age.toString(), style: kNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedButton(
                                  onPressed: () => {
                                    setState(() {
                                      age--;
                                    }),
                                  },
                                  heroTag: "age-",
                                  icon: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                RoundedButton(
                                  onPressed: () => {
                                    setState(() {
                                      age++;
                                    }),
                                  },
                                  heroTag: "age+",
                                  icon: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
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
              ElevatedButton(
                onPressed: () {
                  BmiCalcBrain calc = BmiCalcBrain(
                    height: height,
                    weight: weight,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BmiResultScreen(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        );
                      },
                    ),
                  );
                },
                child: Text("CALCULATE YOUR BMI", style: kLargeButtonTextStyle),
                style: kLargeButtonStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//IconContent
class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        SizedBox(height: 15.0),
        Text(label, style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98))),
      ],
    );
  }
}
