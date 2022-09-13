import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/auth/auth.dart';
import 'package:flutter_progress/views/phone_verification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_place/google_place.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pinput/pinput.dart';

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
  late String cpass, phone, email, pass, name, key;

  // final TextEditingController _email = TextEditingController();
  // final TextEditingController _pass = TextEditingController();
  // final TextEditingController _name = TextEditingController();
  // final TextEditingController _cpass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final fb = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('Attausers');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      tileColor: Colors.deepOrange,
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                          'lib/assets/images/google.png',
                        ),
                      ),
                      title: const Text('Sign up with Google'),
                      onTap: () {
                        AuthEnt().signInWithGoogle();
                      }),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.deepOrange,
                    leading: const Icon(Icons.phone),
                    title: const Text('Register With Phone Number'),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PhoneAuth()),
                          (route) => false);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (val) {
                      name = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(val)) {
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
                    onChanged: (val) {
                      email = val;
                    },

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (val) {
                      phone = val;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                      labelText: 'Enter your phone number',
                      labelStyle: TextStyle(color: Colors.deepOrange),
                      icon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (val) {
                      pass = val;
                    },
                    obscureText: true,
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

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (val) {
                      cpass = val;
                    },
                    obscureText: true,
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

                ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () async {
                      if (email.isEmpty ||
                          name.isEmpty ||
                          pass.isEmpty ||
                          cpass.isEmpty ||
                          phone.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please fill in the blank fields');
                        return;
                      }
                      if (pass.length < 6) {
                        Fluttertoast.showToast(
                            msg:
                                'password is too short, add six to more characters');
                        return;
                      }
                      if (pass != cpass) {
                        Fluttertoast.showToast(msg: 'Passwords do not match');
                        return;
                      }
                      ProgressDialog progressDialog = ProgressDialog(
                        context,
                        title: const Text('Signing up'),
                        message: const Text('Please wait'),
                      );
                      progressDialog.show();

                      try {
                        UserCredential userCredential =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: pass);
                        if (userCredential.user != null) {
                          User user = FirebaseAuth.instance.currentUser!;
                          ref.child(user.uid).set({
                            'fullName': name,
                            'email': email,
                            'phone': phone,
                          });
                      
                          Fluttertoast.showToast(msg: 'Success');
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            homeRoute,
                            (route) => false,
                          );
                        } else {
                          Fluttertoast.showToast(msg: 'Failed');
                        }
                        progressDialog.dismiss();
                      } on FirebaseAuthException catch (e) {
                        progressDialog.dismiss();
                        if (e.code == 'email-already-in-use') {
                          Fluttertoast.showToast(
                              msg: 'email is already in use');
                        } else if (e.code == 'weak password') {
                          Fluttertoast.showToast(msg: 'The password is weak');
                        }
                      } catch (e) {
                        progressDialog.dismiss();
                        Fluttertoast.showToast(msg: 'Something went wrong');
                      }
                    }),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: const Text('Already have an account? click here'),
                ),
              ],
            ),
          ),
        ));
  }
}
