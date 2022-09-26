import 'package:flutter/material.dart';
import 'package:flutter_progress/views/about_us.dart';
import 'package:flutter_progress/views/account_details.dart';
import 'package:flutter_progress/views/car_type.dart';
import 'package:flutter_progress/views/notifications_page.dart';
import 'package:flutter_progress/views/payment_info.dart';
import 'package:flutter_progress/views/select_garage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MessageCenter extends StatefulWidget {
  const MessageCenter({super.key});

  @override
  State<MessageCenter> createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  final TextEditingController _text = TextEditingController();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black12,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepOrange,
            padding: const EdgeInsets.all(16),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.person,
                text: 'Account',
                onPressed: () => onItemPressed(context, index: 0),
              ),
              GButton(
                icon: Icons.account_balance_wallet,
                text: 'payment info',
                onPressed: () => onItemPressed(context, index: 1),
              ),
              GButton(
                icon: Icons.notifications_active,
                text: 'notifications',
                onPressed: () => onItemPressed(context, index: 3),
              ),
              GButton(
                icon: Icons.car_repair,
                text: 'Car Profile',
                onPressed: () => onItemPressed(context, index: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountDetails(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PaymentInfo(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CarType(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NotificationPage(),
          ),
        );
        break;
    }
  }
}
