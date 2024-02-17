import 'package:flutter/foundation.dart';

class Post {
  final String userId;
  final DateTime donationDate;
  final String imageURL;
  final String clothingCategory;
  final String cargoBrand;
  final String shippingCode;

  Post({
    required this.userId,
    required this.donationDate,
    required this.imageURL,
    required this.clothingCategory,
    required this.cargoBrand,
    required this.shippingCode,
  });


  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'donationDate': donationDate,
      'imageURL': imageURL,
      'clothingCategory': clothingCategory,
      'cargoBrand': cargoBrand,
      'shippingCode': shippingCode,
    };
  }
}
