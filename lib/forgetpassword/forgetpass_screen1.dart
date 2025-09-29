import 'package:flutter/material.dart';
import 'package:hope_connect_app_ui/forgetpassword/forgetpass_screen2.dart';

class ForgetpassScreen1 extends StatefulWidget {
  const ForgetpassScreen1({super.key});

  @override
  State<ForgetpassScreen1> createState() => _ForgetpassScreen1State();
}

class _ForgetpassScreen1State extends State<ForgetpassScreen1> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF4EB),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Header (35% of screen height)
              SizedBox(
                height: screenHeight * 0.35,
                width: double.infinity,
                child: ClipPath(
                  clipper: UShapeClipper(),
                  child: Container(
                    color: const Color(0xFF1C355E),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "NHA Mobile Connect",
                              style: const TextStyle(
                                fontFamily: 'playfairbold',
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Image.asset(
                              "images/logoimage.jpg", // replace with your logo path
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 58),

              // 🔹 Title
              const Text(
                "Enter your email",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF3B2E2A),
                ),
              ),

              const SizedBox(height: 15),

              // 🔹 Email label
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: 'playfairmedium',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF6C6C6C),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // 🔹 Email input field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Enter Your Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF1C355E)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE8B85C),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Next button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetpassScreen2(),
                        ),
                      );

                      // Handle "Next" action
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8B85C),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'playfairmedium',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Custom U-shape clipper with proportional depth
class UShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveDepth = size.height * 0.3; // 30% of header height

    Path path = Path();
    path.lineTo(0, size.height - curveDepth);

    path.quadraticBezierTo(
      size.width * 0.5,
      size.height + curveDepth, // dip in middle
      size.width,
      size.height - curveDepth,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
