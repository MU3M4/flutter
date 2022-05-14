import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  late final TextEditingController _phone;
  late final TextEditingController _otp;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDReceived = "";
  bool otpCodeVisible = false;

  @override
  void initState() {
    _phone = TextEditingController();
    _otp = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phone.dispose();
    _otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Mobile Number'),
      ),
    );
    // ignore: dead_code
    body:
    FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              //
              break;
            case ConnectionState.waiting:
              //
              break;
            case ConnectionState.active:
              //
              break;
            case ConnectionState.done:
              //
              break;
          }

          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: _phone,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: ('Phone Number'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: otpCodeVisible,
              child: TextField(
                controller: _otp,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Enter the Code"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (otpCodeVisible) {
                  verifyCode();
                } else {
                  verifyNumber();
                }
              },
              child: Text(otpCodeVisible ? "Next" : "verify"),
            ),
          ]);
        });
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: _phone.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth
              .signInWithCredential(credential)
              .then((value) => {print("You have logged in successfully")});
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIDReceived = verificationID;
          otpCodeVisible = true;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  void verifyCode() async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIDReceived, smsCode: _otp.text);
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in Successfully");
        });
  }
}
