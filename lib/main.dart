import 'package:flight_test_app/core/di/injection.dart';
import 'package:flight_test_app/presentation/views/providers/flight_provider.dart';
import 'package:flight_test_app/presentation/views/splash_screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  setupDependencies();

  runApp(
    ChangeNotifierProvider(
      create: (_) => sl<FlightProvider>(),
      child: const FlightTestApp(),
    ),
  );
}

class FlightTestApp extends StatelessWidget {
  const FlightTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      debugShowCheckedModeBanner: false,
      title: 'Flight Test App',
      home: const SplashScreen(),
    );
  }
}
