import 'dart:math';

class BMILogic {
  final int height;
  final int weight;
  late double _bmi;

  BMILogic({
    required this.height,
    required this.weight,
  });

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

/*
BMI, basic categories
Category	BMI (kg/m2)[c]	BMI Prime[c]
Underweight (Severe thinness)	< 16.0	< 0.64
Underweight (Moderate thinness)	16.0 – 16.9	0.64 – 0.67
Underweight (Mild thinness)	17.0 – 18.4	0.68 – 0.73
Normal range	18.5 – 24.9	0.74 – 0.99
Overweight (Pre-obese)	25.0 – 29.9	1.00 – 1.19
Obese (Class I)	30.0 – 34.9	1.20 – 1.39
Obese (Class II)	35.0 – 39.9	1.40 – 1.59
Obese (Class III)	≥ 40.0	≥ 1.60
 */

  // BMI Categories
  String bmiCategories() {
    if (_bmi >= 40.0) {
      return 'Obese (Class III)';
    } else if (_bmi >= 35.0) {
      return 'Obese (Class II)';
    } else if (_bmi >= 30.0) {
      return 'Obese (Class I)';
    } else if (_bmi >= 25.0) {
      return 'Overweight (Pre-obese)';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else if (_bmi >= 17.0) {
      return 'Underweight (Mild thinness)';
    } else if (_bmi >= 16.0) {
      return 'Underweight (Moderate thinness)';
    } else {
      return 'Severely Underweight';
    }
  }

  // BMI Weight ranges
  String bmiWeightRange() {
    if (_bmi >= 40.0) {
      return '40.0 kg/m² upwards';
    } else if (_bmi >= 35.0) {
      return '35.0 – 39.9 kg/m²';
    } else if (_bmi >= 30.0) {
      return '30.0 – 34.9 kg/m²';
    } else if (_bmi >= 25.0) {
      return '25.0 – 29.9 kg/m²';
    } else if (_bmi >= 18.5) {
      return '18.5 – 24.9 kg/m²';
    } else if (_bmi >= 17.0) {
      return '17.0 – 18.4 kg/m²';
    } else if (_bmi >= 16.0) {
      return '16.0 – 16.9 kg/m²';
    } else {
      return '< 16.0 kg/m²';
    }
  }

  String getInterpretation() {
    if (_bmi >= 40.0) {
      return 'You have Obesity of degree Class III. Your health may be at risk due to excessive weight. Consult a doctor for a personalized diet and exercise plan.';
    } else if (_bmi >= 35.0) {
      return 'You have Obesity of degree Class II. Your weight is affecting your health. Start a weight loss program and consult a doctor for guidance.';
    } else if (_bmi >= 30.0) {
      return 'You have Obesity of degree Class I. You are at risk of developing health problems. Start exercising and eating healthy to reduce your weight.';
    } else if (_bmi >= 25.0) {
      return 'You are Overweight (Pre-obese). You are at risk of becoming obese. Start a weight loss program and maintain a healthy lifestyle.';
    } else if (_bmi >= 18.5) {
      return 'You have a Normal BMI. Congratulations! You are at a healthy weight. Keep up the good work and maintain a balanced lifestyle.';
    } else if (_bmi >= 17.0) {
      return 'You have an Underweight (Mild thinness) BMI. You may need to gain weight to reach a healthy range. Consult a doctor or a nutritionist for guidance.';
    } else if (_bmi >= 16.0) {
      return 'You have an Underweight (Moderate thinness) BMI. You are at risk of health problems due to low weight. Consult a doctor or a nutritionist for a personalized diet plan.';
    } else {
      return 'You have a Severely Underweight BMI. Your health is at risk due to extreme low weight. Consult a doctor or a nutritionist immediately for guidance.';
    }
  }
}

/*
 String getBmiResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underweight';
    }
  }

   String bmiCategory() {
    if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else if (_bmi >= 16) {
      return 'Underweight';
    } else {
      return 'Severely Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
 */
