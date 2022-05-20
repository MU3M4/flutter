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
                //first name textfield
                TextFormField(
                  controller: _fname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter name';
                    }
                    return null;
                  },
                 
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    //
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
                TextField(
                 controller: _lname,
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
                // email textfield
                TextField(
                  controller: _email,
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
                TextField(
                  controller: _password,
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
                TextField(
                  controller: _cpassword,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CarType())));
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
