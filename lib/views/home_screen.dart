import 'package:flutter/material.dart';
import 'package:flutter_progress/views/map_screen.dart';
import 'package:flutter_progress/views/search.dart';
import 'package:flutter_progress/views/widgets/actions_container_small.dart';
import 'package:flutter_progress/views/widgets/actions_containers_large.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          '',
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
        child: Column(children: [
          Row(
            children: const [
              Expanded(
                child: ActionContainerLarge(
                    img: 'assets/images/appointment.jpeg',
                    title: 'Appointment'),
              ),
              SizedBox(width: 20),
              Expanded(
                child: ActionContainerLarge(
                    img: 'assets/images/fix.jpeg', title: 'Fix Car'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                child: ActionContainersSmall(
                  img: '',
                  title: 'Car Profile',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ActionContainersSmall(
                  img: '',
                  title: 'Car Profile',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ActionContainersSmall(
                  img: '',
                  title: 'Car Profile',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ActionContainersSmall(
                  img: '',
                  title: 'Car Profile',
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchScreen(startPosition: null, endPosition: null,),
              fullscreenDialog: true,
              ),
              );
            },
            autofocus: false,
            showCursor: false,
            decoration: InputDecoration(
              hintText: 'Where to?',
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              filled: true,
              fillColor: Colors.grey[300],
              border: InputBorder.none,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const MapScreen())));
              },
              child: const Text('Google Maps'))
        ]),
      ),
    );
  }
}
