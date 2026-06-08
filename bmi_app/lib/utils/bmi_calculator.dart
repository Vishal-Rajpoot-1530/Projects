class BMICalculator {
  static double calculateBMI(double weight, double heightCm) {
    double heightM = heightCm / 100;
    return weight / (heightM * heightM);
  }

  static String getCatagory(double bmi) {
    if (bmi < 18.5) return "UnderWeight";
    if (bmi < 24.9) {
      return "Normal";
    }
    if (bmi < 29.9) return "OverWeight";
    return "Obese";
  }
}
