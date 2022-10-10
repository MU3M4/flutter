import 'package:flutter/material.dart';

import 'component/message_body.dart';

class MessageCenter extends StatefulWidget {
  const MessageCenter({super.key});

  @override
  State<MessageCenter> createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  final TextEditingController _text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
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
                'Mash Auto',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3 mins ago",
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
        const SizedBox(width: 10,)
      ],
      
    );
  }
}
