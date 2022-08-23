import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/about_us.dart';
import 'package:flutter_progress/views/account_details.dart';
import 'package:flutter_progress/views/car_profile.dart';
import 'package:flutter_progress/views/chats_page.dart';
import 'package:flutter_progress/views/drawer_items.dart';
import 'package:flutter_progress/views/settings.dart';

class NavigationDrawer extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser!;

   NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
        child: Material(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 70, 14, 0),
        child: Column(children: [
          headerWidget(),
          DrawerItems(
            name: 'account',
            icon: Icons.person,
            onPressed: () => onItemPressed(context, index: 0),
          ),

          DrawerItems(
            name: 'Settings',
            icon: Icons.settings,
            onPressed: () => onItemPressed(context, index: 1),
          ),
          DrawerItems(
            name: 'Car Profile',
            icon: Icons.car_repair,
            onPressed: () => onItemPressed(context, index: 2),
          ),
          DrawerItems(
            name: 'About Us',
            icon: Icons.home,
            onPressed: () => onItemPressed(context, index: 3),
          ),
          DrawerItems(
            name: 'logout',
            icon: Icons.logout,
            onPressed: () {FirebaseAuth.instance.signOut();},
          ),
        ]),
      ),
    ));
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AccountDetails()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SettingsPage()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CarProfile()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AboutUs()));
        break;

    }
  }

  Widget headerWidget() {
    const url = 'https://unsplash.com/photos/2LowviVHZ-E';
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              'Signed in as: ' + user.email!,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
