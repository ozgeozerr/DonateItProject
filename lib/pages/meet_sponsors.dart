import 'package:flutter/material.dart';
import 'next_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:donate_it/pages/profile_page.dart';
import 'package:donate_it/pages/donation_page.dart';

class MeetSponsors extends StatefulWidget {
  @override
  _MeetSponsorsState createState() => _MeetSponsorsState();
}

class _MeetSponsorsState extends State<MeetSponsors> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meet Our Sponsors!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
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
        toolbarHeight: 60,
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
              SizedBox(height: 70),
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
                              '       ~ Shipping Companies ~\n'
                                  '\nYurtiçi Kargo, MNG Kargo, Aras Kargo\n'
                                  '\n        ~ Coupon Providers ~\n'
                                  '\nKoton, LCW, Migros, D&R\n',
                              style: TextStyle(
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold,
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
