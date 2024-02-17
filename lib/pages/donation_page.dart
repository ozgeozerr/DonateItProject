import 'package:flutter/material.dart';
import 'next_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:donate_it/pages/profile_page.dart';
import 'package:donate_it/pages/donation_process_page.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.deepPurple.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(

          ),
        ),
        toolbarHeight: 40,
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
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple.shade600,
                            width: 4.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepPurple.shade100,
                        ),
                        width: MediaQuery.of(context).size.width - 40.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '              ~ IMPORTANT NOTICE ~\n'
                                  '\n1. Decide what type of clothing you would like to donate and choose from the category!\n'
                                  '\n2. Take a photo of your piece of clothing.\n'
                                  '\n3. Agree to the terms and conditions.\n'
                                  '\n4. Wait for confirmation.\n'
                                  '\n5. Once confirmed, you will get a notification.'
                                  ' alongside a cargo code so that you can send your items!\n'
                                  '\n6. Changed your mind? You can cancel the process at any time.\n'
                                  '\n7. Once items are received by cargo, do not forget to change your coupons!',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                child: Center(
                  child: SizedBox(
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DonationProcessPage(),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          'Donate',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue.shade200,
        color: Colors.deepPurple.shade600,
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
          // navigation here!!
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextPage()));
              break;
            case 1:
            // don't navigate to donation if we're already on it!!
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
