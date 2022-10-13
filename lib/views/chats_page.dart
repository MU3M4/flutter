import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/message.dart';
import 'package:flutter_progress/views/model/garage.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepOrange,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
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
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Calls'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('lib/assets/images/splash.jpg'),
            ),
            label: 'Profile'),
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
      title: const Text('Chats'),
      elevation: 0,
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.search),
      //   ),
      
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final dref = FirebaseDatabase.instance;
  // Future<List<Garage>> garagesFuture = getGarages();
  // static Future<List<Garage>> getGarages() async {
  //   const url =
  //       'https://console.firebase.google.com/project/atta-web-app-a5135/database/atta-web-app-a5135-default-rtdb/data/~2FGarages';
  //   final response = await http.get(Uri.parse(url));
  //   final body = json.decode(utf8.decode(response.bodyBytes));
  //   print("body = $body");
  //   return body.map<Garage>(Garage.fromJson).toList();
  // }

  @override
  Widget build(BuildContext context) {
    final ref = dref.ref().child('Garages');
    return Scaffold(
        body:
            //             Center(
            //       child: FutureBuilder<List<Garage>>(
            //         future: garagesFuture,
            //         builder: (context, snapshot) {
            //           if (snapshot.connectionState == ConnectionState.waiting) {
            //             return const CircularProgressIndicator();
            //           } else if (snapshot.hasData) {
            //             final garages = snapshot.data!;
            //             return buildGarage(garages);
            //           } else {
            //             return const Text('No Garages Available');
            //           }
            //         },
            //       ),
            //     ),
            //   );
            // }
            Column(children: [
      // const Text(
      //   'Here is the list of garages:',
      //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      // ),
      const SizedBox(height: 10),
      Flexible(
          child: FirebaseAnimatedList(
              query: ref,
              defaultChild: const CircularProgressIndicator(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(20),
                    child: Card(
                        elevation: 5.0,
                        child: ListTile(
                          title: Text(
                              snapshot.child('GarageName').value.toString()),
                          subtitle: Text(
                              snapshot.child('OfficeNumber').value.toString()),
                          contentPadding: const EdgeInsets.all(20),
                          dense: true,
                          trailing: const Icon(Icons.arrow_forward_ios),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const MessageCenter())));
                          },
                        )));
              }))
    ]));
  }
  //     Center(
  //       child: FutureBuilder<List<Garage>>(
  //         future: garagesFuture,
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return const CircularProgressIndicator();
  //           } else if (snapshot.hasData) {
  //             final garages = snapshot.data!;
  //             return buildGarage(garages);
  //           } else {
  //             return const Text('No Garages Available');
  //           }
  //         },
  //       ),
  //     ),
  //   );
  // }

  buildGarage(List<Garage> garages) {
    ListView.builder(
        itemCount: garages.length,
        itemBuilder: (context, index) {
          final garage = garages[index];
          return Card(
            child: ListTile(
              title: Text(garage.garageName),
              subtitle: Text(garage.officeNumber),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const MessageCenter())));
              },
            ),
          );
        });
  }

  // Widget buildGarages(List<Garage>? garages) => ListView.builder(
  //       itemBuilder: (context, index) {
  //         final garage = garages?[index];

  //         return Card(
  //           child: ListTile(
  //             title: Text(garage.garageName),
  //             subtitle: Text(garage.officeNumber),
  //             onTap: () {
  //               Navigator.of(context).push(MaterialPageRoute(
  //                   builder: ((context) => const MessageCenter())));
  //             },
  //           ),
  //         );
  //       },
  //       physics: const BouncingScrollPhysics(),
  //       itemCount: garages?.length,
  //     );

//Column(
  //   children: [
  //     Flexible(
  //         child: FirebaseAnimatedList(
  //       query: ref,
  //       itemBuilder: (BuildContext context, DataSnapshot snapshot,
  //           Animation<double> animation, int index) {
  //         return Container(
  //             color: Colors.grey[200],
  //             padding: const EdgeInsets.all(20),
  //             child: Card(
  //                 elevation: 10.0,
  //                 child: ListTile(
  //                   title: Text(snapshot.value.toString()),
  //                   contentPadding: const EdgeInsets.all(20),
  //                   dense: true,
  //                   trailing: const Icon(Icons.arrow_forward_ios),
  //                   shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(20)),
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: ((context) => const MessageCenter())));
  //                   },
  //                 )));
  //       },
  //     ))
  //   ],
}
