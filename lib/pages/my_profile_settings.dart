import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyProfileSettings extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _handleChangePassword(BuildContext context, String currentPassword, String newPassword) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {

        AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: currentPassword);
        await user.reauthenticateWithCredential(credential);


        await user.updatePassword(newPassword);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password changed successfully')),
        );
      }
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to change password: $e')),
      );
    }
  }

  void _handleDeleteAccount(BuildContext context) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {

        await user.delete();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account deleted successfully')),
        );
      }
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete account: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentPassword = '';
    String newPassword = '';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Settings',
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFD9C9FF), Color(0xFFB2E2E2)],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) => currentPassword = value,
                    decoration: InputDecoration(
                      labelText: 'Current Password',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) => newPassword = value,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _handleChangePassword(context, currentPassword, newPassword),
                    child: Text('Change Password'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Delete Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _handleDeleteAccount(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Delete My Account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
