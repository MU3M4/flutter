import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_progress/views/car_type.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // String _lname, _fname;
  late final TextEditingController _fname;
  late final TextEditingController _lname;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _cpassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void initState() {
    _fname = TextEditingController();
    _lname = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _cpassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fname.dispose();
    _lname.dispose();
    _email.dispose();
    _password.dispose();
    _cpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //first name textformfield
                TextFormField(
                  controller: _fname,
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

                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 25,
                ),
                //last name textfield
                TextFormField(
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
                    prefixIcon: const Icon(Icons.account_circle),
                    hintText: 'Last Name',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 25,
                ),
                // email textformfield
                TextFormField(
                  controller: _email,
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
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 25,
                ),
                //password field
                TextFormField(
                  controller: _password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your password';
                    }
                    return null;
                  },
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: _isObscure,
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
                ),
                const SizedBox(
                  height: 25,
                ),
                //confirm password field
                TextFormField(
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
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: _isObscure,
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
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //                   ScaffoldMessenger.of(context).showSnackBar(
                        // const SnackBar(content: Text('Processing Data')),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const CarType()),
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
}
