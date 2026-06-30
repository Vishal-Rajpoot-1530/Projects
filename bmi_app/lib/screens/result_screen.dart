import 'package:bmi_app/widgets/circular_result_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  final String catagory;
  final Color BMIColor;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.catagory,
    required this.BMIColor,
  });

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
                onPressed: () {
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 72, 193),
                  iconColor: Colors.white,
                ),
                child: Icon(Icons.arrow_back, size: 15),
              ),
              Text(
                "Y O U R   R E S U L T",
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 72, 193),
                  iconColor: Colors.white,
                ),
                child: Icon(Icons.share, size: 15),
              ),
            ],
          ),
        ),
      ),

      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: Colors.white)),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 66, 72, 193),
            ),
          ),
          Positioned(
            top: 10,
            left: 16,
            right: 16,
            bottom: 20,

            child: Column(
              children: [
                Container(
                  // height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 8),
                    ],
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularResultCard(
                        bmi: bmi,
                        status: catagory,
                        color: BMIColor,
                      ),
                      // SizedBox(height: 10),
                      Container(
                        height: 200,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "BMI  CATAGORY",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(8),
                              color: BMIColor == Colors.blue
                                  ? Colors.blue.withOpacity(0.10)
                                  : Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        "Underweight",
                                        style: TextStyle(
                                          color: BMIColor == Colors.blue
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    "< 18.5",
                                    style: TextStyle(
                                      color: BMIColor == Colors.blue
                                          ? Colors.blue
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: BMIColor == Colors.green
                                  ? Colors.green.withOpacity(0.10)
                                  : Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        "Normal",
                                        style: TextStyle(
                                          color: BMIColor == Colors.green
                                              ? Colors.green
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    "18.5 - 24.9",
                                    style: TextStyle(
                                      color: BMIColor == Colors.green
                                          ? Colors.green
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: BMIColor == Colors.orange
                                  ? Colors.orange.withOpacity(0.10)
                                  : Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Text(
                                        "Overweight",
                                        style: TextStyle(
                                          color: BMIColor == Colors.orange
                                              ? Colors.orange
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    "25 - 29.9",
                                    style: TextStyle(
                                      color: BMIColor == Colors.orange
                                          ? Colors.orange
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: BMIColor == Colors.red
                                  ? Colors.red.withOpacity(0.10)
                                  : Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        "Obese",
                                        style: TextStyle(
                                          color: BMIColor == Colors.red
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    ">= 30",
                                    style: TextStyle(
                                      color: BMIColor == Colors.red
                                          ? Colors.red
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            66,
                            72,
                            193,
                          ),
                          foregroundColor: Colors.white,
                        ),
                        child: Text("  RECALCULATE     "),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
