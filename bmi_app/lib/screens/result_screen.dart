import 'package:bmi_app/widgets/circular_result_card.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                child: Icon(Icons.arrow_back, size: 25),
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
                child: Icon(Icons.share),
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

            child: Container(
              // height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: CircularResultCard(
                bmi: 24,
                status: "Normal",
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
