import 'package:flutter/material.dart';

class BMICalculator {
  static double calculateBMI(double weight, double heightCm) {
    double heightM = heightCm / 100;
    return weight / (heightM * heightM);
  }

  static String getCatagory(double bmi) {
    if (bmi < 18.5) {
      return "UnderWeight";
    } else if (bmi < 24.9) {
      return "Normal";
    } else if (bmi < 29.9) {
      return "OverWeight";
    } else {
      return "Obese";
    }
  }

  static Color getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi < 25) {
      return Colors.green;
    } else if (bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
