import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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
  // late String cpass, email, pass, name, key;
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _name = TextEditingController();
  final _cpass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final fb = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _pass.text.trim(),
      );
      addUserDetails(
        _name.text.trim(),
        _email.text.trim(),
      );
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
                      if (val == null || val.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "please enter your full name",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.redAccent,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
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
                TextFormField(
                  controller: _email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      Fluttertoast.showToast(
                        msg: "please enter email address",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                    //regular expression validates the format of the email address
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value!)) {
                      Fluttertoast.showToast(
                        msg: "please enter a valid email address",
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
                ElevatedButton(
                  onPressed: ()  {
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
            )),
      ),
    );
  }
}
