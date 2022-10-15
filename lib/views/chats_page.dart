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

  @override
  Widget build(BuildContext context) {
    final ref = dref.ref().child('Garages');
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                                builder: ((context) => const MessageCenter())));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

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
}
