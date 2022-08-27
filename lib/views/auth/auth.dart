import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/constants/routes.dart';
import 'package:flutter_progress/views/car_type.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthEnt {
  final FirebaseAuth auth = FirebaseAuth.instance;
 Future<void> verifyPhoneNumber(String phoneNumber, BuildContext context, Function setData)async{
   PhoneVerificationCompleted verificationCompleted =(PhoneAuthCredential phoneAuthCredential) async{
   showSnackBar(context, 'Verification completed');
   };
   PhoneVerificationFailed verificationFailed = (FirebaseAuthException exception){
     showSnackBar(context, exception.toString());
   };
   PhoneCodeSent codeSent = (String verificationID, [int? forceResendingtoken]){
     showSnackBar(context, 'Verification Code sent on the phone number');
     setData(verificationID);
   };
   PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationID){
     showSnackBar(context, 'Timeout');
   };
   try{
     await auth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
   }
   catch(e){
     
   }
 }
 Future<void> signInWithPhoneNumber(String verificationId, String smsCode, BuildContext context)async{
   try{
     AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

     UserCredential userCredential = await auth.signInWithCredential(credential);
     //storeTokenAndData(userCredential);
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=> const CarType()), (route) => false);
     showSnackBar(context, 'Registered Successfully');
   }catch(e){
     showSnackBar(context, e.toString());
   }
 }
void showSnackBar(BuildContext context, String text){
   final snackBar = SnackBar(content: Text(text));
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

}
