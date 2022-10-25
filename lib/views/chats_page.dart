import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/account_details.dart';
import 'package:flutter_progress/views/calls.dart';
import 'package:flutter_progress/views/garage_profile.dart';
import 'package:flutter_progress/views/message.dart';
import 'package:flutter_progress/views/model/usermodel.dart';
import 'package:flutter_progress/views/settings.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});
  // var screens = [
  //   SettingsPage(),
  //   AccountDetails(),
  //   CallsWidget(),
  //   ChatsScreen()
  // ];

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final dref = FirebaseDatabase.instance;
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final ref = dref.ref().child('Garages');

    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Flexible(
            child: FirebaseAnimatedList(
              query: ref,
              defaultChild: const Center(child: CircularProgressIndicator()),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    elevation: 5.0,
                    child: ListTile(
                      title:
                          Text(snapshot.child('GarageName').value.toString()),
                      subtitle:
                          Text(snapshot.child('OfficeNumber').value.toString()),
                      contentPadding: const EdgeInsets.all(20),
                      dense: true,
                      trailing: const Icon(Icons.arrow_forward_ios),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GarageProfile(
                              garageUid: snapshot
                                  .child('OfficeNumber')
                                  .value
                                  .toString(),
                              garageName:
                                  snapshot.child('GarageName').value.toString(),
                            ),
                          ),
                          // MessageCenter(
                          //       garageUid: snapshot
                          //           .child('OfficeNumber')
                          //           .value
                          //           .toString(),
                          //       garageName: snapshot
                          //           .child('GarageName')
                          //           .value
                          //           .toString(),
                          //     )),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigatorBar(),
    );
  }

  BottomNavigationBar buildBottomNavigatorBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        _selectedIndex = value;
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: 'Calls',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.garage), label: 'Garages'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
      ],
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: Colors.deepOrange),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Atta Garages'),
      centerTitle: true,
      elevation: 0,
    );
  }
}

// buildGarage(List<Garage> garages) {
//   ListView.builder(
//       itemCount: garages.length,
//       itemBuilder: (context, index) {
//         final garage = garages[index];
//         return Card(
//           child: ListTile(
//             title: Text(garage.garageName),
//             subtitle: Text(garage.officeNumber),
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: ((context) =>  MessageCenter())));
//             },
//           ),
//         );
//       });

