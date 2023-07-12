import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/home_screen.dart';
import 'package:flutter_progress/views/login_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthEnt {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<String> getCurrentUID() async {
    return (await auth.currentUser!).uid;
  }

  //handle auth state
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginView();
          }
        });
  }

  //signInWithGoogle()
  signInWithGoogle() async {
    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    //Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //Once signed In, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

//signOut()
signOut() {
  FirebaseAuth.instance.signOut();
}
