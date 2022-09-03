import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/constants/routes.dart';
import 'package:flutter_progress/views/phone_verification.dart';
import 'auth/auth.dart';

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
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
         
          ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical:3),
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                  'lib/assets/images/google.png',
                ),
              ),
              title: const Text('Sign in with Google'),
              onTap: () {
                AuthEnt().signInWithGoogle();
              }),

          ListTile(
            dense: true,
            visualDensity:const  VisualDensity(vertical:3),
            leading: const Icon(Icons.phone),
            title: const Text('Continue With Phone Number'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const PhoneAuth()),
                  (route) => false);
            },
          ),

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
          
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text("Not Registered? Register Here!"),
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
