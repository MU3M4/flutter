import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MessageCenter extends StatefulWidget {
  const MessageCenter({super.key});

  @override
  State<MessageCenter> createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  final dref = FirebaseDatabase.instance;
  final TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ref = dref.ref().child('Garages');
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage('lib/assets/images/splash.jpg'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '',
                style: TextStyle(fontSize: 10),
              ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.local_phone),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.videocam),
        ),
        const SizedBox(
          width: 10,
        )
      ],
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
    final ref = dref.ref().child('Messages');
    TextEditingController text = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Container(
                  color: Colors.grey,
                  child: Card(
                    elevation: 4.0,
                    child: ListTile(
                      title: Text(
                        snapshot.child('message').value.toString(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ChatInputWidget(text: text),
        ],
      ),
    );
  }
}

class ChatInputWidget extends StatelessWidget {
  const ChatInputWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final TextEditingController text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
          ),
        ],
      ),
      child: SafeArea(
          child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.pin_drop_outlined,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.camera_alt_outlined),
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_today_outlined),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration:  InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(onTap: (){}, child: const Icon(Icons.send)),
                        ),
                        controller: text,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
