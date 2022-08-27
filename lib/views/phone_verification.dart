import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress/views/login_view.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'auth/auth.dart';

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
  TextEditingController phoneController = TextEditingController();
  AuthEnt authClass = AuthEnt();
  String verificationIdFinal = "";
  String smsCode = "";

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

  int start = 30;
  bool wait = false;
  String buttonName = 'Send';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/splash.jpg',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'REGISTER',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Enter your phone number, we will send an OTP code to verify',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffeeeeee),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black.withOpacity(0.13))),
                child: Stack(
                  children: [
                    InternationalPhoneNumberInput(
                      onInputChanged: (value) {},
                      cursorColor: Colors.black,
                      formatInput: false,
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      inputDecoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(bottom: 15, left: 0),
                        border: InputBorder.none,
                        hintText: 'Input Phone Number',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      top: 8,
                      child: Container(
                        height: 40,
                        width: 1,
                        color: Colors.white.withOpacity(0.13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                  const Text(
                    'Enter the 6-Digit OTP',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     SizedBox(
            //
            //       height: 68,
            //       width: 64,
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length ==1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         onSaved: (pin1){},
            //         style: Theme.of(context).textTheme.headline6,
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       height: 68,
            //       width: 64,
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length ==1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         onSaved: (pin2){},
            //         style: Theme.of(context).textTheme.headline6,
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       height: 68,
            //       width: 64,
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length ==1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         onSaved: (pin3){},
            //         style: Theme.of(context).textTheme.headline6,
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       height: 68,
            //       width: 64,
            //       child: TextFormField(
            //         onChanged: (value){
            //           if (value.length ==1){
            //             FocusScope.of(context).nextFocus();
            //           }
            //         },
            //         onSaved: (pin4){},
            //         style: Theme.of(context).textTheme.headline6,
            //         keyboardType: TextInputType.number,
            //         textAlign: TextAlign.center,
            //         inputFormatters: [
            //           LengthLimitingTextInputFormatter(1),
            //           FilteringTextInputFormatter.digitsOnly
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            otpField(),
            const SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: "Send OTP again in",
                  style: TextStyle(fontSize: 17, color: Colors.deepOrange),
                ),
                TextSpan(
                  text: "00:$start",
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                ),
                const TextSpan(
                  text: 'sec',
                  style: TextStyle(fontSize: 17, color: Colors.deepOrange),
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: wait
                      ? null
                      : () async{
                          startTimer();
                          setState(() {
                            start = 30;
                            wait = true;
                            buttonName = "Resend";
                          });
                          await authClass.verifyPhoneNumber("$InternationalPhoneNumberInput.text", context, setData);
                        },
                  child: Text(
                    buttonName,
                    style: TextStyle(color: wait ? Colors.grey : Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    authClass.signInWithPhoneNumber(verificationIdFinal, smsCode, context);

                  },
                  child: const Text('Lets Go'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an Account?',
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const LoginView()));
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
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
  void setData(verificationId){
setState(() {
  verificationIdFinal = verificationId;
});
startTimer();
  }
}
