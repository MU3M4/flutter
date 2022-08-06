import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/main.dart';

import '../constants/routes.dart';
import 'login_view.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  late String email, pass, name, key;
  final fb = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child("users");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'lib/assets/images/splash.jpg',
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (val) {
                  name = val;
                },
                decoration: const InputDecoration(
                  hintText: ' Full Name',
                  labelText: 'Enter Your  Name',
                  labelStyle: TextStyle(
                    color: Colors.deepOrange,
                  ),
                  icon: Icon(Icons.person),
                ),
              ),
            ),
            TextFormField(
              onChanged: (val) {
                email = val;
              },
              decoration: const InputDecoration(
                hintText: ' Email Address',
                labelText: 'Enter Your  email',
                labelStyle: TextStyle(
                  color: Colors.deepOrange,
                ),
                icon: Icon(Icons.email),
              ),
            ),
            TextFormField(
              obscureText: true,
              onChanged: (val) {
                pass = val;
              },
              decoration: const InputDecoration(
                hintText: ' password',
                labelText: 'Enter Your  password',
                labelStyle: TextStyle(
                  color: Colors.deepOrange,
                ),
                icon: Icon(Icons.key),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                UserCredential result = await _auth
                    .createUserWithEmailAndPassword(email: email, password: pass);
                Navigator.of(context).pushNamedAndRemoveUntil(
                  homeRoute,
                  (route) => false,
                );
                if (result != null) {
                  User user = FirebaseAuth.instance.currentUser!;
                  ref.child(user.uid).set({
                    "name": name,
                    "password": pass,
                    "email": email,
                  });
                }
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginView()));
                },
                child: const Text('Already have an account? click here'),),
          ],
        )),
      ),
    );
  }
}
