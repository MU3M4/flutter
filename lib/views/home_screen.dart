import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/calendar/appointment.dart';
import 'package:flutter_progress/views/chats_page.dart';
import 'package:flutter_progress/views/current_location.dart';
import 'package:flutter_progress/views/navigation_drawer.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    configOneSignel();
  }

  void configOneSignel() {
    OneSignal.shared.setAppId('048cb7d8-66ee-4423-999a-d96a5269148a');
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
  
    

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
