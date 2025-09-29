import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetpassScreen2 extends StatefulWidget {
  const ForgetpassScreen2({super.key});

  @override
  State<ForgetpassScreen2> createState() => _ForgetpassScreen2State();
}

class _ForgetpassScreen2State extends State<ForgetpassScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF4EB),

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

              SizedBox(height: 50),
              Card(
                color: const Color(0xFFFFE6C2),
                elevation: 4, // shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.email, size: 48),
                  onPressed: () {
                    // TODO: handle Apple login
                  },
                ),
              ),

              SizedBox(height: 20),

              const Text(
                "Check your Email",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF3B2E2A),
                ),
              ),

              SizedBox(height: 10),

              Text(
                "We sent a code to",
                style: TextStyle(
                  fontFamily: 'intermedium',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                "yourname@gmail.com",
                style: TextStyle(
                  fontFamily: 'intermedium',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),

              SizedBox(height: 20),
              pinCodeTestField(context),
              SizedBox(height: 25),
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
                      "Submit",
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

  Widget pinCodeTestField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        enableActiveFill: true,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),

        // 👇 Align boxes with spacing
        mainAxisAlignment: MainAxisAlignment.center,

        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 50,

          // 👇 Adds ~6px horizontal spacing between each box
          fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 3),

          // Borders
          inactiveColor: Colors.grey, // border when idle
          inactiveFillColor: Colors.white,

          selectedColor: const Color(0xFF1C355E), // border when selected
          selectedFillColor: Colors.white,

          activeColor: const Color(0xFF1C355E), // border when filled
          activeFillColor: Colors.white,

          borderWidth: 2,
        ),

        textStyle: const TextStyle(
          fontFamily: "playfairmedium", // your custom font
          fontWeight: FontWeight.w700, // bold weight for input
          fontSize: 20,
          color: Color(0xFF1C355E), // text color
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
