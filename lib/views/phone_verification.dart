import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/login_view.dart';
import 'package:flutter_progress/views/otp.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'auth/auth.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  String? _phone;
  late final TextEditingController _otp;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDReceived = "";
  bool otpCodeVisible = false;
  TextEditingController phoneController = TextEditingController();
  AuthEnt authClass = AuthEnt();
  String verificationIdFinal = "";
  String smsCode = "";
  String otpPin = '';

  @override
  void initState() {
    _otp = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    _otp.dispose();
    super.dispose();
  }

  int start = 30;
  bool wait = false;
  String buttonName = 'Send';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Authentication'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: const Center(
              child: Text(
                'Phone Authentication',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
            child: IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'KE',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            // child: TextFormField(
            //   style: const TextStyle(
            //     fontSize: 22.0,
            //   ),
            //   onSaved: (value) => _phone = value,
            //   decoration: const InputDecoration(
            //     hintText: 'Phone Number',
            //     prefix: Padding(
            //       padding: EdgeInsets.all(4),
            //       child: Text('+254'),
            //     ),
            //   ),
            //     maxLength: 9,
            //     keyboardType: TextInputType.number,
            //     controller: phoneController,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) =>
                        OtpPage(phone: phoneController.text))));
              },
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const LoginView())));
            },
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        timer.cancel();
        wait = false;
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 45,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white,
        borderColor: Colors.white,
      ),
      style: const TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: $pin");
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  void setData(verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}
