import 'package:flutter/material.dart';

import '../services/donation_service.dart';


class DonationHistory extends StatelessWidget {
  final DonationService donationService = DonationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation History'),
      ),
      body: StreamBuilder<List<Donation>>(
        stream: donationService.getDonations(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final donations = snapshot.data!;
          return ListView.builder(
            itemCount: donations.length,
            itemBuilder: (context, index) {
              final donation = donations[index];
              return ListTile(
                title: Text(donation.description),
                subtitle: Text('Date: ${donation.timestamp}'),
              );
            },
          );
        },
      ),
    );
  }
}
