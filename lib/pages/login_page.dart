import 'package:donate_it/services/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:donate_it/components/my_button.dart';
import 'package:donate_it/components/my_textfield.dart';
import 'package:donate_it/components/square_tile.dart';
import 'package:donate_it/pages/next_page.dart';
import 'package:donate_it/pages/register_page.dart';
import 'package:donate_it/pages/login_or_register_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Navigate to  next page here!!!
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NextPage()),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      // error message
      showErrorMessage(e.code);


      /**if (e.code == 'user-not-found' || e.code == 'invalid-email') {
          wrongEmailMessage();
          } else if (e.code == 'wrong-password') {
          wrongPasswordMessage();
          } else {
          print('Sign-in error: ${e.message}');
          }
          } catch (e) {
          print('Sign-in error: $e');
          }**/
    }
  }

    void showErrorMessage(String message) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurpleAccent,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }
    /**void wrongEmailMessage() {

        showDialog(
        context: context,
        builder: (context) => AlertDialog(
        title: Text('Incorrect Email!'),
        ),
        );
        }

        void wrongPasswordMessage() {

        showDialog(
        context: context,
        builder: (context) => AlertDialog(
        title: Text('Incorrect Password!'),
        ),
        );
        }**/

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade600, Colors.blue.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Icon(
                      Icons.login,
                      size: 100,
                      color: Colors.white,
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 25),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    MyButton(
                      text: "Sign In",
                      onTap: signUserIn,
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SquareTile(
                            onTap: () => GoogleAuth().signInWithGoogle(),
                            imagePath: 'lib/images/google.png'
                        ),

                        SizedBox(width: 5),

                        /**SquareTile(
                          onTap: () {},
                            imagePath: 'lib/images/apple.png'
                        ),**/
                      ],
                    ),
                    SizedBox(height: 45),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                         SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
