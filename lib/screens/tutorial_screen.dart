// lib/screens/tutorial_screen.dart
import 'package:flutter/material.dart';
import 'package:donate_it/pages/login_page.dart'; // Import the login page

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Donate It gives people in need a second hope."),
            SizedBox(height: 10),
            Text("First, check the most needed clothing items."),
            SizedBox(height: 10),
            Text("Click on the 'Start Donating' button."),
            SizedBox(height: 10),
            Text("Enter the information of the item."),
            SizedBox(height: 10),
            Text("Wait for us to approve the safety of the item."),
            SizedBox(height: 10),
            Text("Enjoy your discount coupon!"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Continue to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
