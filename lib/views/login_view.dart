import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/constants/routes.dart';
import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body:   Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //logo
                Expanded(
                  child: Image.asset(
                    'lib/assets/images/splash.jpg',
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'HELLO AGAIN!',
                  style: TextStyle(fontSize: 52),
                ),
                const SizedBox(height: 10),
                const Text('Welcome back, you\'ve been missed!',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 50),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _email,
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
                        labelText: 'email',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.orange),
                        ),
                        hintText: 'Password',
                        labelText: 'Password',
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final User? user = FirebaseAuth.instance.currentUser;
                    final uid = user?.uid;
                    final email = _email.text.trim();
                    final password = _password.text.trim();
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _email.text.trim(),
                        password: _password.text.trim(),
                      );
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        homeRoute,
                        (route) => false,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        await showErrorDialog(
                          context,
                          'user not found',
                        );
                      } else if (e.code == 'wrong-password') {
                        await showErrorDialog(
                          context,
                          'Wrong credentials',
                        );
                      } else {
                        await showErrorDialog(
                          context,
                          'Error: ${e.code}',
                        );
                      }
                    }
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      registerRoute,
                      (route) => false,
                    );
                  },
                  child: const Text("Not Registered? Register Here!"),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      forgotRoute,
                      (route) => false,
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),



    );
  }

  Future<void> showErrorDialog(
    BuildContext context,
    String text,
  ) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('An error occurred'),
            content: Text(text),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
