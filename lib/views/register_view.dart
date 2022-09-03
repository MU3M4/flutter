import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/auth/auth.dart';
import 'package:flutter_progress/views/phone_verification.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/routes.dart';
import 'login_view.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  var selectedGender;
  List<String> gender = <String>['Male', 'Female', 'Non-binary'];
  //late String cpass, email, pass, name, key;

  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _name = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference reference =
      FirebaseFirestore.instance.collection('users');
  final fb = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    _name.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
          centerTitle: true,
        ),
        body: 
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                      'lib/assets/images/google.png',
                    ),
                  ),
                  title: const Text('Sign up with Google'),
                  onTap: () {
                    AuthEnt().signInWithGoogle();
                  }),
             
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Register With Phone Number'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const PhoneAuth()),
                      (route) => false);
                },
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _name,
                  validator: (val) {
                    if (val!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(val)) {
                      return "Enter Correct Name";
                    } else {
                      return null;
                    }
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
              const SizedBox(
                height: 10,
              ),
              // DropdownButton<String>(
              //   icon: const Icon(Icons.keyboard_arrow_down_rounded),
              //   items: gender
              //       .map(
              //         (String value) => DropdownMenuItem(
              //           value: value,
              //           child: Text(value),
              //         ),
              //       )
              //       .toList(),
              //   onChanged: (selectedGenderType) {
              //     setState(() {
              //       selectedGender = selectedGenderType;
              //     });
              //   },
              //   value: selectedGender,
              //   isExpanded: false,
              //   hint: const Text('Gender'),
              // ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _email,
                  // regular expression validates the format of the email address
                  validator: (val) {
                    if (val!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            .hasMatch(val)) {
                      return "Enter a valid email address";
                    } else {
                      return null;
                    }
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
              ),
              const SizedBox(height: 10),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _pass,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      Fluttertoast.showToast(
                        msg: "please enter your password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: ' password',
                    labelText: 'Enter Your  password',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                    ),
                    icon: Icon(Icons.lock),
                  ),
                ),
              ),
        
              const SizedBox(height: 10),
        
              ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () async {
                   
                      
                      UserCredential result =
                          await _auth.createUserWithEmailAndPassword(
                              email: _email.text.trim(),
                              password: _pass.text.trim());
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        homeRoute,
                        (route) => false,
                      );
                    
                  }),
        
              TextButton(
                onPressed: () {
                 
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginView()));
                },
                child: const Text('Already have an account? click here'),
              ),
            ],
          ),
        ));
  }
}
