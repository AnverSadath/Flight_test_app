import 'package:flight_test_app/presentation/splash_screen/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlightTestApp());
}

class FlightTestApp extends StatelessWidget {
  const FlightTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight Test App',
      home: const SplashScreen(),
    );
  }
}
