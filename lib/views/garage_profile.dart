import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_progress/views/calendar/appointment.dart';
import 'package:flutter_progress/views/current_location.dart';
import 'package:flutter_progress/views/message.dart';
import 'package:flutter_progress/views/tracking.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GarageProfile extends StatefulWidget {
  final String garageUid;
  final String garageName;
  const GarageProfile(
      {super.key, required this.garageUid, required this.garageName});

  @override
  State<GarageProfile> createState() =>
      _GarageProfileState(this.garageUid, this.garageName);
}

class _GarageProfileState extends State<GarageProfile> {
  final String garageUid;
  final String garageName;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final double coverHeight = 280;
  final double profileHeight = 144;

  _GarageProfileState(this.garageUid, this.garageName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 100,
            child: buildProfileImage(),
          ),
          Positioned(
            top: 250,
            child: Column(
              children: [
                Text(
                  garageName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Center(
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(garageUid);
                        },
                        child: const Text('Call'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => MessageCenter(
                                      garageUid: garageUid,
                                      garageName: garageName))));
                        },
                        child: const Text('Text'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AppointmentDetails())));
              },
              child: const Text('Book Appointment'),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TrackProgress()));
                  },
                  child: const Text('Call Mechanic'),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CurrentLocation()));
                  },
                  child: const Text('Go to Garage'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage:
            const NetworkImage('https://jooinn.com/images/business-4.jpg'),
      );
}
