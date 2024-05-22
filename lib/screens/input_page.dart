import 'package:bmi_calculator/bmi_logic.dart';
import 'package:bmi_calculator/components/gender_widget.dart';
import 'package:bmi_calculator/components/weight_height_widget.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/card_widget.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selectedGender = Gender.male;
  int userHeight = 180;
  int userWeight = 80;
  int userAge = 25;

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
        leading: const Icon(Icons.sort),
        backgroundColor: const Color(0xFF1D1E33),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top two
          Expanded(
            child: Row(
              children: [
                // male card
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: CardWidget(
                      //onPress: () {},
                      colour: selectedGender == Gender.male ? kActiveCardColour : kInActiveCardColor,
                      cardChild: const GenderWidget(
                        genderIcon: FontAwesomeIcons.mars,
                        genderLabel: "MALE",
                      ),
                    ),
                  ),
                ),
                // female card
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: CardWidget(
                      colour: selectedGender == Gender.female ? kActiveCardColour : kInActiveCardColor,
                      cardChild: const GenderWidget(
                        genderIcon: FontAwesomeIcons.venus,
                        genderLabel: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Middle
          Expanded(
            child: CardWidget(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Height text
                  const Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  // Height Integer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        userHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      // cm
                      const Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  // Slider
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: kSliderColors.kActiveColor,
                      inactiveTrackColor: kSliderColors.kInActiveColor,
                      thumbColor: kSliderColors.kThumbColor,
                      overlayColor: const Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: userHeight.toDouble(),
                      min: 100.0,
                      max: 260.0,
                      onChanged: (double newHeightValue) {
                        setState(() {
                          userHeight = newHeightValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          // Bottom Two
          Expanded(
            child: Row(
              children: [
                // WEIGHT
                Expanded(
                  child: CardWidget(
                    colour: kActiveCardColour,
                    cardChild: CounterWidget(
                      label: 'WEIGHT (KG)',
                      value: userWeight,
                      onDecrement: () {
                        setState(() {
                          userWeight--;
                        });
                      },
                      onIncrement: () {
                        setState(() {
                          userWeight++;
                        });
                      },
                    ),
                  ),
                ),
                // AGE
                Expanded(
                  child: CardWidget(
                    colour: kActiveCardColour,
                    cardChild: CounterWidget(
                      label: 'AGE',
                      value: userAge,
                      onIncrement: () {
                        setState(() {
                          userAge++;
                        });
                      },
                      onDecrement: () {
                        setState(() {
                          userAge--;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Pink Button —— Implemented bmi_logic here
          BottomButton(
            onUserPress: () {
              BMILogic calculateUserBmi = BMILogic(height: userHeight, weight: userWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calculateUserBmi.calculateBMI(),
                    interpretation: calculateUserBmi.getInterpretation(),
                    bmiResultCategory: calculateUserBmi.bmiCategories(),
                    bmiResultWeightRange: calculateUserBmi.bmiWeightRange(),
                  ),
                ),
              );
            },
            label: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}

// RESPONSIVENESS CODE
/*
LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          bool isPortrait = screenHeight > screenWidth;

          double cardMargin = isPortrait ? 10.0 : 20.0;
          double cardHeight = isPortrait ? screenHeight * 0.3 : screenHeight * 0.5;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top two
              Expanded(
                child: Row(
                  children: [
                    // male card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(cardMargin),
                          height: cardHeight,
                          child: CardWidget(
                            colour: selectedGender == Gender.male ? kActiveCardColour : kInActiveCardColor,
                            cardChild: const GenderWidget(
                              genderIcon: FontAwesomeIcons.mars,
                              genderLabel: "MALE",
                            ),
                          ),
                        ),
                      ),
                    ),
                    // female card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(cardMargin),
                          height: cardHeight,
                          child: CardWidget(
                            colour: selectedGender == Gender.female ? kActiveCardColour : kInActiveCardColor,
                            cardChild: const GenderWidget(
                              genderIcon: FontAwesomeIcons.venus,
                              genderLabel: "FEMALE",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Middle
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: cardMargin),
                  height: cardHeight,
                  child: CardWidget(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Height text
                        const Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        // Height Integer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Text(
                              userHeight.toString(),
                              style: kNumberTextStyle,
                            ),
                            // cm
                            const Text(
                              "cm",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        // Slider
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                            activeTrackColor: kSliderColors.kActiveColor,
                            inactiveTrackColor: kSliderColors.kInActiveColor,
                            thumbColor: kSliderColors.kThumbColor,
                            overlayColor: const Color(0x29EB1555),
                          ),
                          child: Slider(
                            value: userHeight.toDouble(),
                            min: 100.0,
                            max: 260.0,
                            onChanged: (double newHeightValue) {
                              setState(() {
                                userHeight = newHeightValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom Two
              Expanded(
                child: Row(
                  children: [
                    // WEIGHT
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(cardMargin),
                        height: cardHeight,
                        child: CardWidget(
                          colour: kActiveCardColour,
                          cardChild: CounterWidget(
                            label: 'WEIGHT (KG)',
                            value: userWeight,
                            onDecrement: () {
                              setState(() {
                                userWeight--;
                              });
                            },
                            onIncrement: () {
                              setState(() {
                                userWeight++;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    // AGE
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(cardMargin),
                        height: cardHeight,
                        child: CardWidget(
                          colour: kActiveCardColour,
                          cardChild: CounterWidget(
                            label: 'AGE',
                            value: userAge,
                            onIncrement: () {
                              setState(() {
                                userAge++;
                              });
                            },
                            onDecrement: () {
                              setState(() {
                                userAge--;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Pink Button —— Implemented bmi_logic here
              Container(
                margin: EdgeInsets.symmetric(vertical: cardMargin),
                height: cardHeight * 0.2,
                child: BottomButton(
                  onUserPress: () {
                    BMILogic calculateUserBmi = BMILogic(height: userHeight, weight: userWeight);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calculateUserBmi.calculateBMI(),
                          interpretation: calculateUserBmi.getInterpretation(),
                          bmiResultCategory: calculateUserBmi.bmiCategories(),
                          bmiResultWeightRange: calculateUserBmi.bmiWeightRange(),
                        ),
                      ),
                    );
                  },
                  label: 'CALCULATE YOUR BMI',
                ),
              ),
            ],
          );
        },
      ),
 */

// pink button
/*
          // Pink Button
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print("Calculate got tapped");
              }
            },
            child: Container(
              color: kBottomButtonColour,
              height: 80,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: const Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
           */

/*
Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Weight text
                        const Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        // Weight number
                        Text(
                          userWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Minus
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userWeight--;
                                });
                              },
                              child: const CircleAvatar(
                                radius: 25,
                                backgroundColor: kBottomButtonColour,
                                child: Icon(Icons.remove),
                              ),
                            ),
                            // Add
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userWeight++;
                                });
                              },
                              child: const CircleAvatar(
                                radius: 25,
                                backgroundColor: kSliderColors.kInActiveColor,
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
 */
