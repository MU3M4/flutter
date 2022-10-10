import 'package:flutter/material.dart';

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
              Icons.mic,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(
            width: 10,
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.sentiment_satisfied_alt_rounded,
                          color: Colors.deepOrange),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: "Type message", border: InputBorder.none),
                        controller: text,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pin_drop_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.attach_file_outlined),
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
