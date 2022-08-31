import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/phone_verification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  final _cpass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference reference = FirebaseFirestore.instance.collection('users');
  final fb = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void verifyEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    if (!(user!.emailVerified)) {
      user.sendEmailVerification();
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(phoneRoute, (route) => false);
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    _name.dispose();
    _cpass.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _pass.text.trim(),
      )
          .then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(value.user!.uid)
            .set({"email": value.user!.email, "name": value.user!.displayName});
      });
      addUserDetails(
        _name.text.trim(),
        _email.text.trim(),
      );
      Navigator.of(context)
          .pushNamedAndRemoveUntil(phoneRoute, (route) => false);
    }
  }

  Future addUserDetails(
    String fullName,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Full Name': fullName,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_pass.text.trim() == _cpass.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

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
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                const Text(
                  'HELLO THERE!',
                  style: TextStyle(fontSize: 52),
                ),
                const SizedBox(height: 10),
                const Text('Register Below With Your Details',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _name,
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
                const SizedBox(
                  height: 10,
                ),
                DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  items: gender
                      .map(
                        (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedGenderType) {
                    setState(() {
                      selectedGender = selectedGenderType;
                    });
                  },
                  value: selectedGender,
                  isExpanded: false,
                  hint: const Text('Gender'),
                ),
                const SizedBox(height: 10),
                TextFormField(
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
                const SizedBox(height: 10),

                TextFormField(
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
                    icon: Icon(Icons.key),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: _cpass,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "please confirm your password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.redAccent,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                      if (_cpass.text.trim() != _pass.text.trim()) {
                        Fluttertoast.showToast(
                          msg: "passwords do not match",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.orange,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'confirm password',
                      labelText: 're-enter your password',
                      prefixIcon: Icon(Icons.key),
                      labelStyle: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: GestureDetector(
                //     onTap: verifyEmail,
                //     child: Container(
                //       padding: const EdgeInsets.all(20),
                //       decoration: BoxDecoration(
                //         color: Colors.deepOrange,
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       child: const Center(
                //         child: Text(
                //           'Sign Up',
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 18),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: ()  async{
                    if(_formKey.currentState!.validate()){
                      String emailAddress = _email.text.trim();
                      String nameText = _name.text;
                      String genderType = selectedGender;

                      Map<String, String> dataToSend = {
                        "email": emailAddress,
                        "name": nameText,
                        "gender": genderType,
                      };
                        reference.add(dataToSend);
                    }
                    verifyEmail();
                    signUp();
                    addUserDetails(
                      _name.text.trim(),
                      _email.text.trim(),
                    );
                    // UserCredential result =
                    //     await _auth.createUserWithEmailAndPassword(
                    //         email: _email.text.trim(),
                    //         password: _pass.text.trim());
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      carRoute,
                      (route) => false,
                    );
                    // if (result != null) {
                    //   User user = FirebaseAuth.instance.currentUser!;
                    //   ref.child(user.uid).set({
                    //     "name": _name,
                    //     "password": _pass,
                    //     "email": _email,


                    }, child: const Text('Sign Up'),


                  //child: const Text('Sign Up'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final snackBar = SnackBar(
                          content: Text('Submitting Registration Form'));
                      _formKey.currentState!.save();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: const Text('Already have an account? click here'),
                ),
              ],
            )),
      ),
    );
  }
}
