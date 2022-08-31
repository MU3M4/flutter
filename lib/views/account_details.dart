import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/ItemDetails.dart';
import 'package:flutter_progress/views/auth/auth.dart';

class AccountDetails extends StatelessWidget {
  AccountDetails({Key? key}) : super(key: key) {
    _stream = reference.snapshots();
  }

  CollectionReference reference =
      FirebaseFirestore.instance.collection('users');
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(height: 10),
            MaterialButton(
                padding: const EdgeInsets.all(10),
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: () {
                  signOut();
                }),
          ],
        ),
      ),
    );
  }
}
