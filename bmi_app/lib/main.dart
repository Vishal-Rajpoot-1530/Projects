import 'package:bmi_app/routs/go_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      theme: ThemeData(primarySwatch: Colors.green),
      // home: const NavBar(),
      routerConfig: appRouter,
    );
  }
}
