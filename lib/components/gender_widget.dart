import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final IconData? genderIcon;
  final String? genderLabel;

  const GenderWidget({
    super.key,
    required this.genderIcon,
    required this.genderLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          genderLabel!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
