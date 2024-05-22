import 'dart:io';

import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/card_widget.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String bmiResultCategory;
  final String interpretation;
  final String bmiResultWeightRange;

  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.interpretation,
    required this.bmiResultCategory,
    required this.bmiResultWeightRange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        //leading: const Icon(Icons.sort),
        backgroundColor: const Color(0xFF1D1E33),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Your Result Text
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
                //textAlign: TextAlign.start,
              ),
            ),
          ),
          // BMI category, BMI result, Interpretation
          Expanded(
            flex: 5,
            child: CardWidget(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // BMI category
                  Text(
                    bmiResultCategory.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF24D876), //Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  // BMI result
                  Text(
                    bmiResult,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                    ),
                  ),
                  // BMI Weight range
                  Column(
                    children: [
                      // BMI category
                      Text(
                        '$bmiResultCategory BMI range:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.normal,
                          // Platform.isIOS ? const EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
                          color: const Color(0xFF8D8E98),
                        ),
                      ),
                      // Weight ranges
                      Text(
                        bmiResultWeightRange,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: Platform.isIOS ? FontWeight.w600 : FontWeight.w200,
                          //fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  // Interpretation
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      interpretation,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                  // Save result
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kInActiveCardColor,
                    ),
                    height: 65,
                    width: 220,
                    child: Center(
                      child: Text(
                        'SAVE RESULT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: Platform.isIOS ? FontWeight.w500 : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Pink button
          BottomButton(
              onUserPress: () {
                Navigator.pop(context);
              },
              label: 'RE-CALCULATE YOUR BMI'),
        ],
      ),
    );
  }
}

/*
Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [],
            ),
          ),
          // Your Result Text
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
                //textAlign: TextAlign.start,
              ),
            ),
          ),
          // BMI category, BMI result, Interpretation
          Expanded(
            flex: 5,
            child: CardWidget(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // BMI category
                  Text(
                    bmiResultCategory.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF24D876), //Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  // BMI result
                  Text(
                    bmiResult,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                    ),
                  ),
                  // BMI Weight range
                  Column(
                    children: [
                      // BMI category
                      Text(
                        '$bmiResultCategory BMI range:',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      // Weight ranges
                      Text(
                        bmiResultWeightRange,
                        style: const TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 22,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  // Interpretation
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      interpretation,
                      style: const TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                  // Save result
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kInActiveCardColor,
                    ),
                    height: 65,
                    width: 220,
                    child: const Center(
                      child: Text(
                        'SAVE RESULT',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Pink button
          BottomButton(
              onUserPress: () {
                Navigator.pop(context);
              },
              label: 'RE-CALCULATE YOUR BMI'),
        ],
      ),
 */
