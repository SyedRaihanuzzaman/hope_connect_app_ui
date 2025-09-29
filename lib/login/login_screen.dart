import 'package:flutter/material.dart';
import 'package:hope_connect_app_ui/login/login_screen2.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF4EB),
        body: SingleChildScrollView(
          // ensures no overflow on small screens
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Top section with logo & curve (0.35 height as before)
              SizedBox(
                height: screenHeight * 0.35, // always 35% of screen height
                width: double.infinity,
                child: ClipPath(
                  clipper: UShapeClipper(),
                  child: Container(
                    color: const Color(0xFF1C355E),
                    child: Center(
                      child: LayoutBuilder(
                        // makes child flexible to available height
                        builder: (context, constraints) {
                          return Image.asset(
                            "images/logoimage.jpg",
                            height:
                                constraints.maxHeight *
                                0.5, // 50% of header height
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40), // small gap after curve
              // 🔹 Text and buttons start here
              Text(
                "Welcome To",
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontFamily: 'playfairbold',
                  fontSize: 40,
                ),
              ),
              Text(
                "NHA Mobile Connect App",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'playfairmedium',
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: 375, // full width
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},

                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFFFFDDAB,
                    ), // background color
                    foregroundColor: Colors.black,
                    // text color
                    side: const BorderSide(
                      color: Color(0xFFE8B85C), // outline color
                      width: 1.5,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ), // rounded corners
                    ),
                  ),

                  child: Text(
                    "Skip Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'playfairmedium',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),
              SizedBox(
                width: 375, // full width
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen2(),
                      ),
                    );
                  },

                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFFE8B85C,
                    ), // background color
                    foregroundColor: Colors.black,

                    // text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ), // rounded corners
                    ),
                  ),

                  child: Text(
                    "Log In",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'playfairmedium',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              TextButton(
                onPressed: () {},

                child: Text(
                  " Sign up with email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'playfairmedium',
                    fontSize: 16,
                    color: Color(0xFF3B2E2A),
                  ),
                ),
              ),

              SizedBox(height: 20),

              TextButton(
                onPressed: () {},

                child: Text(
                  " Or continue with",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'playfairmedium',
                    fontSize: 16,
                    color: Color(0xFF6C6C6C),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20), // space between buttons
                  // Google button
                  Card(
                    color: const Color(0xFFECECEC),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Image.asset(
                        "images/google1.png", // your Google logo asset
                        height: 18.75,
                        width: 18.75,
                      ),
                      onPressed: () {
                        // TODO: handle Google login
                      },
                    ),
                  ),

                  SizedBox(width: 20),

                  Card(
                    color: const Color(0xFFECECEC),
                    elevation: 4, // shadow effect
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.apple,
                        size: 22,

                        color: Colors.black,
                      ),
                      onPressed: () {
                        // TODO: handle Apple login
                      },
                    ),
                  ),
                ],
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
