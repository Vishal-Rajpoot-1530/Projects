import 'package:bmi_app/screens/home_screen.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

    GoRoute(
      path: '/result',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return ResultScreen(
          bmi: data['bmi'],
          catagory: data['catagory'],
          BMIColor: data['BMIColor'],
          );
      },
    ),
  ],
);
