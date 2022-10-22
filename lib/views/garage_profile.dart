import 'package:flutter/material.dart';
import 'package:flutter_progress/views/calendar/appointment.dart';
import 'package:flutter_progress/views/message.dart';

class GarageProfile extends StatelessWidget {
  const GarageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(29.0),
              child: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                radius: 63,
              ),
            ),
            const Spacer(flex: 2),
            Container(
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Call'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      // //    builder: (context) => MessageCenter(currentUser: Widget.user, garageName: snapshot.child('GarageName').value.toString(), ),
                      //   ),
                      // );
                    },
                    child: const Text('Text'),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppointmentDetails(),
                      ),
                    );
                  },
                  child: const Text('Book An Appointment'),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Call Mechanic'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Go To Garage'),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
