import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/about_us.dart';
import 'package:flutter_progress/views/account_details.dart';
import 'package:flutter_progress/views/car_profile.dart';
import 'package:flutter_progress/views/drawer_items.dart';
import 'package:flutter_progress/views/settings.dart';

import 'car_type.dart';

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
          DrawerItems(
            name: 'Personal Details',
            icon: Icons.contact_mail,
            onPressed: () => onItemPressed(context, index: 0),
          ),
          const SizedBox(height: 20),
          // DrawerItems(
          //   name: 'Settings',
          //   icon: Icons.settings,
          //   onPressed: () => onItemPressed(context, index: 1),
          // ),
          // const SizedBox(height: 20),
          DrawerItems(
            name: 'Car Profile',
            icon: Icons.dark_mode,
            onPressed: () => onItemPressed(context, index: 2),
          ),
          const SizedBox(height: 20),
          // DrawerItems(
          //   name: 'About Us',
          //   icon: Icons.home,
          //   onPressed: () => onItemPressed(context, index: 3),
          // ),
          // const SizedBox(height: 20),
          DrawerItems(
            name: 'logout',
            icon: Icons.logout,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirmation'),
                      content: const Text("Are you sure you want to log out?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('No')),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              FirebaseAuth.instance.signOut();
                            },
                            child: const Text('Yes')),
                      ],
                    );
                  });
            },
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const CarType()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AboutUs()));
        break;
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Signed in as: ${user.email!}',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
