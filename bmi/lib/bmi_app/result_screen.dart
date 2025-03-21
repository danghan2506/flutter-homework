import 'package:flutter/material.dart';
import 'bmi_themed.dart';
import 'bmi_constants.dart';
import 'package:bmi_app/components/reusable_card.dart';

class BmiResultScreen extends StatelessWidget {
  BmiResultScreen({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return BmiThemed(
      child: Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator Result')),
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Your Result", style: kResultTitleTextStyle),
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: Container(
                  padding: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(resultText, style: kResultTextStyle),
                      Text(bmiResult, style: kBMITextStyle),
                      Text(
                        interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "RE-CALCULATE YOUR BMI",
                style: kLargeButtonTextStyle,
              ),
              style: kLargeButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
