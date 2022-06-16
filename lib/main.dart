import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/constants/routes.dart';
import 'package:flutter_progress/views/forgot_password.dart';
import 'package:flutter_progress/views/home_screen.dart';
import 'dart:developer' as devtools show log;
import 'package:flutter_progress/views/login_view.dart';
import 'package:flutter_progress/views/map_screen.dart';
import 'package:flutter_progress/views/phone_verification.dart';
import 'package:flutter_progress/views/register_view.dart';
import 'package:flutter_progress/views/splash_screen.dart';
import 'package:flutter_progress/views/verify_email_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'Flutter Google Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const Splash(),
      // initialRoute: phoneRoute: (content) => const PhoneAuth(),};
      routes: {
        phoneRoute: (context) => const PhoneAuth(),
        loginRoute: (context) => const LoginView(),
        mapRoute: (context) => const MapScreen(),
        registerRoute: (context) => const RegisterView(),
        homeRoute:(context) => const HomeScreen(),
        forgotRoute:(context) => const ForgotPassword(),
        
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                devtools.log('Email is verified');
              } else {
                return const VerifyEmailView();
              }
            }
            //  else {
            //    return const LoginView();
            // }
            return const MapScreen();

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
