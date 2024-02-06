import 'package:donate_it/pages/help_center.dart';
import 'package:donate_it/pages/meet_sponsors.dart';
import 'package:donate_it/pages/organization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:donate_it/pages/faq.dart';

import 'start_donating_next.dart';

class NextPage extends StatelessWidget {
  final List<Map<String, dynamic>> boxData = [
    {
      'image': 'lib/images/faq.png',
      'text': '',
      'details': 'Details of Box 1',
    },
    {
      'image': 'lib/images/organization.png',
      'text': '',
      'details': '',
    },
    {
      'image': 'lib/images/sponsor.png',
      'text': '',
      'details': '',
    },
    {
      'image': 'lib/images/customer-service.png',
      'text': '',
      'details': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate It'),
      ),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 220.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: [
              'lib/images/help_children.jpg',
              'lib/images/logo_donate.jpeg',
              'lib/images/stock_donation_photo.jpg',
            ].map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 90.0),
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
          SizedBox(height: 25),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(boxData.length, (index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to a different scene when box is clicked
                  switch (index) {
                  // FAQ
                    case 0:
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Faq(),
                      ));
                      break;
                  // ORGANIZATION
                    case 1:
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Organization(),
                      ));
                      break;
                  // SPONSORS
                    case 2:
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MeetSponsors(),
                      ));
                      break;
                  // GETHELP
                    case 3:
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HelpCenter(),
                      ));
                      break;
                    default:
                      break;
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(boxData[index]['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      boxData[index]['text'],
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 15), // Add some spacing between the GridView and the button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StartDonatingNext(), // Replace StartDonatingNext with the appropriate class name
              ));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.purple, // Change the button color here
              onPrimary: Colors.white, // Change the text color here
              fixedSize: Size(300, 60), // Change the size of the button here (width, height)
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Change the shape of the button here
              ),
            ),
            child: Text(
              'Start Donating Now!',
              style: TextStyle(
                fontSize: 23, // Change the font size here
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Center(
        child: Text('FAQ Screen'),
      ),
    );
  }
}

class Organization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organization'),
      ),
      body: Center(
        child: Text('Organization Screen'),
      ),
    );
  }
}

class MeetSponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meet Sponsors'),
      ),
      body: Center(
        child: Text('Meet Sponsors Screen'),
      ),
    );
  }
}

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: Center(
        child: Text('Help Center Screen'),
      ),
    );
  }
}