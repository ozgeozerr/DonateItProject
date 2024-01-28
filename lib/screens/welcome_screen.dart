// lib/screens/welcome_screen.dart
import 'package:flutter/material.dart';
import 'tutorial_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Initialize opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation when the screen is first displayed
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1D5E7), // Light Purple Background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _opacityAnimation,
              child: Text(
                'Welcome to DonateIt',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Text(
                'To continue with the tutorial,',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Text(
                'Get Started!',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            FadeTransition(
              opacity: _opacityAnimation,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the TutorialScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TutorialScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the animation controller to free up resources
    _controller.dispose();
    super.dispose();
  }
}
