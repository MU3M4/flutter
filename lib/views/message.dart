import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class messageCenter extends StatefulWidget {
  const messageCenter({super.key});

  @override
  State<messageCenter> createState() => _messageCenterState();
}

class _messageCenterState extends State<messageCenter> {
  TextEditingController _text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            const Text(
              'Car Problem Description',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _text,
                minLines: 2,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'Enter your car problem description',
                  hintStyle: TextStyle(color: Colors.deepOrange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_text.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg:
                          'Please input your car problem description to proceed');
                } else {
                  Fluttertoast.showToast(msg: 'Message Successfully sent');

                  _text.text;

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const SelectGarage())));
                  // try {
                  //   User user = FirebaseAuth.instance.currentUser!;
                  //   ref.child(user.uid).set({
                  //     'message': _text,
                  //   });
                  // } catch (e) {
                  //   Fluttertoast.showToast(msg: 'Something went wrong');
                  // }

                }
              },
              child: const Text('Get Mechanic'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black12,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepOrange,
            padding: EdgeInsets.all(16),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.person,
                text: 'Account',
              ),
              GButton(
                icon: Icons.account_balance_wallet,
                text: 'payment info',
              ),
              GButton(
                icon: Icons.notifications_active,
                text: 'notifications',
              ),
              GButton(
                icon: Icons.car_repair,
                text: 'Car Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
