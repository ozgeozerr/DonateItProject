import 'package:flutter/material.dart';
import 'next_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:donate_it/pages/profile_page.dart';
import 'package:donate_it/pages/donation_page.dart';

class Organization extends StatefulWidget {
  @override
  _OrganizationState createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Our Organization',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.deepPurple.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          ),
        ),
        toolbarHeight: 50,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade600, Colors.blue.shade200],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple.shade600,
                            width: 6.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepPurple.shade100,
                        ),
                        width: MediaQuery.of(context).size.width - 35.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About Donate It Organization', // New text added here
                              style: TextStyle(
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10), // Adjust this size according to your preference
                            Text(
                              "At Donate It, we are driven by a profound commitment to making a positive difference in the lives of children in need. Our organization focuses on extending a helping hand to children facing poverty, adversity, and those affected by natural disasters such as earthquakes.",
                              style: TextStyle(
                                fontSize: 16.0,
                                // Adjust font size and other styles as needed
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Our Mission:",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "We are dedicated to creating a brighter future for children by providing essential support and resources to improve their lives. Through our initiatives, we strive to offer hope, opportunity, and stability to those who need it most.",
                              style: TextStyle(
                                fontSize: 16.0,
                                // Adjust font size and other styles as needed
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "What We Do:",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Helping Children in Poverty: We work tirelessly to alleviate the hardships faced by children living in impoverished conditions. From providing access to education and healthcare to ensuring basic needs are met, we aim to break the cycle of poverty and empower children to reach their full potential.",
                              style: TextStyle(
                                fontSize: 16.0,
                                // Adjust font size and other styles as needed
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Supporting Disaster-Affected Children: In the aftermath of natural disasters like earthquakes, we swiftly mobilize to provide immediate relief and long-term assistance to affected children and their families. Our goal is to restore stability, rebuild communities, and offer hope amidst devastation.",
                              style: TextStyle(
                                fontSize: 16.0,
                                // Adjust font size and other styles as needed
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Fostering a Better World: Beyond addressing immediate needs, we are committed to creating sustainable change that fosters a better world for all children. By advocating for children's rights, promoting equality, and nurturing inclusive communities, we envision a future where every child can thrive and succeed.",
                              style: TextStyle(
                                fontSize: 16.0,
                                // Adjust font size and other styles as needed
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Join Us:",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Together, we can make a meaningful impact and transform the lives of countless children. Whether through volunteering, donations, or spreading awareness, your support enables us to continue our vital mission of making the world a better place for children in need.",
                              style: TextStyle(
                                fontSize: 16.0,
                                // Adjust font size and other styles as needed
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "At Donate It, every act of kindness, no matter how small, has the power to change lives and create a brighter tomorrow for generations to come. Join us in our journey to uplift, empower, and inspire hope in the hearts of children worldwide.",
                              style: TextStyle(
                                fontSize: 16.0,
                                // Adjust font size and other styles as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue.shade200,
        color: Colors.deepPurple.shade600, // Set navigation bar color to match the gradient
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextPage()));
              break;
            case 1:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DonationPage()));
              break;
            case 2:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              break;
            default:
              break;
          }
        },
        index: _currentIndex,
      ),
    );
  }
}
