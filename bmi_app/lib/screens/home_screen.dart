import 'package:bmi_app/utils/bmi_calculator.dart';
import 'package:bmi_app/widgets/gender_selector.dart';
import 'package:bmi_app/widgets/height_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final weightController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 66, 72, 193),
        title: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 72, 193),
                  iconColor: Colors.white,
                ),
                child: const Icon(Icons.menu_open_rounded, size: 25),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 72, 193),
                  iconColor: Colors.white,
                ),
                child: const Icon(Icons.loop_sharp, size: 25),
              ),
            ],
          ),
        ),
      ),
      // Fixed the overflow: Wrapped inside a SingleChildScrollView
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height:
                  140, // Replaced Expanded with an explicit height for scroll context
              width: double.infinity,
              decoration: const BoxDecoration(
                color: const Color.fromARGB(255, 66, 72, 193),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "BMI CALCULATOR",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Calculate your Body Mass Index",
                    style: TextStyle(letterSpacing: 3, color: Colors.white),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(
                0,
                -60,
              ), // Slightly adjusted offset for cleaner spacing
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("GENDER", style: TextStyle(color: Colors.black)),
                    const SizedBox(height: 15),
                    const GenderSelector(),
                    const SizedBox(height: 20),
                    const HeightSlider(),
                    const SizedBox(height: 17),
                    Form(
                      key: _formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "WEIGHT",
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 50,
                                    child: TextFormField(
                                      controller: weightController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 66, 72, 193),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "Please enter your weight";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const Text(
                                    " kg",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 45),
                          Column(
                            children: [
                              const Text(
                                "AGE",
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        70, // Uniform sizing with weight input
                                    height: 50,
                                    child: TextFormField(
                                      controller: ageController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 66, 72, 193),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "Please enter your age";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const Text(
                                    " yrs",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        if (weightController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter your weight"),
                            ),
                          );
                          return;
                        }
                        if (ageController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter your age"),
                            ),
                          );
                          return;
                        }

                        double weight = double.parse(weightController.text);
                        double height = HeightSliderState.height;

                        double bmi = BMICalculator.calculateBMI(weight, height);
                        String catagory = BMICalculator.getCatagory(bmi);
                        Color BMIColor = BMICalculator.getBMIColor(bmi);

                        context.push(
                          '/result',
                          extra: {
                            'bmi': bmi,
                            'catagory': catagory,
                            'BMIColor': BMIColor,
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 66, 72, 193),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("     CALCULATE BMI    "),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
