import 'package:flutter/material.dart';
import 'package:flutter_progress/views/component/chat_input.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            
            itemBuilder: (context, index) => const Text("chat info")),
          ),
        
        ChatInputWidget(text: text),
      ],
    );
  }
}
