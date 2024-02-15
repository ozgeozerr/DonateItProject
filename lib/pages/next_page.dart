import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:donate_it/pages/help_center.dart';
import 'package:donate_it/pages/meet_sponsors.dart';
import 'package:donate_it/pages/organization.dart';
import 'package:donate_it/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:donate_it/pages/faq.dart';

import 'donation_page.dart';


class NextPage extends StatelessWidget {
  final List<Map<String, dynamic>> boxData = [
    {
      'image': 'lib/images/faq.png',
      'text': 'FAQ',
      'details': '',
    },
    {
      'image': 'lib/images/organization.png',
      'text': 'Organization',
      'details': '',
    },
    {
      'image': 'lib/images/sponsor.png',
      'text': 'Our Sponsors',
      'details': '',
    },
    {
      'image': 'lib/images/customer-service.png',
      'text': 'Need Help?',
      'details': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BACKGROUND OF WHOLE PAGE
      backgroundColor: Colors.blue.shade800,

      //NAVIGATION BAR
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
      ),



      appBar: AppBar(
        title: Text(
          '           Donate It',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor:
        Colors.deepPurple.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
                5),
          ),
        ),
        toolbarHeight: 40,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade600,
              Colors.blue.shade200
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple.shade600
                      .withOpacity(0.5),
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(
                    50),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 135.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration:
                  Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: [
                  'lib/images/slide1.jpg',
                  'lib/images/slide2.jpg',
                  'lib/images/slide3.jpg',
                ].map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width:
                        MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                            horizontal:
                            1.0), // FOR SCALING THE SLIDING PICTURES
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 1 ),
            SizedBox(height: 370,
              child: Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(boxData.length, (index) {
                    return GestureDetector(
                      onTap: () {

                        switch (index) {
                        // FAQ
                          case 0:
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Faq(),
                              ),
                            );
                            break;
                        // ORGANIZATION
                          case 1:
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Organization(),
                              ),
                            );
                            break;
                        // SPONSORS
                          case 2:
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MeetSponsors(),
                              ),
                            );
                            break;
                        // GETHELP
                          case 3:
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HelpCenter(),
                              ),
                            );
                            break;
                          default:
                            break;
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple.shade400,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              boxData[index]['image'],
                              fit: BoxFit.cover,
                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                                height:
                                5),
                            Text(
                              boxData[index]['text'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

              SizedBox(height: 20),
            SizedBox(height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DonationPage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple
                      .shade600,
                  onPrimary: Colors
                      .white,
                  fixedSize: Size(
                      200,
                      50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30),
                  ),
                ),
                child: Text(
                  'Donate Now!',
                  style: TextStyle(
                    fontSize:
                    23,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

