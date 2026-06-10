import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = "";

  Widget genderCard({required String title, required IconData icon}) {
    bool isSelected = selectedGender == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = title;
        });
      },
      child: AnimatedScale(
        scale: isSelected ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.elasticOut, // Bounce effect
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(255, 77, 253, 80).withOpacity(0.15)
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? const Color.fromARGB(255, 73, 249, 106)
                  : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? const Color.fromARGB(255, 95, 240, 103).withOpacity(0.25)
                    : Colors.black.withOpacity(0.05),
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
                  size: 30,
                  color: isSelected
                      ? const Color.fromARGB(255, 100, 233, 88)
                      : Colors.black54,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? const Color.fromARGB(255, 86, 232, 98)
                      : Colors.black87,
                ),
              ),
            ],
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
