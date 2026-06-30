import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = "Male";

  Widget genderCard({required String title, required IconData icon}) {
    bool isSelected = selectedGender == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = title;
        });
      },
      child: Expanded(
        child: AnimatedScale(
          scale: isSelected ? 1.04 : 1.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.elasticOut, // Bounce effect
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromARGB(255, 66, 72, 193)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? const Color.fromARGB(255, 66, 72, 193).withOpacity(0.25)
                    : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? const Color.fromARGB(255, 66, 72, 193).withOpacity(0.25)
                      : Colors.black.withOpacity(0.08),
                  blurRadius: isSelected ? 15 : 5,
                  spreadRadius: isSelected ? 2 : 0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedScale(
                  scale: isSelected ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.elasticOut,
                  child: Icon(
                    icon,
                    size: 20,
                    color: isSelected ? Colors.white : Colors.black54,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        genderCard(title: "Male", icon: Icons.male_outlined),
        SizedBox(width: 35),
        genderCard(title: "Female", icon: Icons.female_outlined),
      ],
    );
  }
}
