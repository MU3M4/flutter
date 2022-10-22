import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import 'package:flutter_chat_ui/flutter_chat_ui.dart';


import 'model/usermodel.dart';

class MessageCenter extends StatelessWidget {
  // final String garageName;
  // final String garageId;

  // const MessageCenter({
  //   required this.garageName,
  //   required this.garageId,
  // });

  @override
  Widget build(BuildContext context) {
   final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(80),
              //   child: Image.network(garageImage, height: 40),
              // ),
             
              Text(
              '',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Container(),
              ),
            ),
            
          ],
        ));
  }
}
