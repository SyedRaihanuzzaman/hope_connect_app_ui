import 'package:flutter/material.dart';
import 'package:hope_connect_app_ui/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C355E),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 142),
            Text(
              "NHA Mobile",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Playfair',
                color: Color(0xFFFFFFFF),
                letterSpacing: 8,
                fontSize: 36,
              ),
            ),

            Text(
              "Connect",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Playfair',
                color: Color(0xFFFFFFFF),
                letterSpacing: 8,
                fontSize: 36,
              ),
            ),

            SizedBox(height: 85),

            Image.asset('images/logoimage.jpg', height: 147, width: 147.66),

            SizedBox(height: 32),

            Text(
              "Connecting you to the",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'poppins',
                color: Color(0xFFFFFFFF),
                letterSpacing: 0,
                fontSize: 20,
              ),
            ),
            Text(
              "help you need",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'poppins',
                color: Color(0xFFFFFFFF),
                letterSpacing: 0,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
