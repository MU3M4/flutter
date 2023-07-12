

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  
  get context => null;

  @override
  // ignore: override_on_non_overriding_member
  void dispose() {
    _emailController.dispose();
    //super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
          showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password link sent successfully'),
            );
          }
          );
    
    } on FirebaseAuthException catch (e) {
      // print(e);
     showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your email',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                  prefixIcon: const Icon(Icons.mail),
                  hintText: 'Email Address',
                ),
              ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: passwordReset,
              color: Colors.deepOrange,
              child: const Text('Reset Password'),
            )
          ],
        ));
  }
}
