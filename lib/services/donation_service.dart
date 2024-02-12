import 'package:cloud_firestore/cloud_firestore.dart';

class DonationService {
  final CollectionReference donationsCollection =
  FirebaseFirestore.instance.collection('donations');

  Future<void> addDonation(String description) async {
    try {
      await donationsCollection.add({
        'description': description,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error adding donation: $e');
    }
  }

  Stream<List<Donation>> getDonations() {
    return donationsCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Donation(
          id: doc.id,
          description: doc['description'],
          timestamp: (doc['timestamp'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }
}

class Donation {
  final String id;
  final String description;
  final DateTime timestamp;

  Donation({
    required this.id,
    required this.description,
    required this.timestamp,
  });
}

