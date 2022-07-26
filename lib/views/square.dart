import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  final String child;
   const MySquare({Key? key, required this.child}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 200,
          color: Colors.deepOrange[200],
          child: Center(child: Text(child, style: const TextStyle(fontSize: 30))),
        ),
      );
      
      
    
  }
}
