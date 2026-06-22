import 'package:flutter/material.dart';

class HeightSlider extends StatefulWidget {
  const HeightSlider({super.key});

  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  double height = 170;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Text("HEIGHT"),
          SizedBox(height: 10),
          Text(
            "${height.toInt()} cm    ${(height.toInt() / 30.48).toStringAsFixed(2)} Feet   ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 10,
            width: 260,
            child: Slider(
              value: height,
              min: 100,
              max: 220,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
