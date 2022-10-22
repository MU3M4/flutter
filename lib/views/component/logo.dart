import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        shape: BoxShape.rectangle,
        color: Colors.black54,
      ),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: Image(
            image: AssetImage('lib/assets/images/splash.jpg'),
            fit: BoxFit.fitWidth),
      ),
    );
  }
}
