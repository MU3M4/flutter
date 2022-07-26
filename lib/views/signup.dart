// import 'dart:html';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_progress/views/login_view.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../main.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   // final FirebaseApp app;

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final referenceDatabase = FirebaseDatabase.instance;
//   final _fname = TextEditingController();
//   final phone = TextEditingController();
//   final email = TextEditingController();
//   final pwd = TextEditingController();
//   final cpwd = TextEditingController();
//   // String _lname, _fname;

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final ref = referenceDatabase.ref();
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Details'),
//         centerTitle: true,
        
        
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           // UserImage(onFileChanged: (imageUrl) {
//           //   setState(() {
//           //     this.imageUrl = imageUrl;
//           //   });
//           // }),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 //first name textformfield
//                 TextFormField(
//                   controller: _fname,
//                   //used to check on whether the textformfield is empty and return a message to the user.
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'please enter first name';
//                     }
//                     return null;
//                   },

//                   enableSuggestions: false,
//                   autocorrect: false,
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                     //sets the icon giving the user a hint
//                     prefixIcon: const Icon(Icons.account_circle),
//                     hintText: 'First Name',
//                     contentPadding:
//                         const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(color: Colors.orange),
//                     ),
//                   ),

//                   textInputAction: TextInputAction.next,
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 //last name textfield
//                 TextFormField(
//                   controller: phone,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'please enter your phone number';
//                     }
//                     return null;
//                   },
//                   enableSuggestions: false,
//                   autocorrect: false,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.phone),
//                     hintText: 'Phone Number',
//                     contentPadding:
//                         const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(color: Colors.orange),
//                     ),
//                   ),
//                   textInputAction: TextInputAction.next,
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 // email textformfield
//                 TextFormField(
//                   controller: email,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'please enter email address';
//                     }
//                     //regular expression validates the format of the email address
//                     if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                         .hasMatch(value)) {
//                       return 'please enter a valid email address';
//                     }
//                     return null;
//                   },
//                   enableSuggestions: false,
//                   autocorrect: false,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.mail),
//                     hintText: 'Email',
//                     contentPadding:
//                         const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(color: Colors.orange),
//                     ),
//                   ),
//                   textInputAction: TextInputAction.next,
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 //password field
//                 TextFormField(
//                   controller: pwd,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'please enter your password';
//                     }
//                     return null;
//                   },
//                   enableSuggestions: false,
//                   autocorrect: false,
//                   obscureText: true,
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.lock),
//                     hintText: 'Password',
//                     contentPadding:
//                         const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(color: Colors.orange),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 //confirm password field
//                 TextFormField(
//                   controller: cpwd,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'please confirm your password';
//                     }
//                     if (pwd != cpwd) {
//                       return 'passwords do not match';
//                     }
//                     return null;
//                   },
//                   enableSuggestions: false,
//                   autocorrect: false,
//                   obscureText: true,
//                   textInputAction: TextInputAction.done,
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.lock),
//                     hintText: 'Confirm Password',
//                     contentPadding:
//                         const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(color: Colors.orange),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(
//                   height: 25,
//                 ),
//                 ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Uploading Data')));
//                         if (_fname.text.length < 4) {
//                           displayToastMessage(
//                               "name must be at least three characters",
//                               context);
//                         } else if (email.text.contains("@")) {
//                           displayToastMessage("Email is not valid", context);
//                         } else if (phone.text.isEmpty) {
//                           displayToastMessage(
//                               "Phone number is mandatory", context);
//                         } else if (pwd.text.length < 7) {
//                           displayToastMessage(
//                               "Password must be at least 6 characters",
//                               context);
//                         } else {
//                           registerUser(context);
//                           FirebaseAuth.instance
//                               .authStateChanges()
//                               .listen((User? user) {
//                             if (user == null) {
//                               print('User is currently signed out!');
//                             } else {
//                               print('User is signed in!');
//                             }
//                           });
//                         }
//                         users
//                             .add({
//                               "fname": fname,
//                               "lname": lname,
//                               "email": email,
//                               "pwd": pwd
//                             })
//                             .then((value) => print("User is added"))
//                             .catchError(
//                                 (error) => print("Failed to Add User: $error"));

//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: ((context) => const LoginView()),
//                           ),
//                         );
//                       } else {
//                         print('unsuccessful');
//                       }
//                     },
//                     child: const Text('Next'))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   void registerUser(BuildContext context) async {
//     try {
//   final User firebaseUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: email.text,
//     password: pwd.text,
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     print('The password provided is too weak.');
//   } else if (e.code == 'email-already-in-use') {
//     print('The account already exists for that email.');
//   }
// } catch (e) {
//   print(e);
// }
// final User firebaseUser =
 
//       await _firebaseAuth.createUserWithEmailAndPassword(email: email.text.trim(), password: pwd.text.trim());
      
//      on FirebaseAuthException catch(e) {
//       return e.message;
//     }
//   try {
//   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: "",
//     password: ""
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     print('The password provided is too weak.');
//   } else if (e.code == 'email-already-in-use') {
//     print('The account already exists for that email.');
//   }
// } catch (e) {
//   print(e);
// }
//     // final User firebaseUser = (await _firebaseAuth
//     //         .createUserWithEmailAndPassword(
//     //             email: email.text.trim(), password: pwd.text.trim())
//     //         .catchError((errMsg) {
//     //   displayToastMessage("Error:" + errMsg.toString(), context);
//     // }))
//     //     .User;

//     if (User != null) {
//       //save info to database

//       Map UserDataMap = {
//         "name": _fname.text.trim(),
//         "email": email.text.trim(),
//         "phone": phone.text.trim(),
//         "password": pwd.text.trim(),
//       };
//       // usersRef.child(firebaseUser.uid).set(UserDataMap);
//       displayToastMessage(
//           "Congratulations, your account has been created", context);
//       Navigator.push(context,
//           MaterialPageRoute(builder: ((context) => const LoginView())));
//     } else {
//       //error occured display error message
//       displayToastMessage("User has not been created", context);
//     }
//   }
// }

// displayToastMessage(String message, BuildContext context) {
//   Fluttertoast.showToast(msg: message);
// }

// //   }