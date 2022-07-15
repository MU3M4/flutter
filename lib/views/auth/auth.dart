import 'package:firebase_auth/firebase_auth.dart';

import '../database.dart';


class AuthEnt {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User> getCurrentUser() async {
    return await auth.currentUser!;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String imageURL, String username) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    Map<String, dynamic> userInfoMap = {
      "email": email,
      "password": password,
      "username": username,
      "imgUrl": imageURL,
    };
    if (userCredential != null) {
      DatabaseMethods().addUserInfoToDB(auth.currentUser!.uid, userInfoMap);
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
