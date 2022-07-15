import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/car_type.dart';
import 'package:flutter_progress/views/login_view.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // String _lname, _fname;
  var fname = "";
  var lname = "";
  var email = "";
  var pwd = "";
  var cpwd = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          // UserImage(onFileChanged: (imageUrl) {
          //   setState(() {
          //     this.imageUrl = imageUrl;
          //   });
          // }),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //first name textformfield
                TextFormField(
                  //used to check on whether the textformfield is empty and return a message to the user.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter first name';
                    }
                    return null;
                  },

                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    //sets the icon giving the user a hint
                    prefixIcon: const Icon(Icons.account_circle),
                    hintText: 'First Name',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                  ),
                  onChanged: (value) {
                    fname = value;
                  },

                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 25,
                ),
                //last name textfield
                TextFormField(
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
                    prefixIcon: const Icon(Icons.account_circle),
                    hintText: 'Last Name',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                  ),
                  onChanged: (value) {
                    lname = value;
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 25,
                ),
                // email textformfield
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter email address';
                    }
                    //regular expression validates the format of the email address
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                    hintText: 'Email',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 25,
                ),
                //password field
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your password';
                    }
                    return null;
                  },
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Password',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                  ),
                  onChanged: (value) {
                    pwd = value;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                //confirm password field
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please confirm your password';
                      }
                      if (pwd != cpwd) {
                        return 'passwords do not match';
                      }
                      return null;
                    },
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Confirm Password',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.orange),
                      ),
                    ),
                    onChanged: (value) {
                      cpwd = value;
                    }),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Uploading Data')));
                        SignUp();
                        // users
                        //     .add({
                        //       "fname": fname,
                        //       "lname": lname,
                        //       "email": email,
                        //       "pwd": pwd
                        //     })
                        //     .then((value) => print("User is added"))
                        //     .catchError(
                        //         (error) => print("Failed to Add User: $error"));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const LoginView()),
                          ),
                        );
                      } else {
                        print('unsuccessful');
                      }
                    },
                    child: const Text('Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future SignUp() async {
    setState(() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pwd,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .add({"fname": fname, "lname": lname, "email": email, "pwd": pwd})
            .then((value) => print("User is added"))
            .catchError((error) => print("Failed to Add User: $error"));
      } on FirebaseAuthException catch (e) {
        _handleSignUpError(e);
        setState(() {});
      }
    });
  }

  void _handleSignUpError(FirebaseAuthException e) {
    String messageToDisplay;
    switch (e.code) {
      case 'email-already-in-use':
        messageToDisplay = 'This email is already in use';
        break;
      case 'invalid-email':
        messageToDisplay = 'This email you\'ve is invalid';
        break;
      case 'operation-not-allowed':
        messageToDisplay = 'This operation is not allowed';
        break;
      case 'weak-password':
        messageToDisplay = 'The password you\'ve entered is weak';
        break;
      default:
        messageToDisplay = 'An unknown error occured';
        break;
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Sign Up Failed'),
              content: Text(
                messageToDisplay,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"))
              ],
            ));
  }
}
