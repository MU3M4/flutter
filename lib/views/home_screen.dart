import 'package:flutter/material.dart';
import 'package:flutter_progress/views/current_location.dart';
import 'package:flutter_progress/views/map_screen.dart';
import 'package:flutter_progress/views/search.dart';
import 'package:flutter_progress/views/widgets/actions_container_small.dart';
import 'package:flutter_progress/views/widgets/actions_containers_large.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'location_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Database db;
  // List docs = [];
  // initialise() {
  //   db = Database();
  //   db.initiliase();
  //   db.read().then((value) => {
  //         setState(() {
  //           docs = value;
  //         })
  //       });
  // }

  // @override
  // void initState() {
  //   initialise();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'lib/assets/images/splash.jpg',
            height: 70,
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: ActionContainerLarge(
                        img: 'lib/assets/images/appointment.jpeg',
                        title: 'Appointment'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ActionContainerLarge(
                        img: 'lib/assets/images/fix.jpeg', title: 'Fix Car'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(
                    child: ActionContainersSmall(
                      img: 'lib/assets/images/bus.jpg',
                      title: 'Car Profile',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ActionContainersSmall(
                      img: 'lib/assets/images/suv.jpg',
                      title: 'Car Profile',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ActionContainersSmall(
                      img: 'lib/assets/images/suv.jpg',
                      title: 'Car Profile',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ActionContainersSmall(
                      img: 'lib/assets/images/car.jpg',
                      title: 'Car Profile',
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CurrentLocation(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                autofocus: false,
                showCursor: false,
                decoration: InputDecoration(
                  hintText: 'Where to?',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 24),
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: InputBorder.none,
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: ((context) => const MapScreen())));
              //     },
              //     child: const Text('Google Maps'))
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: const GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.grey,
              tabBackgroundColor: Colors.white10,
              padding: EdgeInsets.all(16),
              gap: 6,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(icon: Icons.account_box, text: 'Account'),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.map,
                  text: 'Map',
                ),
              ],
            ),
            
          ),
        ));
  }
}
