import 'package:flutter/material.dart';

class ForgetpassScreen1 extends StatefulWidget {
  const ForgetpassScreen1({super.key});

  @override
  State<ForgetpassScreen1> createState() => _ForgetpassScreen1State();
}

class _ForgetpassScreen1State extends State<ForgetpassScreen1> {
  @override
  Widget build(BuildContext context) {
    //  final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE8B85C).withOpacity(0.1),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipPath(
                  clipper: UShapeClipper(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    color: const Color(0xFF1C355E),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              "NHA Mobile Connect",
                              style: TextStyle(
                                fontFamily: 'playfairbold',
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),

                            SizedBox(height: 15),
                            Image.asset(
                              "images/logoimage.jpg", // replace with your logo path
                              height: 59,
                              width: 58,
                            ),
                          ],
                        ),
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

class UShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveDepth = 80; // how deep the curve dips

    Path path = Path();

    // Start from top-left
    path.lineTo(0, size.height - curveDepth);

    // One smooth dip from left → middle → right
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height + curveDepth, // dip in middle
      size.width,
      size.height - curveDepth, // end at right
    );

    // Close shape
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
