import 'dart:io';

import 'package:flutter/material.dart';

import '../constants.dart';

/*
final Color colour;
  final Widget? cardChild;
  final Function? onPress;
 */
class BottomButton extends StatelessWidget {
  final VoidCallback onUserPress;
  final String label;

  const BottomButton({
    super.key,
    required this.onUserPress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUserPress,
      child: Container(
        color: kBottomButtonColour,
        height: 80,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        //padding: const EdgeInsets.only(bottom: 20),
        padding: Platform.isIOS ? const EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
