import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hope_connect_app_ui/login/login_screen.dart';

void main() {
  runApp(const MaterialApp(home: OnboardingScreen()));
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  int _currentIndex = 0;
  final int _totalPages = 3;
  final int _slideDurationSeconds = 5;

  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  Timer? _timer;

  final List<_OnboardData> _pages = [
    _OnboardData(
      imagePath: 'images/image1.jpg',
      title: 'We’ll Connect You to What You Need',
      description:
          'Easily search for food, shelter, medical, and other services near you—all in one place.',
    ),
    _OnboardData(
      imagePath: 'images/image2.jpg',
      title: 'Find the Right Help, Right Now',
      description:
          'Instantly find essential services when you need them most..',
    ),
    _OnboardData(
      imagePath: 'images/image3.png',
      title: 'Your Guide to Local Services, Simplified',
      description: 'Instantly find essential services when you need them most.',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _slideDurationSeconds),
    );

    _setupProgressAnimation();

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToNextPage();
      }
    });
  }

  void _setupProgressAnimation() {
    double start = _currentIndex / _totalPages;
    double end = (_currentIndex + 1) / _totalPages;

    _progressAnimation =
        Tween<double>(begin: start, end: end).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  void _goToNextPage() {
    if (_currentIndex < _totalPages - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _animationController.reset();
    _setupProgressAnimation();
    _animationController.forward();
  }

  void _onPageChanged(int index) {
    _currentIndex = index;
    _animationController.reset();
    _setupProgressAnimation();
    _animationController.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildUShapedImageWithProgress(String imagePath) {
    return Stack(
      children: [
        ClipPath(
          clipper: UShapeClipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: LinearProgressIndicator(
            value: _progressAnimation.value,
            backgroundColor: Colors.white.withOpacity(0.4),
            color: const Color(0xFFE8B85C),
            minHeight: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_totalPages, (index) {
        bool isActive = index == _currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: isActive ? 20 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFE8B85C) : Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = _pages[_currentIndex];
    final screenHeight = MediaQuery.of(context).size.height;

    bool isLastPage = _currentIndex == _totalPages - 1;

    return Scaffold(
      //  Whole screen background color
      backgroundColor: const Color(0xFFFAF4EB),
      body: SafeArea(
        child: Column(
          children: [
            // Top image part ~60% height
            SizedBox(
              height: screenHeight * 0.6,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return _buildUShapedImageWithProgress(
                    _pages[index].imagePath,
                  );
                },
              ),
            ),

            // Bottom part fills remaining space
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title, description, dots
                    Column(
                      children: [
                        Text(
                          currentPage.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          currentPage.description,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'playfairregular',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        _buildProgressDots(),
                      ],
                    ),

                    // Continue or Get Started button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!isLastPage) {
                            _goToNextPage();
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE8B85C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          isLastPage ? 'Get Started' : 'Continue',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardData {
  final String imagePath;
  final String title;
  final String description;

  _OnboardData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class UShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveDepth = 80; // how deep the curve dips

    Path path = Path();

    // Start from top-left
    path.lineTo(0, size.height - curveDepth);

    // One simple smooth dip from left → middle → right
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height + curveDepth, // control point (dip in middle)
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
