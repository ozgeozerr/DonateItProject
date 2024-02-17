import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donate_it/components/post_pic.dart';

import '../pages/donation_history.dart';

class ImageStoreMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> imageToStorage(Uint8List file) async {
    String id = const Uuid().v1();
    Reference ref =
    _storage.ref().child('posts').child(id);

    UploadTask uploadTask = ref.putData(
        file
    );
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }



  Future<String> uploadPost(String clothingCategory, Uint8List file) async {
    String res = 'Some Error Occurred';
    try {
      String photoUrl = await imageToStorage(file);
      String donationId = const Uuid().v1();
      Post post = Post(
        userId: donationId,
        donationDate: DateTime.now(),
        imageURL: photoUrl,
        clothingCategory: clothingCategory,
        cargoBrand: '',
        shippingCode: '',
      );
      await _firestore.collection('donations').doc(donationId).set(post.toJson());
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }



}