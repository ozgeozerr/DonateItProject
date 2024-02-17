import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../components/image_store.dart';

class DonationProcessPage extends StatefulWidget {
  @override
  _DonationProcessPageState createState() => _DonationProcessPageState();
}

class _DonationProcessPageState extends State<DonationProcessPage> {
  String selectedClothingCategory = '';
  String selectedCargoBrand = '';
  String? imagePath;
  String? shippingCode;

  final ImageStoreMethods _imageStoreMethods = ImageStoreMethods();

  Future<ImageSource?> _selectImageSource() async {
    return await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context, ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _uploadImage() async {
    final ImageSource? source = await _selectImageSource();
    if (source != null) {
      final picker = ImagePicker();
      final XFile? pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        try {
          final Uint8List file = await pickedImage.readAsBytes();
          String photoUrl = await _imageStoreMethods.imageToStorage(file);

          setState(() {
            imagePath = 'https://firebasestorage.googleapis.com/v0/b/donateitauth.appspot.com/o/ImageUploads%2Fphoto_2024-02-15_19-05-49.jpg?alt=media';
            ;
          });


        } catch (e) {
          print('Error uploading image: $e');
        }
      }
    }
  }

  void _handleSubmit() async {
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

    try {
      final Uint8List fileBytes = await _downloadImage(imagePath!);
      String uploadResult = await _imageStoreMethods.uploadPost(selectedClothingCategory, fileBytes);
      if (this.mounted) {
        if (uploadResult == 'success') {
          final Random random = Random();
          shippingCode = 'SHIP${random.nextInt(10000)}';

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Thank you for your donation! Your shipping code is: $shippingCode'),
              duration: Duration(seconds: 10),
            ),
          );

          Navigator.pop(context, shippingCode);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Upload failed: $uploadResult'),
            ),
          );
        }
      }
    } catch (err) {
      if (this.mounted) {
        print('Error uploading post: $err');
      }
    }


  }

  Future<Uint8List> _downloadImage(String url) async {
    final HttpClient httpClient = HttpClient();
    final Uri uri = Uri.parse(url);
    final HttpClientRequest request = await httpClient.getUrl(uri);
    final HttpClientResponse response = await request.close();
    final Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donation Process',
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text('Upload Clothing Picture'),
              ),
              SizedBox(height: 20),

              if (imagePath != null)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      child: Image.network(
                        imagePath!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
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
              SizedBox(height: 20),
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
