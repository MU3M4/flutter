import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/Signup.dart';

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

  void buildFuture() {
    // FutureBuilder(
    //     future: Firebase.initializeApp(
    //       options: DefaultFirebaseOptions.currentPlatform,
    //     ),
    //     builder: (context, snapshot) {
    //       switch (snapshot.connectionState) {
    //         case ConnectionState.none:
    //           //
    //           break;
    //         case ConnectionState.waiting:
    //           //
    //           break;
    //         case ConnectionState.active:
    //           //
    //           break;
    //         case ConnectionState.done:
    //           //
    //           break;
    //       }
    //     }
    //     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Mobile Number'),
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.orange,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
      ),
      // ignore: dead_code
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter phone';
                      }

                      if (value.length < 10) {
                        return 'please enter a valid phone number';
                      }
                      return null;
                    },
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.orange),
                      ),
                      hintText: ('Phone Number'),
                    ),
                    textInputAction: TextInputAction.next,
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
                      decoration:
                          const InputDecoration(hintText: "Enter the Code"),
                      textInputAction: TextInputAction.done,
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
                        verifyPhoneNumber();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: Text(otpCodeVisible ? "Next" : "verify"),
                  ),
                ]),
          ),
        ),
      ),
    );
    //  return Column(mainAxisAlignment: MainAxisAlignment.center,
  }
// Future<ConfirmationResult> signInWithPhoneNumber(
//   String phoneNumber, [
//   RecaptchaVerifier? verifier,
// ]) async {
//   assert(phoneNumber.isNotEmpty);

//   verifier ??= RecaptchaVerifier();
//   return ConfirmationResult._(
//     this,
//     await _delegate.signInWithPhoneNumber(phoneNumber, verifier.delegate),
//   );
// }
  void verifyPhoneNumber() {
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

  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIDReceived, smsCode: _otp.text);
    await auth.signInWithCredential(credential).then((value) {
      print("You are logged in Successfully");
    });
  }
}
