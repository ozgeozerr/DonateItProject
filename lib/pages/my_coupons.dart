import 'package:flutter/material.dart';

class MyCoupons extends StatelessWidget {
  final List<String> coupons = [
    '20% off at LC Waikiki',
    'Free scarf at Koton',
    '30% off at LC Waikiki',
    '250 TL discount out of 1000 TL at D&R',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'My Coupons',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Color(0xFFD9C9FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5),
          ),
        ),
        toolbarHeight: 45,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD9C9FF),
              Color(0xFFB2E2E2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: coupons.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    coupons[index],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
