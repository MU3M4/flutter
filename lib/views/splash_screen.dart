import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_progress/views/component/logo.dart';
import 'package:flutter_progress/views/component/termsandconditions.dart';

import 'component/LetsStart.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

//   @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage('lib/assets/images/splash.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
            color: Colors.black.withOpacity(0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Logo(),
                LetsStart(),
              ],
            )),
      ),
    );
  }
}
