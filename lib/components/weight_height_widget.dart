import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData selectedIcon;
  final VoidCallback onTap;
  final VoidCallback onUserLongPress;
  final VoidCallback onUserLongPressUp;

  const RoundIconButton({
    super.key,
    required this.selectedIcon,
    required this.onTap,
    required this.onUserLongPress,
    required this.onUserLongPressUp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: onTap,
      onLongPress: onUserLongPress,
      onLongPressUp: onUserLongPressUp,
      child: RawMaterialButton(
        onPressed: onTap,
        elevation: 8,
        constraints: const BoxConstraints.tightFor(width: 56, height: 56),
        shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
        child: Icon(selectedIcon),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterWidget({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  Timer? _incrementTimer;
  Timer? _decrementTimer;

  void _startIncrementTimer() {
    _incrementTimer?.cancel();
    _incrementTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      widget.onIncrement();
    });
  }

  void _stopIncrementTimer() {
    _incrementTimer?.cancel();
  }

  void _startDecrementTimer() {
    _decrementTimer?.cancel();
    _decrementTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (widget.value > 0) {
        widget.onDecrement();
      } else {
        _stopDecrementTimer();
      }
    });
  }

  void _stopDecrementTimer() {
    _decrementTimer?.cancel();
  }

  @override
  void dispose() {
    _incrementTimer?.cancel();
    _decrementTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text
        Text(
          widget.label,
          style: kLabelTextStyle,
        ),
        // Height/Age Value
        Text(
          widget.value.toString(),
          style: kNumberTextStyle,
        ),

        // Minus & Addition Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Minus
            RoundIconButton(
              selectedIcon: FontAwesomeIcons.minus,
              onTap: () {
                if (widget.value > 0) {
                  widget.onDecrement();
                }
              },
              onUserLongPress: _startDecrementTimer,
              onUserLongPressUp: _stopDecrementTimer,
            ),
            // Add
            RoundIconButton(
              selectedIcon: FontAwesomeIcons.plus,
              onTap: widget.onIncrement,
              onUserLongPress: _startIncrementTimer,
              onUserLongPressUp: _stopIncrementTimer,
            ),
          ],
        ),
      ],
    );
  }
}
// Gesture
/*
            GestureDetector(
              onTap: widget.onDecrement,
              onLongPress: _startDecrementTimer,
              onLongPressUp: _stopDecrementTimer,
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: kBottomButtonColour,
                child: Icon(Icons.remove),
              ),
            ),

GestureDetector(
              onTap: widget.onIncrement,
              onLongPress: _startIncrementTimer,
              onLongPressUp: _stopIncrementTimer,
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue,
                child: Icon(Icons.add),
              ),
            ),
 */
