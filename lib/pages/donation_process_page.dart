import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DonationProcessPage extends StatefulWidget {
  @override
  _DonationProcessPageState createState() => _DonationProcessPageState();
}

class _DonationProcessPageState extends State<DonationProcessPage> {
  String selectedClothingCategory = '';
  String selectedCargoBrand = '';
  String? imagePath;
  String? shippingCode;

  Future<void> _uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      try {
        final Reference ref = FirebaseStorage.instance
            .ref()
            .child('images')
            .child('donations')
            .child('image_${DateTime.now().millisecondsSinceEpoch}.jpg');
        await ref.putFile(File(image.path)); // Uploading the image file to Firebase Storage!!
        final String downloadURL = await ref.getDownloadURL(); // URL
        setState(() {
          imagePath = downloadURL; // URL AGAIN
        });
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  void _handleSubmit() {
    if (imagePath == null) {
      // Show error message if picture is not uploaded!!!
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload a picture of the clothing item.'),
        ),
      );
      return;
    }

    if (selectedClothingCategory.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a clothing category.'),
        ),
      );
      return;
    }

    if(selectedCargoBrand.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select your desired cargo company.'),
        ),
      );
      return;
    }

    final Random random = Random();
    shippingCode = 'SHIP${random.nextInt(10000)}'; // Assign generated shipping code

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thank you for your donation! Your shipping code is: $shippingCode'),
        duration: Duration(seconds: 10),
      ),
    );

    Navigator.pop(context, shippingCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Process',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',

          ),
        ),
        backgroundColor: Colors.deepPurple.shade600,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade600,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: selectedClothingCategory,
                hint: Text('Select Clothing Category'),
                onChanged: (value) {
                  setState(() {
                    selectedClothingCategory = value!;
                  });
                },
                items: <String>[
                  '',
                  'Shirt',
                  'Pants',
                  'Dress',
                  'Jacket',
                  'Sweater',
                  'Coat',
                  'Gloves',
                  'Hat',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value == '' ? 'Select Clothing Category' : value),
                  );
                }).toList(),
              ),
              SizedBox(height: 150),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text('Upload Clothing Picture'),
              ),
              SizedBox(height: 150),
              if (imagePath != null) Image.network(imagePath!),
              DropdownButtonFormField<String>(
                value: selectedCargoBrand,
                hint: Text('Select Cargo Company'),
                onChanged: (value) {
                  setState(() {
                    selectedCargoBrand = value!;
                  });
                },
                items: <String>[
                  '',
                  'Yurtiçi Kargo',
                  'MNG Kargo',
                  'Aras Kargo',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value == '' ? 'Select Cargo Company' : value),
                  );
                }).toList(),
              ),
              SizedBox(height: 150),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
