import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ActionContainerLarge extends StatelessWidget {
  const ActionContainerLarge({Key? key, required this.title, required this.img}) : super(key: key);
  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(height: 100,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(img, height: 50),
          ],
        ),
        Row(
          children: [
            Text(title, 
            style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        )],
      ),
    )
    );
  }
}
