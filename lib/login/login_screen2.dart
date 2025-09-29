import 'package:flutter/material.dart';
import 'package:hope_connect_app_ui/forgetpassword/forgetpass_screen1.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  @override
  Widget build(BuildContext context) {
    //  final screenHeight = MediaQuery.of(context).size.height;
    bool _obscureText = false;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE8B85C).withOpacity(0.1),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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

              SizedBox(height: 65.6),
              TextButton(
                onPressed: () {},

                child: Text(
                  "Login Your Account",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
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
              SizedBox(height: 5),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    labelText: "Enter Your Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF1C355E)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 7),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: 'playfairmedium',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF6C6C6C),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    labelText: "Enter Your Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF1C355E)),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText =
                              !_obscureText; // toggle password visibility
                        });
                      },

                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetpassScreen1(),
                        ),
                      );
                    },

                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                        fontFamily: 'playfairmedium',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  width: double.infinity, // full width
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},

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
              SizedBox(height: 23),
              Text(
                "Or",
                style: TextStyle(
                  fontFamily: 'playfairregular',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // rounded corners
                      ),
                      side: BorderSide(
                        color: Color(0xFF0B054C80),
                        width: 3,
                      ), // border color
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.apple, color: Color(0xFF0B0B0A), size: 28),
                    label: Text(
                      "Continue with Apple",
                      style: TextStyle(
                        color: Color(0xFF3B2E2A),
                        fontFamily: 'playfairmedium',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // rounded corners
                      ),
                      side: BorderSide(
                        color: Color(0xFF0B054C80),
                        width: 3,
                      ), // border color
                    ),
                    onPressed: () {},
                    icon: Image.network(
                      "https://cdn.iconscout.com/icon/free/png-512/free-google-logo-icon-svg-download-png-93413.png?f=webp&w=512",
                      height: 24.8,
                      width: 24.95,
                    ),
                    label: Text(
                      "Continue with Google",
                      style: TextStyle(
                        color: Color(0xFF3B2E2A),
                        fontFamily: 'playfairmedium',
                        fontWeight: FontWeight.w500,
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
