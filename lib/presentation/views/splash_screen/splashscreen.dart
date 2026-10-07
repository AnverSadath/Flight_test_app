import 'package:flight_test_app/presentation/views/flight_list_screen/flight_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/splash_image.jpg', fit: BoxFit.cover),

          Positioned(
            top: height * 0.09,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/splash_logo.png'),
          ),

          Positioned(
            bottom: height * 0.150,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "DISCOVER THE \nWORLD WITH THE \nBEST FLIGHTS",
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: height * 0.05,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(353, 55),
                backgroundColor: Color(0xFFF7941E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FlightListScreen(),
                  ),
                );
              },
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
