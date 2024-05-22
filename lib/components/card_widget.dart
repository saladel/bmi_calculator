import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final Function? onPress;

  const CardWidget({
    super.key,
    required this.colour,
    this.cardChild,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: onPress,
      child: Container(
        //margin: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}

/*
Expanded(
                  child: CardWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColour
                        : inActiveCardColor,
                    cardChild: const GenderWidget(
                      genderIcon: FontAwesomeIcons.mars,
                      genderLabel: "MALE",
                    ),
                  ),
                ),
 */
