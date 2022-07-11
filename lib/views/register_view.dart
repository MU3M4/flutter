import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:flutter_progress/constants/routes.dart';
import 'package:flutter_progress/views/home_screen.dart';

import 'hidden_drawer.dart';

class RegisterView extends StatefulWidget {
  // final String firstName;
  // final String lastName;
  // final String gender;
  // final int phoneNumber;
  // final String email;
  // final String location;

  const RegisterView({
    Key? key,
    // required this.firstName,
    // required this.lastName,
    // required this.gender,
    // required this.phoneNumber,
    // required this.email,
    // required this.location
  }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cpassword = TextEditingController();
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  get documentSnapshot => null;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _cpassword.dispose();
    _fname.dispose();
    _lname.dispose();
    _gender.dispose();
    _phonenumber.dispose();
    _location.dispose();
    super.dispose();
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _fname.text = documentSnapshot['First Name'];
      _lname.text = documentSnapshot['Last Name'];
    }
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference _attaUsers =
        FirebaseFirestore.instance.collection('atta-users');
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Register'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder(
          stream: _attaUsers.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                          title: Text(documentSnapshot['First Name']),
                          subtitle: Text(documentSnapshot['Last Name']),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () => _update(documentSnapshot),
                                    icon: const Icon(Icons.edit)),
                              ],
                            ),
                          )),
                    );
                  });
            }
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _fname,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your first name';
                            }

                            return null;
                          },
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.person_add_alt_1_outlined),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            focusedBorder: const OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _lname,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your last name';
                            }

                            return null;
                          },
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.person_add_alt_1_outlined),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            focusedBorder: const OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _location,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your location';
                            }

                            return null;
                          },
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_city),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            hintText: 'Location',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            focusedBorder: const OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _gender,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please input your identity';
                            }

                            return null;
                          },
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.perm_identity_outlined),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            hintText: 'Gender',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            focusedBorder: const OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _phonenumber,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your phone number';
                            }
                            if (value.length < 10) {
                              return 'please enter a valid phone number';
                            }
                            return null;
                          },
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone_android),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            focusedBorder: const OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter email address';
                            }
                            //regular expression validates the format of the email address
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return 'please enter a valid email address';
                            }
                            return null;
                          },
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            hintText: 'Email Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            focusedBorder: const OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          obscureText: _isObscure,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _cpassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please confirm your password';
                            }
                            if (_password.text != _cpassword.text) {
                              return 'passwords do not match';
                            }
                            return null;
                          },
                          obscureText: _isObscure,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            hintText: ' Confirm Password',
                            prefixIcon: const Icon(Icons.lock),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final String firstName = _fname.text;
                          final String lastName = _lname.text;
                          await _attaUsers.doc(documentSnapshot!.id).update(
                              {"First Name": firstName, "Last Name": lastName});
                          _fname.text = '';
                          _lname.text = '';
                          final email = _email.text.trim();
                          final password = _password.text.trim();

                          try {
                            final userCredential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password);
                           // User updateUser = FirebaseAuth.instance.currentUser;
                            devtools.log(userCredential.toString());
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('weak password');
                            } else if (e.code == 'email-already-in-use') {
                              print('email is already in use');
                            } else {
                              print(e.code);
                            }
                            // FirebaseAuth.userCredential.reload();
                            // Navigator.push(context, MaterialPageRoute(builder: ((context)=> const HiddenDrawer())));
                          }
                          if (_formKey.currentState!.validate()) {
                            //                   ScaffoldMessenger.of(context).showSnackBar(
                            // const SnackBar(content: Text('Processing Data')),
                            // CreateUser();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const HiddenDrawer()),
                              ),
                            );
                          } else {
                            print('unsuccessful');
                          }

                          // addUserDetails(
                          //     firstName: firstName.text.trim(),
                          //     location: location.text.trim(),
                          //     email: eMail.text.trim(),
                          //     lastName: lastName.text.trim(),
                          //     phoneNumber: int.parse(
                          //       phoneNumber.text.trim(),
                          //     )

                          // _lname.text.trim(),
                          // _location.text.trim(),
                          // _email.text.trim(),
                          // // use int parse to help in storing the int value in the db
                          // int.parse(_phonenumber.text.trim()),

                          // );
                        },
                        child: const Text("Sign Up"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        //Padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              loginRoute, (route) => false);
                        },
                        child: const Text(' Already Registered? Login in Here'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
