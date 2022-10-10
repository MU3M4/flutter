import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/calendar/appointment.dart';
import 'package:flutter_progress/views/chats_page.dart';
import 'package:flutter_progress/views/current_location.dart';
import 'package:flutter_progress/views/message.dart';
import 'package:flutter_progress/views/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;
ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.orange,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
);
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
);
final fb = FirebaseDatabase.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    TextEditingController _text = TextEditingController();
    final ref = fb.ref().child('Attausers/servicesrequired');
    void insertData(String text) {
      ref.child(user.uid).set({
        'message': _text,
      });
      _text.clear();
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('A T T A'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.deepOrange,
        ),
        drawer: NavigationDrawer(),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.deepOrange,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.deepOrange,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ChatsScreen(),
                  CurrentLocation(),
                  AppointmentDetails(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
