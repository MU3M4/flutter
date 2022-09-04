import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  double screenHeight = 0;
  double screenWidth = 0;
  String birth = 'Date of birth';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  void pickUploadProfilePic() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 90,
    );
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('${user.userId.toLowerCase()}_profilepic.jpg');
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) async {
      setState(() {
        user.profilePicLink = value;
      });
      await FirebaseFirestore.instance.collection('users').doc(user.id).update({
        'profilePic': value,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                pickUploadProfilePic();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 80, bottom: 24),
                height: 120,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepOrange,
                ),
                child: Center(
                  child: user.profilePicLink == ""
                      ? const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 80,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(user.profilePicLink),
                        ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'User ${user.id}',
                style: const TextStyle(fontSize: 19),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            user.canEdit
                ? textField('First Name', 'First name', firstNameController)
                : field('First Name', user.firstName),
            user.canEdit
                ? textField('Last Name', 'Last name', lastNameController)
                : field('Last Name', user.lastName),
            GestureDetector(
              onTap: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1930),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Colors.black87,
                              secondary: Colors.black87,
                              onSecondary: Colors.white,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black54,
                              ),
                            ),
                            textTheme: const TextTheme(
                              headline4: TextStyle(
                                fontFamily: 'Nexabold',
                              ),
                              overline: TextStyle(
                                fontFamily: 'Nexabold',
                              ),
                              button: TextStyle(
                                fontFamily: 'Nexabold',
                              ),
                            ),
                          ),
                          child: child!);
                    }).then((value) {
                  setState(() {
                    birth = DateFormat("MM/DD/YYYY").format(value!);
                    
                  });
                });
              },
              child: field("Date of Birth", birth),
            ),
            user.canEdit
                ? textField('Address', 'Address', addressController)
                : field('Address', user.address),
            user.canEdit
                ? GestureDetector(
                    onTap: () async {
                      String firstName = firstNameController.text;
                      String lastName = lastNameController.text;
                      String birthDate = birth;
                      String address = addressController.text;

                      if (user.canEdit) {
                        if (firstName.isEmpty) {
                          showSnackBar('Please enter your first name');
                        } else if (lastName.isEmpty) {
                          showSnackBar('Please Enter your last name');
                        } else if (birthDate.isEmpty) {
                          showSnackBar('Please enter your date of birth');
                        } else if (address.isEmpty) {
                          showSnackBar('Please enter your address');
                        } else {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.id)
                              .update({
                            'firstName': firstName,
                            'lastName': lastName,
                            'birthDate': birthDate,
                            'address': address,
                            'canEdit': false,
                          }).then((value) {
                            setState(() {
                              user.canEdit = false;
                              user.firstName = firstName;
                              user.lastName = lastName;
                              user.birthDate = birthDate;
                              user.address = address;
                            });
                          });
                        }
                      } else {
                        showSnackBar(
                            'You can\'t edit anymore please contact customer care');
                      }
                    },
                    child: Container(
                      height: kToolbarHeight,
                      width: screenWidth,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.only(left: 11),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.deepOrange,
                      ),
                      child: const Center(
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget field(String title, String text) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          height: kToolbarHeight,
          width: screenWidth,
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.black54,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget textField(
      String title, String hint, TextEditingController controller) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black54,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black54,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black54,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
        ),
      ),
    );
  }
}
