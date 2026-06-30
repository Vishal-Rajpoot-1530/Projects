import 'package:bmi_app/utils/bmi_calculator.dart';
import 'package:bmi_app/widgets/gender_selector.dart';
import 'package:bmi_app/widgets/height_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:bmi_app/widgets/nav_bar.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 66, 72, 193),
        title: Container(
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
                child: Icon(Icons.menu_open_rounded, size: 25),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 72, 193),
                  iconColor: Colors.white,
                ),
                child: Icon(Icons.loop_sharp, size: 25),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 66, 72, 193),
              ),
              child: Column(
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
                  // SizedBox(height: 80),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -100),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              margin: EdgeInsets.all(15),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 4), // shadow position
                  ),
                ],
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 10),
                  Text("GENDER", style: TextStyle(color: Colors.black)),
                  SizedBox(height: 15),
                  // gender card selector
                  GenderSelector(),
                  SizedBox(height: 20),
                  // height section
                  HeightSlider(),

                  SizedBox(height: 17),

                  // weight section
                  Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "WEIGHT",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(height: 10),
                            //weight value
                            Row(
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 50,
                                  child: TextFormField(
                                    controller: weightController,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        66,
                                        72,
                                        193,
                                      ),
                                      fontSize: 20,
                                      fontWeight: FontWeight(
                                        800,
                                      ), // Change font size here
                                    ),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
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
                                Text(
                                  " kg",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 65),
                        Column(
                          children: [
                            Text("AGE", style: TextStyle(color: Colors.black)),
                            SizedBox(height: 10),
                            //weight value
                            Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 50,
                                  child: TextFormField(
                                    controller: ageController,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        66,
                                        72,
                                        193,
                                      ),
                                      fontSize: 20,
                                      fontWeight: FontWeight(
                                        800,
                                      ), // Change font size here
                                    ),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
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
                                Text(
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

                  SizedBox(height: 40),
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
                      // if (_formKey.currentState!.validate()) {
                      double weight = double.parse(weightController.text);
                      // int age = int.parse(ageController.text);
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
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 66, 72, 193),
                      foregroundColor: Colors.white,
                    ),
                    child: Text("     CALCULATE BMI    "),
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
